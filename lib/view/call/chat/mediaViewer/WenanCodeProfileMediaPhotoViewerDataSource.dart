import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppMedia.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaPhotoViewer.dart';

import '../../../../utils/WenanCodeimage_url_utils.dart';

class FeedMediaPhotoViewerDataSource extends MediaPhotoViewerDataSource {

  static showViewer(BuildContext context,{List<AppImage>? list, AppImage? selectItem}) {
    if ((list == null || list.isEmpty) && selectItem == null) return;
    MediaPhotoViewer.show(context,FeedMediaPhotoViewerDataSource(list, selectItem));
  }

  static showNativeViewer(BuildContext context,{List<String>? list, String? selectItemPath}) {
    if ((list == null || list.length == 0) && !StringUtils.isNotEmpty(selectItemPath)) return;
    List<AppImage> imageList = [];
    AppImage? onAppImage;
    list?.forEach((element) {
      AppImage? image = AppMedia.imageUrl("$element").image;
      if(image!=null){
        if(element == selectItemPath){
          onAppImage = image;
        }
        imageList.add(image);
      }

    });
    showViewer(context,list: imageList,selectItem: onAppImage);
  }

  final AppImage? _currentItem;
  final List<AppImage>? _items;


  FeedMediaPhotoViewerDataSource(this._items, this._currentItem) : super() {
    super.isHero = true;
    super.itemCount = _items != null ? _items!.length : 1;
    super.currentIndex = _items != null&&_currentItem!=null ? _items!.indexOf(_currentItem!) : 0;
  }

  /// MediaPhotoViewerDataSource

  @override
  String heroTag(int index) {
    final item = _items != null ? _items![index] : _currentItem;
    return item.hashCode.toString();
  }


  @override
  void onPageChanged(int index) {
  }

  @override
  ImageProvider imageProvider(int index) {
    final item = _items != null ? _items![index] : _currentItem;
    if(item!.id==0){
      return FileImage(File(item.img_url!));
    } else {
      if (item.width! < ImageURLUtils.LARGE_LEN && item.height! < ImageURLUtils.LARGE_LEN) {
        return CachedNetworkImageProvider(ImageURLUtils.imageURLOrigin(item.img_url!));
      } else {
        return CachedNetworkImageProvider(
            ImageURLUtils.imageURLWithLen(item.img_url!, ImageURLUtils.LARGE_LEN));
      }
    }

  }

}
