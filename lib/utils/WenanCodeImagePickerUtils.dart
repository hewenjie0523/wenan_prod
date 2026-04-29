import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

typedef ImagePickerCallBack = void Function(
    ImagePickerType mediaType, List<dynamic> mediaList);

enum ImagePickerType {
  all,
  image,
  video,
}

class ThumbnailResult {
  final Image? image;
  final int? dataSize;
  final int? width;
  final int? height;

  const ThumbnailResult({this.image, this.dataSize, this.width, this.height});

  @override
  String toString() {
    return super.toString() +
        ' : ' +
        '\n\timage: ${image.toString()},'
            '\n\tdataSize: $dataSize,'
            '\n\twidth: $width,'
            '\n\theight: $height';
  }
}

class ImagePickerUtils {
  static void showNativeImagePicker(BuildContext context,{
    ImagePickerType type = ImagePickerType.all,
    int maxCount = 1,
    required ImagePickerCallBack callback,
  }) {
    if (maxCount <= 0) maxCount = 1;
    RequestType requestType = RequestType.common;
    if(type==ImagePickerType.image){
      requestType = RequestType.image;
    } else if(type==ImagePickerType.video){
      requestType = RequestType.video;
    }
    var textDelegate = assetPickerTextDelegateFromLocale(Localizations.maybeLocaleOf(context));
    AssetPicker.pickAssets(context,pickerConfig: AssetPickerConfig(maxAssets: maxCount,requestType: requestType,textDelegate: textDelegate==const AssetPickerTextDelegate()?const EnglishAssetPickerTextDelegate():textDelegate)).then((result) {
      Utils.nullSafe<List<AssetEntity>>(result,notNullBlock: (fileResult) async{
        List<dynamic> selectedURLs = [];
        for (var element in fileResult) {
          var obj = await convertAssetEntity(element);
          selectedURLs.add(obj);
        }
        AuvChatLog.d("selectedURLs=$selectedURLs",tag: "ImagePickerUtils");
        //视频和图片不能同时选中
        callback.call(
          type,
          selectedURLs,
        );
      });
    }).onError((error, stackTrace) {
      AuvChatLog.printE(error.toString());
    });


  }

  static dynamic convertAssetEntity(AssetEntity obj) async{
    String? path = (await obj.file)?.path;
    if(obj.type==AssetType.image){
      AppImage appImage = AppImage();
      appImage.height = obj.height;
      appImage.width = obj.width;
      appImage.img_url = path;
      appImage.mime_type = obj.mimeType;
      return appImage;
    } else if(obj.type==AssetType.video){
      AppVideo appImage = AppVideo();
      appImage.height = obj.height;
      appImage.width = obj.width;
      appImage.video_url = path;
      appImage.duration = obj.duration;
      return appImage;
    } else if(obj.type==AssetType.audio){
      AppVoice appImage = AppVoice();
      appImage.voice_url = path;
      appImage.duration = obj.duration;
      return appImage;
    }
    return null;
  }




  static Future<Uint8List> getThumbnailData(
      {String? imagePath, String? videoPath}) async {
    Uint8List? bytes;
    final Completer<Uint8List> completer = Completer();
    if (imagePath != null) {
      final file = File(imagePath);
      bytes = file.readAsBytesSync();
    } else {
      bytes = await VideoThumbnail.thumbnailData(
        video: videoPath!,
        imageFormat: ImageFormat.JPEG,
      );
    }
    completer.complete(bytes);
    return completer.future;
  }

  static Future<Image> getThumbnail(
      {String? imagePath, String? videoPath, BoxFit fit = BoxFit.cover}) {
    return getThumbnailData(imagePath: imagePath, videoPath: videoPath)
        .then((data) {
      return Image.memory(data, fit: fit);
    });
//    Uint8List bytes;
//    final Completer<Image> completer = Completer();
//    if (imagePath != null) {
//      completer.complete(Image.file(File(imagePath)));
//    } else {
//      bytes = await VideoThumbnail.thumbnailData(
//          video: videoPath, imageFormat: ImageFormat.JPEG);
//      completer.complete(Image.memory(bytes));
//    }
//    return completer.future;
  }

  static Future<ThumbnailResult> getThumbnailAllInfo(
      {String? imagePath, String? videoPath}) async {
    Uint8List? bytes;
    final Completer<ThumbnailResult> completer = Completer();
    if (imagePath != null) {
      final file = File(imagePath);
      bytes = file.readAsBytesSync();
    } else {
      bytes = await VideoThumbnail.thumbnailData(
        video: videoPath!,
        imageFormat: ImageFormat.JPEG,
      );
    }
    if(bytes!=null){
      int _imageDataSize = bytes.length;
      AuvChatLog.d(
          "ImagePickerUtils - getThumbnailAllInfo size: $_imageDataSize");

      final _image = Image.memory(bytes);
      _image.image
          .resolve(const ImageConfiguration())
          .addListener(ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(ThumbnailResult(
          image: _image,
          dataSize: _imageDataSize,
          height: info.image.height,
          width: info.image.width,
        ));
      }));
    }

    return completer.future;
  }


}
