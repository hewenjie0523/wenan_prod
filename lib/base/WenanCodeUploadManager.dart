

import 'dart:async';
import 'dart:io';

import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/QiniuToken.dart';
import 'package:wenan/data/Upload.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:qiniu_sdk_base/qiniu_sdk_base.dart';
enum UploadType { image, video, voice }

class UploadManager{

  static final UploadManager _instance = UploadManager._();

  static UploadManager get instance => _instance;

  UploadManager._();
  final Storage storage = Storage();


  Stream<UploadEvent> upload(String filePath,UploadType type) {
    StreamController<UploadEvent> controller = StreamController<UploadEvent>();
    var event = UploadEvent(UploadStatus.PROGRESS);
    controller.add(event);
    _getToken(type).then((token) {
      if(Utils.isEmpty(token)){
        event.status = UploadStatus.ERROR;
        event.errorMsg = "Can't get token!";
        controller.add(event);
        controller.close();
        return;
      }
      var putController = PutController();
      putController.addStatusListener((status) { });
      putController.addProgressListener((percent) {
        event.progress = (percent*100).toInt();
        controller.add(event);
      });
      final putOptions = PutOptions(
        controller: putController,
      );
      storage.putFile(
        File(filePath),
        token!,
        options: putOptions,
      ).then((response) {
        AuvChatLog.d("response:${response.rawData}",tag: "UploadManager");
        UploadJsonResp uploadJsonResp = UploadJsonResp.fromJson(response.rawData);
        if(uploadJsonResp.code==0){
          event.status = UploadStatus.SUCCESS;
          event.result = uploadJsonResp.data;
          controller.add(event);
          controller.close();
        } else {
          event.status = UploadStatus.ERROR;
          event.errorMsg = "${uploadJsonResp.code}->${uploadJsonResp.msg}";
          controller.add(event);
          controller.close();
        }

      }).catchError((e){
        AuvChatLog.printE(e);
        event.status = UploadStatus.ERROR;
        event.errorMsg = e.toString();
        controller.add(event);
        controller.close();
      });
    });
    return controller.stream;
  }

  String? _getTokenByType(UploadType type){
    String? token;
    switch(type){
      case UploadType.image:
        token = SpHelper.getUploadImageToken();
        break;
      case UploadType.video:
        token = SpHelper.getUploadVideoToken();
        break;
      case UploadType.voice:
        token = SpHelper.getUploadVoiceToken();
        break;
    }
    return token;
  }

  Future<String?> _getToken(UploadType type) async {
    String? token = _getTokenByType(type);
    if(!Utils.isEmpty(token)&&SpHelper.getUploadTokenExpireTime()>DateTime.now().millisecondsSinceEpoch){
      return token;
    } else {
      try {
        QiniuTokenRsp event = await CommonApi(DioHelper.getInstance()).qiniuToken();
        Utils.nullSafe<QiniuToken>(event.data,notNullBlock: (rsp){
          SpHelper.setUploadImageToken(rsp.image_token!);
          SpHelper.setUploadVideoToken(rsp.video_token!);
          SpHelper.setUploadVoiceToken(rsp.voice_token!);
          SpHelper.setUploadTokenExpireTime(rsp.expire_time!);
        });
      } catch (e) {
        AuvChatLog.printE(e);
      }
      return _getTokenByType(type);
    }
  }
}
// ignore: constant_identifier_names
enum UploadStatus { SUCCESS, ERROR, PROGRESS }

class UploadEvent{
  UploadJsonData? result;
  String? errorMsg;
  UploadStatus status;
  int progress;
  UploadEvent(this.status,{this.progress = 0,this.result});
}
