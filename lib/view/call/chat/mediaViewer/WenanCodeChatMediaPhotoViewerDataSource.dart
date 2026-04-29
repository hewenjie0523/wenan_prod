import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaPhotoViewer.dart';

import '../../../../utils/WenanCodeimage_url_utils.dart';

class ChatMediaPhotoViewerDataSource extends MediaPhotoViewerDataSource {
  static showViewer(BuildContext context,ChatSnap snap) {
    MediaPhotoViewer.show(context,ChatMediaPhotoViewerDataSource(snap));
  }

  static const int ITEM_LOAD_SIZE = 20;

  final ChatSnap snap;

  late ChatSnap _currentItem;
  late List<ChatSnap> _items;
  bool _hasBefore = false;
  bool _loadingBefore = false;
  bool _hasAfter = false;
  bool _loadingAfter = false;

  ChatMediaPhotoViewerDataSource(this.snap) : super() {
    super.isHero = true;
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


  _updateData() {
    super.itemCount = _items.length;
    super.currentIndex = _items.indexOf(_currentItem);
    super.dataUpdatedCallback?.call();
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


  /// MediaPhotoViewerDataSource

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
    if(_isLocalMediaNotOutOfDate(item.createTime!) &&
        !Utils.isEmptyString(item.image?.relativePath)){
      return  FileImage(File(item.image!.absolutePath!));
    } else {
      if (item.image!.width! < ImageURLUtils.LARGE_LEN && item.image!.height! < ImageURLUtils.LARGE_LEN) {
        return CachedNetworkImageProvider(ImageURLUtils.imageURLOrigin(item.image!.img_url!));
      } else {
        return CachedNetworkImageProvider(
            ImageURLUtils.imageURLWithLen(item.image!.img_url!, ImageURLUtils.LARGE_LEN));
      }
    }
  }

}
