
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/utils/WenanCodeimage_url_utils.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'WenanCodeMediaVideoViewer.dart';

class FeedMediaVideoViewerDataSource extends MediaVideoViewerDataSource {
  static showViewer(BuildContext context,List<AppVideo> videos) {
    MediaVideoViewer.show(context,FeedMediaVideoViewerDataSource(videos,videos.first));
  }

  static const int ITEM_LOAD_SIZE = 20;

  List<AppVideo> _items;
  late AppVideo _currentItem;

  FeedMediaVideoViewerDataSource(this._items, this._currentItem) : super() {
    super.itemCount = _items != null ? _items.length : 1;
    super.currentIndex = _items != null && _currentItem != null ? _items.indexOf(_currentItem) : 0;
  }

  /// MediaVideoViewerDataSource

  int autoPlayIndex() => _items.indexOf(_currentItem);

  @override
  String heroTag(int index) {
    return _items[index].hashCode.toString();
  }

  @override
  ImageProvider imageProvider(int index) {
    final item = _items[index];
    return CachedNetworkImageProvider(item.cover_url!);
  }

  @override
  String? localPath(int index) {
    final item = _items[index];
    return item.absolutePath;
  }

  @override
  String? netPath(int index) {
    final item = _items[index];
    return item.video_url;
  }

  @override
  void onPageChanged(int index) {
    _currentItem = _items[index];
  }
}
