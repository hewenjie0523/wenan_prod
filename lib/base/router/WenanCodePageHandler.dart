import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/WenanCodeErrorPage.dart';
import 'package:wenan/view/call/WenanCodePhoneCallPage.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPage.dart';
import 'package:wenan/view/call/chat/list/WenanCodeChatListPage.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaPhotoViewer.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaVideoViewer.dart';
import 'package:wenan/view/call/chat/notify/WenanCodeNotifyListPage.dart';
import 'package:wenan/view/match/discover/WenanCodemedia_pager_view.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';
import 'package:wenan/view/WenanCodehome_page.dart';
import 'package:wenan/view/WenanCodelogin_page.dart';
import 'package:wenan/view/login/WenanCodelogin_with_id_page.dart';
import 'package:wenan/view/match/WenanCodeMatchingPage.dart';
import 'package:wenan/view/profile/WenanCodeavatar_camera_page.dart';
import 'package:wenan/view/profile/WenanCodebalance_page.dart';
import 'package:wenan/view/profile/WenanCodeblacklist_page.dart';
import 'package:wenan/view/profile/WenanCodeedit_user_info.dart';
import 'package:wenan/view/profile/WenanCodemedia_edit_page.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/view/profile/WenanCodesetting_page.dart';
import 'package:wenan/view/profile/WenanCodevip_page.dart';
import 'package:wenan/view/profile/WenanCodewebview_page.dart';
import 'package:wenan/view/widgets/svga/WenanCodeSvgaPlayerPage.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

import '../../data/AppMedia.dart';

var RootHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});
var NotFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ErrorPage();
});


var ChatListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ChatListPage();
});

var PhotoViewHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final argments = context!.settings!.arguments! as MediaPhotoViewerDataSource;
  return MediaPhotoViewer(argments);
});

var VideoViewHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final argments = context!.settings!.arguments! as MediaVideoViewerDataSource;
  return MediaVideoViewer(argments);
});

var ChatDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final argments = context!.settings!.arguments! as Map<String, dynamic>;
  return ChatPage(argments, ScrollController());
});

var ChatNotifyListHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // final argments = context!.settings!.arguments! as Map<String, dynamic>;
  return NotifyListPage();
});

var LoginPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const LoginPage();
});
var PhoneCallPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final arguments = context!.settings!.arguments! as Map<String, dynamic>;
  return PhoneCallPage(arguments);
});
var SettingPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return SettingPage();
});
var BlackListPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const BlackListPage();
});

var MatchingPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final matchType = context!.settings!.arguments! as MatchType;
  return MatchingPage(matchType: matchType,);
});

var WebviewPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final url = context!.settings!.arguments! as String;
  return WebviewPage(url);
});

var MediaEditPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final data = context!.settings!.arguments! as List<AppMedia>;
  return MediaEditView(data);
});

var EditUserInfoPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const EditUserInfoPage();
});

var GiftPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const GiftPage();
});

var SvgaPlayerPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final params = context!.settings!.arguments! as Map<String, dynamic>;
  return SvgaPlayerPage(
    svgaPath: params['svgaPath'],
    svgaIcon: params['svgaIcon'],
  );
});

var UserMediaPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final data = context!.settings!.arguments! as CommonUser;
  return MediaPagerView(
    data,
    type: MediaFromType.PROFILE,
  );
});

var BalancePageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BalancePage();
});

var VipPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return VipPage();
});

var PayHandlePageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  final data = context!.settings!.arguments! as PaymentOption;
  final fromType = Utils.dynamicToIntNotNull(params["fromType"]?.first,defaultValue: 1);
  AuvChatLog.d('PayHandlePageHandler fromType: $fromType');
  return PayHandlerPage(
    payOption: data,
    fromType: fromType,
  );
});

var LoginWithIdPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // final data = context!.settings!.arguments! as Map<String,dynamic>;
  return const LoginWithIdPage();
});

var AvatarCameraPageHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // final data = context!.settings!.arguments! as Map<String,dynamic>;
  return const AvatarCameraPage();
});
