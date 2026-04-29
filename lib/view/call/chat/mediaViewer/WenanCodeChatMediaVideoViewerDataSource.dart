import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaVideoViewer.dart';

import '../../../../utils/WenanCodeimage_url_utils.dart';

class ChatMediaVideoViewerDataSource extends MediaVideoViewerDataSource {
  static showViewer(BuildContext context,ChatSnap snap) {
    MediaVideoViewer.show(context,ChatMediaVideoViewerDataSource(snap));
  }

  static const int ITEM_LOAD_SIZE = 20;

  final ChatSnap snap;

  late ChatSnap _currentItem;
  late List<ChatSnap> _items;
  bool _hasBefore = false;
  bool _loadingBefore = false;
  bool _hasAfter = false;
  bool _loadingAfter = false;

  ChatMediaVideoViewerDataSource(this.snap) : super() {
    super.itemCount = 1;
    super.currentIndex = 0;
    _currentItem = snap;
    _items = [snap];

    _loadSnaps();
  }

  bool _isLocalMediaNotOutOfDate(int createTime) {
    return snap.clearCacheTime == null || createTime > (snap.clearCacheTime??0);
  }

  _loadSnaps() {
    _loadingBefore = true;
    _loadingAfter = true;
    Future.wait([
      Application.chatContext.dbService.snapDao
          .modelsByTypeBeforeTimeForChatBox(
              snap.chatBoxId, snap.type, snap.createTime, ITEM_LOAD_SIZE),
      Application.chatContext.dbService.snapDao.modelsByTypeAfterTimeForChatBox(
          snap.chatBoxId, snap.type, snap.createTime, ITEM_LOAD_SIZE),
    ]).then((results) {
      bool changed = false;
      if (!Utils.isEmptyList(results[0])) {
        changed = true;
        _items.insertAll(0, results[0]!);
        _hasBefore = results[0]!.length >= ITEM_LOAD_SIZE;
      }
      if (!Utils.isEmptyList(results[1])) {
        changed = true;
        _items.addAll(results[1]!);
        _hasAfter = results[1]!.length >= ITEM_LOAD_SIZE;
      }
      if (changed) _updateData();
      _loadingBefore = false;
      _loadingAfter = false;
    });
  }


  _loadingAfterItems() {
    if (_hasAfter && !_loadingAfter) {
      _loadingAfter = true;
      Application.chatContext.dbService.snapDao
          .modelsByTypeAfterTimeForChatBox(
              snap.chatBoxId, snap.type, snap.createTime)
          .then((result) {
        if (!Utils.isEmptyList(result)) {
          _items.addAll(result!);
          _hasAfter = result.length >= ITEM_LOAD_SIZE;
          _updateData();
        }
        _loadingAfter = false;
      });
    }
  }


  _loadingBeforeItems() {
    if (_hasBefore && !_loadingBefore) {
      _loadingBefore = true;
      Application.chatContext.dbService.snapDao
          .modelsByTypeBeforeTimeForChatBox(
          snap.chatBoxId, snap.type, snap.createTime)
          .then((result) {
        if (!Utils.isEmptyList(result)) {
          _items.insertAll(0, result!);
          _hasBefore = result.length >= ITEM_LOAD_SIZE;
          _updateData();
        }
        _loadingBefore = false;
      });
    }
  }

  _updateData() {
    super.itemCount = _items.length;
    super.currentIndex = _items.indexOf(_currentItem);
    super.dataUpdatedCallback?.call();
  }

  /// MediaVideoViewerDataSource

  int autoPlayIndex() => _items.indexOf(snap);

  @override
  String heroTag(int index) {
    return _items[index].hashCode.toString();
  }


  @override
  void onPageChanged(int index) {
    _currentItem = _items[index];
    if (index < 5) {
      _loadingBeforeItems();
    } else if (index > _items.length - 5) {
      _loadingAfterItems();
    }
  }

  @override
  ImageProvider imageProvider(int index) {
    final item = _items[index];
    AuvChatLog.d(
        '[MediaVideoViewer_Chat] imageProvider: $index, ${item.toJson()}');
    if(_isLocalMediaNotOutOfDate(item.createTime!) &&
            !Utils.isEmptyString(item.video?.relativePath)){
      return FileImage(File(item.video!.absolutePath!));
    } else {
      if (item.video!.width! < ImageURLUtils.LARGE_LEN && item.video!.height! < ImageURLUtils.LARGE_LEN) {
        return CachedNetworkImageProvider(ImageURLUtils.imageURLOrigin(item.video!.cover_url!));
      } else {
        return CachedNetworkImageProvider(
            ImageURLUtils.imageURLWithLen(item.video!.cover_url!, ImageURLUtils.LARGE_LEN));
      }
    }
  }

  @override
  String? netPath(int index) {
    final item = _items[index];
    AuvChatLog.d(
        '[MediaVideoViewer_Chat] playController: $index, ${item.toJson()}');
    return _isLocalMediaNotOutOfDate(item.createTime!) &&
            !Utils.isEmptyString(item.video?.relativePath)
        ? null
        : item.video?.video_url;
  }


  @override
  String? localPath(int index) {
    final item = _items[index];
    AuvChatLog.d(
        '[MediaVideoViewer_Chat] playController: $index, ${item.toJson()}');
    return _isLocalMediaNotOutOfDate(item.createTime!) &&
        !Utils.isEmptyString(item.video?.relativePath)
        ? item.video?.absolutePath!
        : null;
  }

}
