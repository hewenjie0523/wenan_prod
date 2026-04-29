import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/proto/we_ps_buddy.pb.dart';
import 'package:wenan/proto/we_ps_chatbox.pb.dart';
import 'package:wenan/proto/we_ps_bu_common.pb.dart';
import 'package:wenan/proto/we_ps_common.pb.dart';
import 'package:wenan/proto/we_ps_im_object.pb.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/proto/we_ps_message.pbenum.dart';
import 'package:wenan/proto/we_ps_im_message.pb.dart' as IM;
import 'package:wenan/proto/we_ps_bu_message.pb.dart' as Flash;
import 'package:wenan/proto/we_ps_snap.pb.dart';
import 'package:wenan/proto/we_ps_sync.pb.dart';
import 'package:wenan/proto/we_ps_sync.pbenum.dart';
import 'package:wenan/http/socket/WenanCodeflash_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/http/socket/WenanCodesocket_util.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';

import '../../proto/we_ps_message.pb.dart';

class ChatApi {

  static Stream<ChatBox> createChatBox(List<int> uIds, {
    String? name,
    String? desc,
    int? coverId,
    CreateChatboxReq_SourceType? srcType,
  }){
    final req = CreateChatboxReq.create();
    for (var element in uIds) {
      req.memberIds.add(Int64(element));
    }
    if (name != null) req.name = name;
    if (desc != null) req.description = desc;
    if (coverId != null) req.coverId = Int64(coverId);
    if (srcType != null) req.sourceType = srcType;
    req.lastChatboxKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CreateChatboxRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.CREATECHATBOXREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          return SocketUtil.convertChatBoxProto(realRsp.chatbox);
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  static Stream<ChatBox> getServiceChatBox() {
    final req = CustomerServiceReq.create();
    return SocketApi.sendCommonMsgWithRspInstance(
      CustomerServiceRsp.create(),
      FlashApi.MessageCateFlash,
      Flash.Message_Type.CUSTOMERSERVICEREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          var result = SocketUtil.convertChatBoxProto(realRsp.chatbox);
          result.serviceChat = true;
          Application.chatContext.dbService.chatBoxDao.saveOrUpdateModels([result]);
          return result;
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  static Stream<bool> removeChatBox({
    int? cId,
    List<int>? cIds,
    List<ChatBox>? chatBoxes,
  }) {
    final req = RemoveChatboxReq.create();
    if (cId != null) {
      req.chatboxId = Int64(cId);
    } else if (cIds != null) {
      for (var id in cIds) {
        req.chatboxIds.add(Int64(id));
      }
    } else if (chatBoxes != null) {
      for (var cb in chatBoxes) {
        req.chatboxIds.add(Int64(cb.id!));
      }
    }
    req.lastChatboxKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.REMOVECHATBOXREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }



  static Stream<bool> updateChatBoxReadStatus({
    int? cId,
    List<int>? cIds,
    List<ChatBox>? chatBoxes,
  }) {
    final req = UpdateChatboxReadedStatusReq.create();
    if (cId != null) {
      req.chatboxId = Int64(cId);
    } else if (cIds != null) {
      for (var id in cIds) {
        req.chatboxIds.add(Int64(id));
      }
    } else if (chatBoxes != null) {
      for (var cb in chatBoxes) {
        req.chatboxIds.add(Int64(cb.id!));
      }
    }
    req.lastSnapKey = Int64(Application.chatContext.dbService.snapDao.lastSyncKey);
    req.lastChatboxKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.UPDATECHATBOXREADEDSTATUSREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static Stream<bool> sendReadSnapReq(
      int cId,{
      List<int>? snapIds,
  }) {
    final req = ReadSnapReq.create();
    req.chatboxId = Int64(cId);
    if (snapIds != null && snapIds.isNotEmpty) {
      for (var snapId in snapIds) {
        req.snapIds.add(Int64(snapId));
      }
    }

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.READSNAPREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static Stream<ChatBox> getChatBoxInfo(int cId) {
    final req = GetChatboxInfoReq.create();
    req.chatboxId = Int64(cId);
    req.lastChatboxKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      GetChatboxInfoRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.GETCHATBOXINFOREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          return SocketUtil.convertChatBoxProto(realRsp.chatboxInfo);
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  static Stream<List<ChatBox>> batchGetChatBoxInfo({
    List<int>? cIds,
    List<ChatBox>? chatBoxes,
  }) {
    final req = BatchGetChatboxInfoReq.create();
    if (cIds != null) {
      for (var id in cIds) {
        req.chatboxIds.add(Int64(id));
      }
    } else if (chatBoxes != null) {
      for (var cb in chatBoxes) {
        req.chatboxIds.add(Int64(cb.id!));
      }
    }

    return SocketApi.sendCommonMsgWithRspInstance(
      BatchGetChatboxInfoRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.BATCHGETCHATBOXINFOREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          var result = <ChatBox>[];
          for (var c in realRsp.chatboxInfos) {
            result.add(SocketUtil.convertChatBoxProto(c));
          }
          return result;
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  static Stream<ChatSnap> createSnap(ChatSnap snap) {
    final req = CreateSnapReq.create();
    if (snap.chatBoxId != null) req.chatboxId = Int64(snap.chatBoxId!);
    if (snap.type != null) req.snapType = Snap_SnapType.valueOf(snap.type!)!;
    if (snap.textContent != null) req.textContent = snap.textContent!;
    if (snap.jsonContent != null) req.jsonContent = snap.jsonContent!;
    if (snap.image?.id != null) req.imgId = Int64(snap.image!.id!);
    if (snap.video?.id != null) req.videoId = Int64(snap.video!.id!);
    if (snap.voice?.id != null) req.voiceId = Int64(snap.voice!.id!);
    if (snap.localId != null) req.localId = Int64(snap.localId!);
    if (snap.repliedSnapId != null) req.repliedSnapId = Int64(snap.repliedSnapId!);
    if (req.snapType==Snap_SnapType.MULTI_IMG_SNAP) {
      if (snap.images != null) {
        for (var img in snap.images!) {
          if (img.id != null) req.multiImgIds.add(Int64(img.id!));
        }
      }
    }

    return SocketApi.sendCommonMsgWithRspInstance(
      CreateSnapRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.CREATESNAPREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          snap.id = realRsp.snapId.toInt();
          return snap;
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  static Stream<bool> deleteSnap(int sId) {
    final req = DeleteSnapReq.create();
    req.snapId = Int64(sId);
    req.lastSnapKey = Int64(Application.chatContext.dbService.snapDao.lastSyncKey);
    req.lastChatboxKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.DELETESNAPREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  /// opt : 1 为屏蔽，0 为解除屏蔽
  static Stream<bool> blockBuddy(int uId, int opt) {
    final req = BlockBuddyReq.create();
    req.buddyId = Int64(uId);
    req.operation = opt;
    req.lastBuddyKey = Int64(Application.chatContext.dbService.userDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.BLOCKBUDDYREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  /// opt : 1 为设置为特别关注，0 为取消特别关注
  static Stream<bool> starBuddy(int uId, int opt) {
    final req = StarBuddyReq.create();
    req.buddyId = Int64(uId);
    req.operation = opt;
    req.lastBuddyKey = Int64(Application.chatContext.dbService.userDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.STARBUDDYREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static Stream<bool> remarkBuddy(int uId, String name) {
    final req = RemarkBuddyReq.create();
    req.buddyId = Int64(uId);
    req.remarkName = name;
    req.lastBuddyKey = Int64(Application.chatContext.dbService.userDao.lastSyncKey);

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.REMARKBUDDYREQ.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static void dispatchSyncNotify(Message message) {
    var msgType = IM.Message_Type.valueOf(message.messageType);
    if (IM.Message_Type.SYNC ==  msgType||
        IM.Message_Type.SYNCPSH == msgType) {
      handleSync(message);
    } else if (IM.Message_Type.SYNCNOTIFY == msgType) {
      handleSyncNotify(message);
    }
  }

  static  Stream<bool> sendSyncConfirmNotify(SyncType type, Int64 lastKey) {
    final req = SyncKeyConfirmNotify.create();
    req.type = type;
    req.lastKey = lastKey;

    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      Message_Category.IM.value,
      IM.Message_Type.SYNCKEYCONFIRMNOTIFY.value,
      req,
    ).map((realRsp)=>SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static void handleSyncNotify(Message message) {
    final notify = SocketUtil.unpackMessage(SyncNotify.create(), message.messageObject);
    if (notify == null) return;
    if ((notify.types & (1 << SyncType.CHATBOX.value)) != 0) {
      SocketApi.sendSync(SyncType.CHATBOX, Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey));
    }
    if ((notify.types & (1 << SyncType.SNAP.value)) != 0) {
      SocketApi.sendSync(SyncType.SNAP, Int64(Application.chatContext.dbService.snapDao.lastSyncKey));
    }
//    if ((notify.types & (1 << SyncType.BUDDY.value)) != 0) {
//      SocketApi.sendSync(SyncType.BUDDY, Int64(Application.chatContext.dbService.userDao.lastSyncKey));
//    }
//    if ((notify.types & (1 << SyncType.BUDDY_REQUEST.value)) != 0) {
//      SocketApi.sendSync(SyncType.BUDDY_REQUEST, Int64(Application.chatContext.dbService.userDao.lastSyncKey));
//    }
  }

  static void handleSync(Message message) {
    final sync = SocketUtil.unpackMessage(Sync.create(), message.messageObject);
    if (sync == null) return;
    if (sync.type == SyncType.CHATBOX) {
      handleChatBoxSync(sync);
    } else if (sync.type == SyncType.SNAP) {
      handleSnapSync(sync);
    }

  }

  static void handleChatBoxSync(Sync sync) async {
    Int64 syncKey = Int64(Application.chatContext.dbService.chatBoxDao.lastSyncKey);
    AuvChatLog.d('Chat_API - handleChatBoxSync localKey: $syncKey, sync: $sync');
    if (sync.baseKey != syncKey) {
      SocketApi.sendSync(SyncType.CHATBOX, syncKey);
      return;
    }

    Map<String, List<ChatBox>> affects = {};

    if (sync.add.isNotEmpty) {
      List<ChatBox> adds = [];
      for (var any in sync.add) {
        final p = SocketUtil.unpackMessage(Chatbox.create(), any);
        if (p != null) {
          AuvChatLog.d('handleChatBoxSync - add: $p');
          adds.add(SocketUtil.convertChatBoxProto(p));
        }
      }
      if (adds.isNotEmpty) {
        affects[ChatEvent.AFFECT_ADD] = adds;
        await Application.chatContext.dbService.chatBoxDao.saveOrUpdateModels(adds);
      }
    }

    if (sync.update.isNotEmpty) {
      List<ChatBox> updates = [];
      for (var any in sync.update) {
        final p = SocketUtil.unpackMessage(Chatbox.create(), any);
        if (p != null) {
          AuvChatLog.d('handleChatBoxSync - update: $p');
          final l = SocketUtil.convertChatBoxProto(p);
          updates.add(l);
        }
      }
      AuvChatLog.d('handleChatBoxSync - updates: $updates');
      if (updates.isNotEmpty) {
        affects[ChatEvent.AFFECT_UPDATE] = updates;
        await Application.chatContext.dbService.chatBoxDao.saveOrUpdateModels(updates);
      }
    }

    if (sync.delete.isNotEmpty) {
      List<ChatBox> deletes = [];
      for (var any in sync.delete) {
        final p = SocketUtil.unpackMessage(Chatbox.create(), any);
        if (p != null){
          AuvChatLog.d('handleChatBoxSync - delete: $p');
          deletes.add(SocketUtil.convertChatBoxProto(p));
        }
      }
      if (deletes.isNotEmpty) {
        affects[ChatEvent.AFFECT_DELETE] = deletes;
        ChatUtils.deleteChatsResources(deletes);
        await Application.chatContext.dbService.chatBoxDao.deleteModels(deletes);
      }
    }

    Application.chatContext.dbService.chatBoxDao.lastSyncKey = sync.lastKey.toInt();
    sendSyncConfirmNotify(SyncType.CHATBOX, sync.lastKey);
    AuvChatLog.d('handleChatBoxSync - affects: $affects');
    if (affects.isEmpty) return;

    Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxSync, affects: affects));
  }

  static void handleSnapSync(Sync sync) async {
    Int64 syncKey = Int64(Application.chatContext.dbService.snapDao.lastSyncKey);
    AuvChatLog.d('Chat_API - handleSnapSync localKey: $syncKey, sync: $sync');
    if (sync.baseKey != syncKey) {
      SocketApi.sendSync(SyncType.SNAP, syncKey);
      return;
    }

    Map<String, List<ChatSnap>> affects = {};
    Set<int> cIds = {};
    Set<int> cIdsToReloadInList = {};
    Set<int> cIdsToPlayFeedback = {};

    if (sync.add.isNotEmpty) {
      List<ChatSnap> adds = [];
      for (var any in sync.add) {
        final p = SocketUtil.unpackMessage(Snap.create(), any);
        if (p != null) {
          AuvChatLog.d('handleSnapSync - add: $p');
          final l = SocketUtil.convertChatSnapProto(p);
          adds.add(l);
          cIds.add(l.chatBoxId!);
          cIdsToReloadInList.add(l.chatBoxId!);
          if (!l.isMine) cIdsToPlayFeedback.add(l.chatBoxId!);
        }
      }
      if (adds.isNotEmpty) {
        // adds.sort((a, b) => a.createTime.compareTo(b.createTime));
        affects[ChatEvent.AFFECT_ADD] = adds;
        await Application.chatContext.dbService.snapDao.saveOrUpdateModels(adds);
        await Application.chatContext.dbService.chatBoxDao.updateModelsHasChat(cIds.toList());
      }
    }

    if (sync.update.isNotEmpty) {
      List<ChatSnap> updates = [];
      for (var any in sync.update) {
        final p = SocketUtil.unpackMessage(Snap.create(), any);
        if (p != null) {
          AuvChatLog.d('handleSnapSync - update: $p');
          final l = SocketUtil.convertChatSnapProto(p);
          updates.add(l);
          cIds.add(l.chatBoxId!);
          cIdsToReloadInList.add(l.chatBoxId!);
        }
      }
      if (updates.isNotEmpty) {
        affects[ChatEvent.AFFECT_UPDATE] = updates;
        await Application.chatContext.dbService.snapDao.saveOrUpdateModels(updates);
      }
    }

    if (sync.delete.isNotEmpty) {
      List<ChatSnap> deletes = [];
      for (var any in sync.delete) {
        final p = SocketUtil.unpackMessage(Snap.create(), any);
        if (p != null) {
          AuvChatLog.d('handleSnapSync - delete: $p');
          final l = SocketUtil.convertChatSnapProto(p);
          deletes.add(l);
          cIdsToReloadInList.add(l.chatBoxId!);
        }
      }
      if (deletes.isNotEmpty) {
        affects[ChatEvent.AFFECT_DELETE] = deletes;
        await Application.chatContext.dbService.snapDao.deleteModels(deletes);
      }
    }

    Application.chatContext.dbService.snapDao.lastSyncKey = sync.lastKey.toInt();
    sendSyncConfirmNotify(SyncType.SNAP, sync.lastKey);

    if (affects.isEmpty) return;

    Application.eventBus.fire(ChatEvent(ChatEventType.snapSync, affects: affects));
    Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds, chatIds: cIdsToReloadInList.toList()));
    Application.eventBus.fire(ChatEvent(ChatEventType.snapFeedback, chatIds: cIdsToPlayFeedback.toList()));

    final chatBoxes = await Application.chatContext.dbService.chatBoxDao.modelsByIds(cIds.toList());
    chatBoxes?.forEach((c) {
      cIds.remove(c.id);
    });
    if (cIds.isNotEmpty) {
      try {
        final rsp = await batchGetChatBoxInfo(cIds: cIds.toList()).first;
        if (rsp.isNotEmpty) {
                await Application.chatContext.dbService.chatBoxDao.saveOrUpdateModels(rsp);
                Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxSync, affects: {ChatEvent.AFFECT_ADD: rsp}));
              }
      } catch (e) {
        AuvChatLog.printE(e);
      }
    }
  }
}
