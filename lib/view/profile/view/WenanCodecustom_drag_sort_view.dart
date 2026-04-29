import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: DragSortView.
 * @Date: 2020/06/16
 */

/// DragBean
class CustomDragBean {
  CustomDragBean({
    this.index = 0,
    this.selected = false,
    this.isBeFirst = true
  });

  int index;
  bool selected;
  bool isBeFirst;
}

/// on drag listener.
/// if return true, delete drag index child image. default return false.
typedef CustomOnDragListener = bool Function(CustomMotionEvent event, double itemWidth);
typedef CustomOnClickListener = void Function(int index);

/// Object used to report movement events.
class CustomMotionEvent {
  static const int actionDown = 0;
  static const int actionUp = 1;
  static const int actionMove = 2;

  /// action.
  int? action;

  /// drag index.
  int? dragIndex;

  /// the global x coordinate system in logical pixels.
  double? globalX;

  /// the global y coordinate system in logical pixels.
  double? globalY;
}

/// Drag sort view.
/// Similar to the dynamic nine grid of weiBo / weChat publishing.
/// It supports pressing the zoom effect, dragging and sorting, and dragging to the specified location to delete.
class CustomDragSortView extends StatefulWidget {
  /// create DragSortView.
  /// It is recommended to use a thumbnail picture，because the original picture is too large, it may cause repeated loading and cause flashing.
  /// 建议使用略微缩图，因为原图太大可能会引起重复加载导致闪动.
  CustomDragSortView(
    this.data, {
    Key? key,
    this.width,
    this.space = 5,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    required this.itemBuilder,
    required this.initBuilder,
    this.onDragListener,
    this.onItemClick
  }) : super(key: key);

  /// picture data.
  List<CustomDragBean> data;

  /// View width.
  final double? width;

  /// The number of logical pixels between each child.
  final double space;

  /// View padding.
  final EdgeInsets padding;

  /// View margin.
  final EdgeInsets margin;

  /// Called to build children for the view.
  final IndexedWidgetBuilder itemBuilder;

  /// Called to build init children for the view.
  final WidgetBuilder initBuilder;

  /// On drag listener.
  final CustomOnDragListener? onDragListener;
  final CustomOnClickListener? onItemClick;

  @override
  State<StatefulWidget> createState() {
    return CustomDragSortViewState();
  }
}

