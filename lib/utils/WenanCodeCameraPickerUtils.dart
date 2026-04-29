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
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

typedef CameraPickerCallBack = void Function(
    CameraPickerType mediaType, dynamic data);

enum CameraPickerType {
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

class CameraPickerUtils {

  static void showNativeCameraPicker(BuildContext context,{
    CameraPickerType type = CameraPickerType.all,
    required CameraPickerCallBack callback,
  })  {
    bool isRecording = type!=CameraPickerType.image;
    CameraPicker.pickFromCamera(
      context,
      // pickerConfig:  CameraPickerConfig(enableRecording: isRecording,textDelegate: const EnglishCameraPickerTextDelegate()),
    ).then((entity){
      // final AssetEntity? entity =
      AuvChatLog.d("CameraPickerCallBack entity:$entity");
      Utils.nullSafe<AssetEntity>(entity,notNullBlock: (fileResult) async{
        var data = await convertAssetEntity(entity!);
        callback.call(
          type,
          data,
        );
      });

    }).onError((error, stackTrace) {
      AuvChatLog.printE(error.toString(),stackTrace: stackTrace);
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
      AuvChatLog.d("CameraPickerCallBack convertAssetEntity image:$appImage");
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
      );
    }
    completer.complete(bytes);
    return completer.future;
  }
}
