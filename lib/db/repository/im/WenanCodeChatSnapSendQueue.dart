

import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/WenanCodeUploadManager.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

class ChatSnapSendQueue {
  final Map<String, ChatSnap> _sendingSnaps= {};

  ChatSnapSendQueue();

  String _trackingKey(ChatSnap snap) {
    return 'tracking_id_' + snap.localId.toString();
  }

  void _addTrack(ChatSnap snap) {
    _sendingSnaps[_trackingKey(snap)] = snap;
  }

  void _removeTrack(ChatSnap snap) {
    _sendingSnaps.remove(_trackingKey(snap));
  }

  bool containSnap(ChatSnap snap) {
    return _sendingSnaps.keys.contains(_trackingKey(snap));
  }

  ChatSnap? sendingSnap(ChatSnap snap) {
    return _sendingSnaps[_trackingKey(snap)];
  }

  ChatSnap? sendingSnapBySnap(ChatSnap snap) {
    return _sendingSnaps[_trackingKey(snap)];
  }

  Future<bool> sendSnap(ChatSnap snap) async {
    await Application.chatContext.snapModule.saveLocalSnap(snap);
    return _sendSnap(snap);
  }

  Future<List<bool>> sendSnaps(List<ChatSnap> snaps) async {
    await Application.chatContext.snapModule.saveLocalSnaps(snaps);
    List<Future<bool>> futures = [];
    for (var s in snaps) {
      futures.add(_sendSnap(s));
    }
    return Future.wait(futures);
  }

  Future<bool> _sendSnap(ChatSnap snap) async {
    _addTrack(snap);

    if (!snap.isResourceUploaded) {
      if(snap.type==Snap_SnapType.IMG_SNAP.value){
        return _sendImageSnap(snap);
      }
      if(snap.type==Snap_SnapType.VIDEO_SNAP.value){
        return _sendVideoSnap(snap);
      }
      if(snap.type==Snap_SnapType.VOICE_SNAP.value){
        return _sendVoiceSnap(snap);
      }
    }
    return _sendSnapToServer(snap);
  }

  Future<bool> _sendImageSnap(ChatSnap snap) async {
    final rsp = await UploadManager.instance.upload(
      snap.image!.absolutePath!,UploadType.image,
    ).last;
    AuvChatLog.d("_sendImageSnap:${rsp.result?.img}");
    if (rsp.result?.img!=null) {
      snap.image!.id = Utils.parseInt(rsp.result?.img?.id);
      snap.image!.img_url = rsp.result?.img?.imageUrl;
      Application.chatContext.snapModule.updateLocalSnap(snap);
      return _sendSnapToServer(snap);
    } else {
      Utils.nullSafe<String>(rsp.errorMsg,notNullBlock: (notNull)=>Fluttertoast.showToast(msg: notNull));
      await _handleSendFailed(snap);
      return false;
    }
  }

  // Future<bool> _sendMultiImageSnap(ChatSnap snap) async {
  //   List<Future<QNResult?>> uploads = [];
  //   for (var img in snap.images!) {
  //     uploads.add(UploadManager.instance.upload(
  //       filePath: img.absolutePath!,
  //       type: UploadType.image,
  //     ));
  //   }
  //   var failure;
  //   final results = await Future.wait(uploads);
  //   for (int index = 0; index < results.length; ++index) {
  //     if (results[index]!=null) {
  //       snap.images![index].id = Utils.parseInt(results[index]?.id);
  //       snap.images![index].img_url = results[index]?.url;
  //     } else {
  //       failure = results[index];
  //     }
  //   }
  //   if (failure != null) {
  //     await _handleSendFailed(snap);
  //     return failure;
  //   } else {
  //     Application.chatContext.snapModule.updateLocalSnap(snap);
  //     return _sendSnapToServer(snap);
  //   }
  // }

  Future<bool> _sendVideoSnap(ChatSnap snap) async {
    final rsp = await UploadManager.instance.upload(
      snap.video!.absolutePath!,
      UploadType.video,
    ).last;
    if (rsp.result?.video!=null) {
      snap.video!.id = Utils.parseInt(rsp.result?.video?.id);
      snap.video!.video_url = rsp.result?.video?.video_url;
      snap.video!.duration = rsp.result?.video?.duration;
      Application.chatContext.snapModule.updateLocalSnap(snap);
      return _sendSnapToServer(snap);
    } else {
      await _handleSendFailed(snap);
      return false;
    }
  }

  Future<bool> _sendVoiceSnap(ChatSnap snap) async {
    final rsp = await UploadManager.instance.upload(
       snap.voice!.absolutePath!,
      UploadType.voice,
    ).last;
    if (rsp.result?.voice!=null) {
      snap.voice!.id = Utils.parseInt(rsp.result?.voice?.id);
      snap.voice!.voice_url = rsp.result?.voice?.voice_url;
      snap.voice!.duration = rsp.result?.voice?.duration;
      Application.chatContext.snapModule.updateLocalSnap(snap);
      return _sendSnapToServer(snap);
    } else {
      await _handleSendFailed(snap);
      return false;
    }
  }

  // Future<BaseResponse> _sendStickerSnap(ChatSnap snap) async {
  //   BaseResponse<AppImage, void> rsp = await NetUtils.post(
  //     '/upload/fetch_image',
  //     {'url': snap.image.img_url},
  //     parseKey: 'image',
  //   );
  //   if (rsp.isSuccess()) {
  //     snap.image.id = rsp.obj.id;
  //     snap.image.img_url = rsp.obj.img_url;
  //     Application.chatContext.snapModule.updateLocalSnap(snap);
  //     return _sendSnapToServer(snap);
  //   } else {
  //     await _handleSendFailed(snap);
  //     return rsp;
  //   }
  // }

  Future<bool> _sendSnapToServer(ChatSnap snap) async {
    try {
      final rsp = await ChatApi.createSnap(snap).first;
      await _handleSendSuccess(rsp);
      return Future.value(true);
    } catch (e,obj) {
      AuvChatLog.printE(e,error: obj);
      if(e is SocketRspError&&e.errorCode==150003){
        SpHelper.setImMessageCountDone(true);
        SpHelper.setImMsgFreeCountRemain(0);
      } else {
        Utils.nullSafe<String>(e.toString(),notNullBlock: (notNull)=>Fluttertoast.showToast(msg: notNull));
      }
      await _handleSendFailed(snap);
    }
    return Future.value(false);
  }

  Future<void> _handleSendSuccess(ChatSnap snap) async {
    await Application.chatContext.snapModule
        .updateLocalSnapWithServerId(snap, snap.id!);
    _removeTrack(snap);
  }

  Future<void> _handleSendFailed(ChatSnap snap) async {
    await Application.chatContext.snapModule.updateLocalSnapWithSendStatus(
      snap,
      ChatSnapSendStatus.failed,
    );
    _removeTrack(snap);
  }
}