class CustomDragSortViewState extends State<CustomDragSortView>
    with TickerProviderStateMixin {
  /// child transposition anim.
  late AnimationController _controller;

  /// child zoom anim.
  late AnimationController _zoomController;

  /// child float anim.
  late AnimationController _floatController;

  /// child positions.
  List<Rect> _positions = [];

  /// cache data.
  List<CustomDragBean> _cacheData = [];

  /// drag child index.
  int _dragIndex = -1;
  int _moveIndex = -1;

  /// drag child bean.
  CustomDragBean? _dragBean;

  /// MotionEvent
  CustomMotionEvent _motionEvent = CustomMotionEvent();

  /// overlay entry.
  static OverlayEntry? _overlayEntry;

  /// child count.
  int _itemCount = 0;

  /// child width.
  double _itemWidth = 0;
  double _itemHeight = 0;

  Offset _downGlobalPos = Offset.zero;
  double _downLeft = 0;
  double _downTop = 0;
  double _floatLeft = 0;
  double _floatTop = 0;
  double _fromTop = 0;
  double _fromLeft = 0;
  double _toTop = 0;
  double _toLeft = 0;

  List<CustomDragBean>? beforeList;


  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _zoomController =
        AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    _floatController =
        AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _controller.addListener(() {
      Utils.callSetStateSafely(this, () {});
    });
    _zoomController.addListener(() {
      _updateOverlay();
    });
    _floatController.addListener(() {
      _floatLeft =
          _toLeft + (_fromLeft - _toLeft) * (1 - _floatController.value);
      _floatTop = _toTop + (_fromTop - _toTop) * (1 - _floatController.value);
      _updateOverlay();
    });
    _floatController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _clearAll();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _zoomController.dispose();
    _floatController.dispose();
    _removeOverlay();
    super.dispose();
  }

  /// init child size and positions.
  void _init(BuildContext context, EdgeInsets padding, EdgeInsets margin) {
    double space = widget.space;
    double width =
        widget.width ?? (MediaQuery.of(context).size.width - margin.horizontal);
    width = width - padding.horizontal;
    _itemWidth = (width - space * 2) / 3;
    _itemHeight = _itemWidth*1.35;
    _positions.clear();
    for (int i = 0; i < 6; i++) {
      double left = (space + _itemWidth) * (i % 3);
      double top = (space + _itemHeight) * (i ~/ 3);
      _positions.add(Rect.fromLTWH(left, top, _itemWidth, _itemHeight));
    }
  }

  RenderBox? _getRenderBox(BuildContext context) {
    RenderObject? renderObject = context.findRenderObject();
    RenderBox? box;
    if (renderObject != null) {
      box = renderObject as RenderBox;
    }
    return box;
  }

  /// get widget global coordinate system in logical pixels.
  Offset _getWidgetLocalToGlobal(BuildContext context) {
    RenderBox? box = _getRenderBox(context);
    return box == null ? Offset.zero : box.localToGlobal(Offset.zero);
  }

  /// get drag index.
  int _getDragIndex(Offset offset) {
    for (int i = 0; i < _itemCount; i++) {
      if (_positions[i].contains(offset)) {
        return i;
      }
    }
    return -1;
  }

  /// init child index.
  void _initIndex() {
    for (int i = 0; i < _itemCount; i++) {
      widget.data[i].index = i;
    }
    _cacheData.clear();
    _cacheData.addAll(widget.data);
  }

  /// add overlay.
  void _addOverlay(BuildContext context, Widget overlay) {
    OverlayState? overlayState = Overlay.of(context);
    if (overlayState == null) return;
    double space = widget.space;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(builder: (BuildContext context) {
        return Positioned(
            left: _floatLeft - space * _zoomController.value,
            top: _floatTop - space * _zoomController.value,
            child: Material(
              color: Colors.transparent,
              shadowColor: Colors.transparent,
              child: Container(
                width: _itemWidth + space * _zoomController.value * 2,
                height: _itemHeight + space * _zoomController.value * 2,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: overlay,
              ),
            ));
      });
      overlayState.insert(_overlayEntry!);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry?.markNeedsBuild();
    }
    _zoomController.reset();
    _zoomController.forward();
  }

  /// update overlay.
  void _updateOverlay() {
    _overlayEntry?.markNeedsBuild();
  }

  /// remove overlay.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// get next child index.
  int _getNextIndex(Rect curRect, Rect origin) {
    if (_itemCount == 1) return 0;
    bool outside = true;
    int i= 0;
    if(!widget.data[_dragIndex].isBeFirst){
      i =1;
    }
    for (i; i < _itemCount; i++) {
      Rect rect = _positions[i];
      bool overlaps = rect.overlaps(curRect);
      if (overlaps) {
        outside = false;
        Rect over = rect.intersect(curRect);
        Rect ori = origin.intersect(curRect);
        if (_getRectArea(over) > _itemWidth * _itemWidth / 2 ||
            _getRectArea(over) > _getRectArea(ori)) {
          return i;
        }
      }
    }
    AuvChatLog.d("DragSortView GestureDetector _getNextIndex outside$outside");
    int index = -1;
    if (outside) {
      if (curRect.bottom < 0) {
        index = _checkIndexTop(curRect);
      } else if (curRect.top > _itemHeight) {
        index = _checkIndexBottom(curRect);
      }
    }
    return index;
  }

  /// get area.
  double _getRectArea(Rect rect) {
    return rect.width * rect.height;
  }

  /// check top index.
  int _checkIndexTop(Rect other) {
    int index = -1;
    double? area;
    for (int i = 0; (i < 3 && i < _itemCount); i++) {
      Rect rect = _positions[i];
      Rect over = rect.intersect(other);
      double _area = _getRectArea(over);
      if (area == null || _area <= area) {
        area = _area;
        index = i;
      }
    }
    return index;
  }

  /// check bottom index.
  int _checkIndexBottom(Rect other) {
    int tagIndex = -1;
    double? area;
    for (int i = 0; (i < 3 && i < _itemCount); i++) {
      Rect _rect = _positions[i];
      Rect over = _rect.intersect(other);
      double _area = _getRectArea(over);
      if (area == null || _area <= area) {
        area = _area;
        tagIndex = i;
      }
    }
    if (tagIndex != -1) {
      for (int i = _itemCount - 1; i >= 0; i--) {
        if (((i + 1) / 3).ceil() >= (((_dragIndex + 1) / 3).ceil()) &&
            (i % 3 == tagIndex)) {
          return i;
        }
      }
    }
    return -1;
  }

  /// clear all.
  void _clearAll() {
    _removeOverlay();
    _cacheData.clear();
    int count = math.min(6, widget.data.length);
    for (int i = 0; i < count; i++) {
      widget.data[i].index = i;
      widget.data[i].selected = false;
    }
    Utils.callSetStateSafely(this, () {});
  }

  /// trigger drag event.
  bool _triggerDragEvent(int action) {
    if (widget.onDragListener != null && _dragIndex != -1) {
      _motionEvent.dragIndex = _dragIndex;
      _motionEvent.action = action;
      _motionEvent.globalX = _floatLeft;
      _motionEvent.globalY = _floatTop;
      return widget.onDragListener!(_motionEvent, _itemWidth);
    }
    return false;
  }

  Offset? clickOffset;

  /// build child.
  Widget _buildChild(BuildContext context) {
    List<Widget> children = [];
    if (_cacheData.isEmpty) {
      for (int i = 0; i < _itemCount; i++) {
        children.add(
          Positioned.fromRect(
            rect: _positions[i],
            child: widget.itemBuilder(context, i),
          ),
        );
      }
    } else {
      for (int i = 0; i < _itemCount; i++) {
        int curIndex = widget.data[i].index;
        int lastIndex = _cacheData[i].index;
        double left = _positions[curIndex].left +
            (_positions[lastIndex].left - _positions[curIndex].left) *
                _controller.value;
        double top = _positions[curIndex].top +
            (_positions[lastIndex].top - _positions[curIndex].top) *
                _controller.value;
        children.add(Positioned(
          left: left,
          top: top,
          width: _itemWidth,
          height: _itemHeight,
          child: Offstage(
            offstage: widget.data[i].selected == true,
            child: widget.itemBuilder(context, i),
          ),
        ));
      }
    }

    if (_itemCount < 6) {
      children.add(Positioned.fromRect(
        rect: _positions[_itemCount],
        child: widget.initBuilder(context),
      ));
    }
    return Stack(
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    _itemCount = math.min(6, widget.data.length);
    EdgeInsets padding = widget.padding;
    EdgeInsets margin = widget.margin;
    if (_itemWidth == 0) {
      _init(context, padding, margin);
    }

    int column = (_itemCount > 3 ? 3 : _itemCount + 1);
    int row = ((_itemCount + (_itemCount < 6 ? 1 : 0)) / 3).ceil();
    double realWidth =
        _itemWidth * column + widget.space * (column - 1) + padding.horizontal;
    double realHeight =
        _itemHeight * row + widget.space * (row - 1) + padding.vertical;
    double left = margin.left + padding.left;
    double top = margin.top + padding.top;

    return GestureDetector(
      onTapDown: (e)=> clickOffset = e.localPosition,
      onTap: (){
        AuvChatLog.d("DragSortView GestureDetector onTapDown");
        if(widget.onItemClick != null){
          Offset offset = _getWidgetLocalToGlobal(context);
          int clickIndex = _getDragIndex(clickOffset! - Offset(left, top));
          AuvChatLog.d("DragSortView GestureDetector onTab index : $clickIndex  offset $offset");
          widget.onItemClick!(clickIndex);
        }
      },
      onLongPressStart: (LongPressStartDetails details) {
        beforeList ??= [];
        beforeList?.clear();
        beforeList?.addAll(widget.data);
        AuvChatLog.d("DragSortView GestureDetector onLongPressStart");
        Offset offset = _getWidgetLocalToGlobal(context);
        _dragIndex = _getDragIndex(details.localPosition - Offset(left, top));
        if (_dragIndex <1 ) return;//头像不可以长按被拖拽
        _initIndex();
        widget.data[_dragIndex].selected = true;
        _dragBean = widget.data[_dragIndex];
        _downGlobalPos = details.globalPosition;
        _downLeft = left + _positions[_dragIndex].left;
        _downTop = top + _positions[_dragIndex].top;
        _toLeft = offset.dx + left + _positions[_dragIndex].left;
        _toTop = offset.dy + top + _positions[_dragIndex].top;
        _floatLeft = _toLeft;
        _floatTop = _toTop;
        Widget overlay = widget.itemBuilder(context, _dragIndex);
        _addOverlay(context, overlay);
        _triggerDragEvent(CustomMotionEvent.actionDown);
        Utils.callSetStateSafely(this, () {});
      },
      onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {

        if (_dragIndex == -1) return;
        _floatLeft = _toLeft + (details.globalPosition.dx - _downGlobalPos.dx);
        _floatTop = _toTop + (details.globalPosition.dy - _downGlobalPos.dy);

        double left =
            _downLeft + (details.globalPosition.dx - _downGlobalPos.dx);
        double top = _downTop + (details.globalPosition.dy - _downGlobalPos.dy);
        Rect cRect = Rect.fromLTWH(left, top, _itemWidth, _itemHeight);
        int index = _getNextIndex(cRect, _positions[_dragIndex]);
        var dragData = widget.data[_dragIndex];
        AuvChatLog.d("DragSortView onLongPressMoveUpdate index:$index _dragIndex:$_dragIndex dragData:${dragData.isBeFirst}");
        if (index != -1 && _dragIndex != index) {
          int position= _dragIndex;
          _moveIndex = position;
          _dragIndex = index;
          _initIndex();
          // _moveIndex = widget.data.indexOf(_dragBean!);
          widget.data.remove(_dragBean);
          widget.data.insert(_dragIndex, _dragBean!);
          _controller.reset();
          _controller.forward();
        }
        _updateOverlay();
        _triggerDragEvent(CustomMotionEvent.actionMove);
      },
      onLongPressEnd: (LongPressEndDetails details) {
        AuvChatLog.d("DragSortView GestureDetector onLongPressEnd");
        if (_dragIndex == -1) return;
        _fromLeft = _toLeft + (details.globalPosition.dx - _downGlobalPos.dx);
        _fromTop = _toTop + (details.globalPosition.dy - _downGlobalPos.dy);
        Offset offset = _getWidgetLocalToGlobal(context);
        _toLeft = offset.dx + left + _positions[_dragIndex].left;
        _toTop = offset.dy + top + _positions[_dragIndex].top;
      },
      onLongPressUp: () {
        bool isCatch = _triggerDragEvent(CustomMotionEvent.actionUp);
        if (isCatch) {
          widget.data.removeAt(_dragIndex);
          _clearAll();
        } else {
          _floatController.reset();
          _floatController.forward();
        }
        _dragBean = null;
      },
      child: Container(
        width: realWidth,
        height: realHeight,
        margin: margin,
        padding: padding,
        child: _buildChild(context),
      ),
    );
  }
}
