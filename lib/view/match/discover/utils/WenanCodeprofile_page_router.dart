import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppMedia.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/proto/we_ps_chatbox.pbenum.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPage.dart';

class ProfilePageStartup {
  static const String kParamsUid = 'uid';

  static CommonUser? convertUser(CommonUser? user, List<AppMedia>? pvList) {
    if (Utils.isEmpty(user) || Utils.isEmptyList(pvList)) return null;
    user!.setUserMedias(pvList!);
    return user;
  }

  static Future<CommonUser?> openProfileByUID(int uid) async {
    var profileApi = ProfileApi(DioHelper.getInstance());
    try {
      var rsp = await profileApi.getProfileUser(uid);
      if (rsp.code == 0) {
        var user = rsp.data?.discover_detail?.user;
        var pvList = rsp.data?.discover_detail?.pic_video_list;
        return convertUser(user, pvList);
      }
    } catch (e) {
      return null;
    }
  }

  static Future<void> open(
      BuildContext context,
      int? uid,
      ) async {
    if(uid != null && uid > 0){
      var user = await openProfileByUID(uid);
      if(user != null){
        PageRouter.startProfilePage(context, user);
      }
    }else{
      Fluttertoast.showToast(msg: "Start Profile error");
    }
  }

}
