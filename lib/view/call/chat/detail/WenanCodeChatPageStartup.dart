
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/proto/we_ps_chatbox.pbenum.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPage.dart';
import 'package:wenan/StringTranslate.dart';

class ChatPageStartup {
  static const String kParamsCid = 'cid';
  static const String kParamsUid = 'uid';
  static const String kParamsSourceType = 'sourceType';
  static const String kParamsShareJson = 'shareJson';
  static const String kParamsChatBox = 'chatBox';
  static const String kParamsShowSnap = 'showSnap';

  /// srcType is value of CreateChatboxReq_SourceType
  static Future<void> open(BuildContext context,{
    int? cid,
    int? uid,
    ChatSnap? showSnap,
    String? shareJson,
    bool serviceChat = false,
    int? srcType,
    CommonUserOnlineStatus? onlineStatus,
    bool halfWindow = false
  }) async {
    ChatBox? chatBox;
    if (serviceChat) {
      chatBox = await getServiceChat();
    } else {
      if (cid != null) {
        chatBox = await chatBoxById(cid);
      }
      if (chatBox == null && uid != null) {
        chatBox = await chatBoxByUser(uid,
            srcType: CreateChatboxReq_SourceType.valueOf(srcType??CreateChatboxReq_SourceType.FROM_UNKNOWN.value));
      }
    }
    if (chatBox != null) {
      if (onlineStatus != null) {
        // Application.onlineStatusManager.setOnlineStatus(onlineStatus);
      }
      Map<String, dynamic> data = {};
      data[kParamsChatBox] = chatBox;
      data[kParamsShowSnap] = showSnap;
      data[kParamsShareJson] = shareJson;
      if(halfWindow){
        showFlexibleBottomSheet<void>(
          minHeight: 0.79999,
          initHeight: 0.8,
          maxHeight: 0.8,
          context: context,
          isSafeArea: false,
          isCollapsible:false,
          bottomSheetColor: AppColor.b1_40p,
          builder: (context, controller, offset) {
            return ChatPage(data, controller);
          },
          // anchors: [0, 0.5, 1],
        );
      } else {
        PageRouter.startChatDetailPage(context,data);
      }

    }
  }

  static Future<ChatBox?> chatBoxById(int id) async {
    ChatBox? chatBox =
        await Application.chatContext.dbService.chatBoxDao.modelById(id);

    if (chatBox == null) {
      try {
        return await ChatApi.getChatBoxInfo(id).first;
      } catch (e) {
        AuvChatLog.printE(e);
        if(e is SocketRspError){
          Fluttertoast.showToast(msg: e.errorMsg??StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
        }
      }
    }

    return chatBox;
  }


  static Future<ChatBox?> getServiceChat() async {
    ChatBox? chatBox =
    await Application.chatContext.dbService.chatBoxDao.serviceModel();
    AuvChatLog.d('ChatPageStartup - getServiceChat: ChatBox from DB: $chatBox');

    if (chatBox == null) {
      try {
        return await ChatApi.getServiceChatBox().first;
      } catch (e) {
        AuvChatLog.printE(e);
        if(e is SocketRspError){
          Fluttertoast.showToast(msg: e.errorMsg??StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
        }
      }
    }

    return chatBox;
  }

  static Future<ChatBox?> chatBoxByUser(int? uid,
      {CreateChatboxReq_SourceType? srcType}) async {
    if (uid == null || uid == 0) {
      Fluttertoast.showToast(msg: 'UID is null');
      return null;
    }

    final chatBoxes = await Application.chatContext.dbService.chatBoxDao
        .modelsByType(Chatbox_Type.SINGLE.value);
    AuvChatLog.d(
        'ChatPageStartup - chatBoxByUser: ChatBox from DB: $chatBoxes');
    if (chatBoxes != null) {
      for (final c in chatBoxes) {
        if (c.chatUser?.uid == uid) {
          return c;
        }
      }
    }

    try {
      return await ChatApi.createChatBox([uid, Application.currUserId()],
          srcType: srcType).first;
    } catch (e) {
      AuvChatLog.printE(e);
      if(e is SocketRspError){
        Fluttertoast.showToast(msg: e.errorMsg??StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
      }
    }
  }


  static Future<CommonUser?> chatUserById(int uid) {
    return chatBoxByUser(uid).then((chatBox) => chatBox?.chatUser);
  }
}
