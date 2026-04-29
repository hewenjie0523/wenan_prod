import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

abstract class MediaPhotoViewerDataSource {
  bool isHero = false;
  int currentIndex = 0;
  int itemCount = 0;
  VoidCallback? dataUpdatedCallback;

  String heroTag(int index);

  ImageProvider imageProvider(int index);

  void onPageChanged(int index);
}


class MediaPhotoViewer extends StatefulWidget {
  static Future show(BuildContext context,MediaPhotoViewerDataSource dataSource) {
    return PageRouter.startViewPhoto(context,dataSource);
  }

  final MediaPhotoViewerDataSource dataSource;
  const MediaPhotoViewer(this.dataSource, {Key? key}) : super(key: key);


  @override
  State<MediaPhotoViewer> createState() {
    return _MediaPhotoViewerState();
  }
}

class _MediaPhotoViewerState extends State<MediaPhotoViewer> {
  PageController? _pageController;
  late MediaPhotoViewerDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = widget.dataSource;
    _dataSource.dataUpdatedCallback = () {
      _pageController?.jumpToPage(_dataSource.currentIndex);
      Utils.callSetStateSafely(this, () { });
    };
    _pageController = PageController(initialPage: _dataSource.currentIndex);
  }



  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    return PhotoViewGalleryPageOptions(
      imageProvider: _dataSource.imageProvider(index),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered * 2,
      heroAttributes: !_dataSource.isHero
          ? null
          : PhotoViewHeroAttributes(tag: _dataSource.heroTag(index)),
      onTapUp: (context, details, controllerValue) => FluroRouter.appRouter.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return CupertinoPageScaffold(
      child: GestureDetector(
        onTap: ()=>FluroRouter.appRouter.pop(context),
        child: Container(
          color: Colors.black,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: PhotoViewGallery.builder(
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            builder: _buildItem,
            itemCount: _dataSource.itemCount,
//          loadingBuilder: widget.loadingBuilder,
//          backgroundDecoration: widget.backgroundDecoration,
            pageController: _pageController,
            onPageChanged: _dataSource.onPageChanged,
          ),
        ),),
    );
  }


  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

}
