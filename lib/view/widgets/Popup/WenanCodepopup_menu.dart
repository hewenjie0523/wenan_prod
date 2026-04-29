library popup_menu;

import 'dart:core';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'WenanCodetriangle_painter.dart';

abstract class MenuItemProvider {
  late Size menuSize;

  String? get menuTitle;

  Widget? get menuImage;

  TextStyle get menuTextStyle;

  TextAlign get menuTextAlign;
}

class MenuItem extends MenuItemProvider {
  int id;
  Widget? image; // 图标名称
  String? title; // 菜单标题
  dynamic userInfo; // 额外的菜单荐信息
  TextStyle? textStyle;
  TextAlign? textAlign;

  MenuItem({
    required this.id,
    this.title,
    this.image,
    this.userInfo,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget? get menuImage => image;

  @override
  String? get menuTitle => title;

  @override
  TextStyle get menuTextStyle =>
      textStyle ?? const TextStyle(color: Color(0xffc5c5c5), fontSize: 10.0);

  @override
  TextAlign get menuTextAlign => textAlign ?? TextAlign.center;
}

typedef MenuClickCallback = Function(MenuItemProvider item);
typedef PopupMenuStateChanged = Function(bool isShow);

class PopupMenu {
  late OverlayEntry _entry;
  List<MenuItemProvider>? items;

  late bool _inOneLine;
  late bool _calcItemSize;

  late double _itemHeight;
  late double _itemWidth;
  late double _arrowHeight;
  late double _itemVPadding;
  late double _itemHPadding;


  /// row count
  late int _row;

  /// col count
  late int _col;

  /// The left top point of this menu.
  late Offset _offset;

  /// Menu will show at above or under this rect
  late Rect _showRect;

  /// if false menu is show above of the widget, otherwise menu is show under the widget
  bool _isDown = true;

  /// The max column count, default is 4.
  late int _maxColumn;

  /// callback
  VoidCallback? dismissCallback;
  MenuClickCallback? onClickMenu;
  PopupMenuStateChanged? stateChanged;

  late Size _screenSize; // 屏幕的尺寸

  /// Cannot be null
  late BuildContext context;

  /// style
  late Color _backgroundColor;
  late Color _highlightColor;
  late Color _lineColor;

  /// It's showing or not.
  bool _isShow = false;

  bool get isShow => _isShow;

  PopupMenu(
      {MenuClickCallback? onClickMenu,
      required BuildContext context,
      VoidCallback? onDismiss,
      int maxColumn = 4,
      bool inOneLine = true,
      bool calcItemSize = true,
      double itemWidth = 72.0,
      double itemHeight = 65.0,
      double arrowHeight = 10.0,
      double itemHPadding = 15.0,
      double itemVPadding = 10.0,
      Color? backgroundColor,
      Color? highlightColor,
      Color? lineColor,
      PopupMenuStateChanged? stateChanged,
      required List<MenuItemProvider> items}) {
    assert(context != null);
    this.onClickMenu = onClickMenu;
    this.dismissCallback = onDismiss;
    this.stateChanged = stateChanged;
    this.items = items;
    this._maxColumn = maxColumn;
    this._inOneLine = inOneLine;
    this._calcItemSize = calcItemSize;
    this._itemWidth = itemWidth;
    this._itemHeight = itemHeight;
    this._arrowHeight = arrowHeight;
    this._itemHPadding = itemHPadding;
    this._itemVPadding = itemVPadding;
    this._backgroundColor = backgroundColor ?? Color(0xff232323);
    this._lineColor = lineColor ?? Color(0xff353535);
    this._highlightColor = highlightColor ?? Color(0x55000000);
    this.context = context;
  }

  void show({Rect? rect, required GlobalKey widgetKey,List<MenuItemProvider>? items}) {

    this.items = items ?? this.items;
    if (this.items != null && this.items!.isNotEmpty) {
      for (final item in this.items!) {
        if (_calcItemSize) {
          item.menuSize = UIUtils.calculateTextSize(item.menuTitle??"",buildContext: context,
              style: item.menuTextStyle);
          item.menuSize = Size(item.menuSize.width + 2 * _itemHPadding,
              item.menuSize.height + 2 * _itemVPadding);
        } else {
          item.menuSize = Size(_itemWidth, _itemHeight);
        }
      }
    }

    this._showRect = rect ?? PopupMenu.getWidgetGlobalRect(widgetKey);
    this._screenSize = window.physicalSize / window.devicePixelRatio;
    this.dismissCallback = dismissCallback;

    _calculatePosition(this.context);

    _entry = OverlayEntry(builder: (context) {
      return buildPopupMenuLayout(_offset);
    });

    Overlay.of(context)?.insert(_entry);
    _isShow = true;
    stateChanged?.call(true);
  }

  static Rect getWidgetGlobalRect(GlobalKey key) {
    var renderBox = key.currentContext?.findRenderObject();
    if(renderBox is RenderBox){
      var offset = renderBox.localToGlobal(Offset.zero);
      return Rect.fromLTWH(
          offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
    }
    return Rect.zero;

  }

  void _calculatePosition(BuildContext context) {
    _col = _calculateColCount();
    _row = _calculateRowCount();
    _offset = _calculateOffset(this.context);
  }

  Offset _calculateOffset(BuildContext context) {
    double dx = _showRect.left + _showRect.width / 2.0 - menuWidth() / 2.0;
    if (dx < 10.0) {
      dx = 10.0;
    }

    if (dx + menuWidth() > _screenSize.width && dx > 10.0) {
      double tempDx = _screenSize.width - menuWidth() - 10;
      if (tempDx > 10) dx = tempDx;
    }

    double dy = _showRect.top - menuHeight();
    if (dy <= MediaQuery.of(context).padding.top + 10) {
      // The have not enough space above, show menu under the widget.
      dy = _arrowHeight + _showRect.height + _showRect.top;
      _isDown = false;
    } else {
      dy -= _arrowHeight;
      _isDown = true;
    }

    return Offset(dx, dy);
  }

  double menuWidth() {
    if(Utils.isEmptyList(items)){
      return 0;
    }
    if (_calcItemSize) {
      final subItems = items!.sublist(0, min(_col, items!.length));
      double width = 0;
      for (final item in subItems) {
        width += item.menuSize.width;
      }
      return width;
    } else {
      return items!.first.menuSize.width * _col;
    }
  }

  // This height exclude the arrow
  double menuHeight() {
    if(Utils.isEmptyList(items)){
      return 0;
    } else {
      return items!.first.menuSize.height * _row;
    }

  }

  LayoutBuilder buildPopupMenuLayout(Offset offset) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          dismiss();
        },
//        onTapDown: (TapDownDetails details) {
//          dismiss();
//        },
        // onPanStart: (DragStartDetails details) {
        //   dismiss();
        // },
        onVerticalDragStart: (DragStartDetails details) {
          dismiss();
        },
        onHorizontalDragStart: (DragStartDetails details) {
          dismiss();
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              // triangle arrow
              Positioned(
                left: _showRect.left + _showRect.width / 2.0 - 7.5,
                top: _isDown
                    ? offset.dy + menuHeight()
                    : offset.dy - _arrowHeight,
                child: CustomPaint(
                  size: Size(15.0, _arrowHeight),
                  painter:
                      TrianglePainter(isDown: _isDown, color: _backgroundColor),
                ),
              ),
              // menu content
              Positioned(
                left: offset.dx,
                top: offset.dy,
                child: Container(
                  width: menuWidth(),
                  height: menuHeight(),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            width: menuWidth(),
                            height: menuHeight(),
                            decoration: BoxDecoration(
                                color: _backgroundColor,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Column(
                              children: _createRows(),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  // 创建行
  List<Widget> _createRows() {
    List<Widget> rows = [];
    for (int i = 0; i < _row; i++) {
      Color color =
          (i < _row - 1 && _row != 1) ? _lineColor : Colors.transparent;
      Widget rowWidget = Container(
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: color))),
        height: items!.first.menuSize.height,
        child: Row(
          children: _createRowItems(i),
        ),
      );

      rows.add(rowWidget);
    }

    return rows;
  }

  // 创建一行的item,  row 从0开始算
  List<Widget> _createRowItems(int row) {
    List<MenuItemProvider> subItems =
        items!.sublist(row * _col, min(row * _col + _col, items!.length));
    List<Widget> itemWidgets = [];
    int i = 0;
    for (var item in subItems) {
      itemWidgets.add(_createMenuItem(
        item,
        i < (_col - 1),
      ));
      i++;
    }

    return itemWidgets;
  }

  // calculate row count
  int _calculateRowCount() {
    if (Utils.isEmptyList(items)) {
      return 0;
    }

    if (_inOneLine) {
      return 1;
    }

    int itemCount = items!.length;

    if (_calculateColCount() == 1) {
      return itemCount;
    }

    int row = (itemCount - 1) ~/ _calculateColCount() + 1;

    return row;
  }

  // calculate col count
  int _calculateColCount() {
    if (Utils.isEmptyList(items)) {
      return 0;
    }

    if (_inOneLine) {
      return items!.length;
    }

    return _maxColumn;
  }

  double get screenWidth {
    double width = window.physicalSize.width;
    double ratio = window.devicePixelRatio;
    return width / ratio;
  }

  Widget _createMenuItem(MenuItemProvider item, bool showLine) {
    return _MenuItemWidget(
      item: item,
      showLine: showLine,
      clickCallback: itemClicked,
      lineColor: _lineColor,
      backgroundColor: _backgroundColor,
      highlightColor: _highlightColor,
    );
  }

  void itemClicked(MenuItemProvider item) {
    onClickMenu?.call(item);
    dismiss();
  }

  void dismiss() {
    if (!_isShow) {
      // Remove method should only be called once
      return;
    }

    _entry.remove();
    _isShow = false;
    dismissCallback?.call();

    stateChanged?.call(false);
  }
}

class _MenuItemWidget extends StatefulWidget {
  final MenuItemProvider item;

  // 是否要显示右边的分隔线
  final bool showLine;
  final Color lineColor;
  final Color backgroundColor;
  final Color highlightColor;

  final Function(MenuItemProvider item)? clickCallback;

  _MenuItemWidget(
      {
      required this.item,
      this.showLine = false,
      this.clickCallback,
      required this.lineColor,
        required this.backgroundColor,
        required this.highlightColor});

  @override
  State<StatefulWidget> createState() {
    return _MenuItemWidgetState();
  }
}

class _MenuItemWidgetState extends State<_MenuItemWidget> {
  var highlightColor = Color(0x55000000);
  var color = Color(0xff232323);

  @override
  void initState() {
    color = widget.backgroundColor;
    highlightColor = widget.highlightColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        color = highlightColor;
        Utils.callSetStateSafely(this, () {});
      },
      onTapUp: (details) {
        color = widget.backgroundColor;
        Utils.callSetStateSafely(this, () {});
      },
      onLongPressEnd: (details) {
        color = widget.backgroundColor;
        Utils.callSetStateSafely(this, () {});
      },
      onTap: () {
        widget.clickCallback?.call(widget.item);
      },
      child: Container(
          width: widget.item.menuSize.width,
          height: widget.item.menuSize.height,
          decoration: BoxDecoration(
              color: color,
              border: Border(
                  right: BorderSide(
                      color: widget.showLine
                          ? widget.lineColor
                          : Colors.transparent))),
          child: _createContent()),
    );
  }

  Widget _createContent() {
    if (widget.item.menuImage != null) {
      // image and text
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 30.0,
            height: 30.0,
            child: widget.item.menuImage,
          ),
          Container(
            height: 22.0,
            child: Material(
              color: Colors.transparent,
              child: Text(
                widget.item.menuTitle??"",
                style: widget.item.menuTextStyle,
              ),
            ),
          )
        ],
      );
    } else {
      // only text
      return Container(
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Text(
              widget.item.menuTitle??"",
              style: widget.item.menuTextStyle,
              textAlign: widget.item.menuTextAlign,
            ),
          ),
        ),
      );
    }
  }
}
