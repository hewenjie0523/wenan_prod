import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/base/router/WenanCodePageHandler.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/wenan_user_online_status_manager.dart';
import 'package:wenan/utils/wenan_user_online_status_refresher.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaPhotoViewer.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeMediaVideoViewer.dart';
import 'package:wenan/view/match/discover/utils/WenanCodeprofile_page_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/wenan_user_online_status_enum.dart';
import '../WenanCodeApplication.dart';
import '../../data/call/AppChatCall.dart';
import '../../http/socket/WenanCodecall_api.dart';
import '../../http/socket/WenanCodesocket_rsp.dart';
import '../../view/WenanCodeSharedViewLogic.dart';

class PageRouter {
  static const PageRoot = "/";
  static const NotFoundPage = "/404";
  static const PageFeedList = "/nane_list";
  static const PageChatList = "/nane_chat";
  static const PageUserProfile = "/nane/wen/user";
  static const PagePhotoViewer = "/photo_viewer_wen";
  static const PageVideoViewer = "/wen/video_viewer_wen";
  static const PageChatDetail = "wen/chat/detail";
  static const PageChatNotifyList = "wen/chat/notify";
  static const LoginPage = "/login/wen/page";
  static const PhoneCallPage = "page/wen/phone_call";
  static const SettingPage = "profile/wen/setting";
  static const BlackListPage = "profile/wen/blacklist/page";
  static const MatchingPage = "match/wen/matching_nane";
  static const WebviewPage = "nane/h5/wen/webview_page";
  static const MediaEditPage = "me/nane/wen/media_edit_page";
  static const EditUserInfoPage = "me/nane/profile/wen/edit_user_info";
  static const GiftPage = "/gift/wen/wen_gift";
  static const SvgaPlayerPage = "/svga_player_page";
  static const UserMediaPage = "/discover/wen/nane/user/view";
  static const BalancePage = "/nane/wen/balance_page";
  static const VipPage = "/profile/wen/me/pagevip";
  static const FirstChargePopupPage = "/nane/wen/first_charge_page";
  static const VipChargePopupPage = "/profile/wen/vip_charge";
  static const PayHandlerPage = "/profile//wenpage/pay/nane/handler";
  static const LoginWithIdPage = "/login/wen/id";
  static const FeedbackBtmDlg = "/dialog/wen/feedback_btm";
  static const EditUserInfoBtmDlg = "/wen_dlg/wen/edit_user_info";
  static const RegionFilterBtmDlg = "/dlg/wen/region_filter";
  static const AvatarCameraPage = "page/profile/avatar_camera";
  static const RulesPage = "discover/nane/Rules";
  static const VipBuyView = "pro/nane/VipBuyView";
  static const ChatListTip = "/wen/nane/ChatListTip";

  static final instance = PageRouter._internal();

  final router = FluroRouter();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // final _pageStack = <String>[]; //页面栈
  String _topPage = PageRoot; //当前页面

  String get topPage => _topPage;

  //路由配置表
  final Map<String, Handler> _routerMap = {
    PageRoot: RootHandler,
    PageChatList: ChatListHandler,
    PagePhotoViewer: PhotoViewHandler,
    PageChatDetail: ChatDetailHandler,
    PageVideoViewer: VideoViewHandler,
    PageChatNotifyList: ChatNotifyListHandler,
    LoginPage: LoginPageHandler,
    PhoneCallPage: PhoneCallPageHandler,
    SettingPage: SettingPageHandler,
    MatchingPage: MatchingPageHandler,
    WebviewPage: WebviewPageHandler,
    BlackListPage: BlackListPageHandler,
    MediaEditPage: MediaEditPageHandler,
    EditUserInfoPage: EditUserInfoPageHandler,
    GiftPage: GiftPageHandler,
    SvgaPlayerPage: SvgaPlayerPageHandler,
    UserMediaPage: UserMediaPageHandler,
    BalancePage: BalancePageHandler,
    VipPage: VipPageHandler,
    PayHandlerPage: PayHandlePageHandler,
    LoginWithIdPage: LoginWithIdPageHandler,
    AvatarCameraPage: AvatarCameraPageHandler,
  };

  PageRouter._internal() {
    initConfigs();
  }

  void initConfigs() {
    router.notFoundHandler = NotFoundHandler;
    _routerMap.forEach((key, value) {
      router.define(key, handler: value);
    });
  }

  void onTopPageChange(String? pageName) {
    AuvChatLog.d('[Flutter_PageRouter] onTopPageChange: $pageName');
    //null表示是弹窗，暂时忽略
    if (pageName != null) {
      _topPage = pageName;
    }
  }

  // void onPagePushed(String pageName) {
  //   _pageStack.add(pageName);
  // }
  //
  // void onPagePopped() {
  //   _pageStack.removeLast();
  // }

  static bool canCurrPagePop() {
    return navigatorKey.currentState?.canPop() == true;
  }

  static void popCurrPage<T>({BuildContext? context, T? result}) {
    var popContext = context ?? navigatorKey.currentContext;
    if (popContext != null) {
      FluroRouter.appRouter.pop(popContext, result);
    }
  }

  //基本类型参数通过params传递
  //传递object参数，可通过routeSettings
  //routeSettings: RouteSettings(
  //     arguments: MyArgumentsDataClass('foo!'),
  //   ),
  //在handler获取
  //final args = context.settings.arguments as MyArgumentsDataClass;
  static Future routePage(BuildContext context, String pageName,
      {Map<String, dynamic>? params,
      bool replace = false,
      bool clearStack = false,
      bool maintainState = true,
      bool rootNavigator = false,
      TransitionType? transition,
      Duration? transitionDuration,
      RouteTransitionsBuilder? transitionBuilder,
      RouteSettings? routeSettings,
      bool? opaque}) {
    var url = pageName;
    if (!Utils.isEmpty(params)) {
      url = '$url?';
      params?.forEach((key, value) => url = '$url$key=$value&');
    }
    AuvChatLog.d('[Flutter_Open] $url');
    return instance.router.navigateTo(context, url,
        replace: replace,
        clearStack: clearStack,
        maintainState: maintainState,
        rootNavigator: replace,
        transition: transition,
        transitionBuilder: transitionBuilder,
        transitionDuration: transitionDuration,
        routeSettings: routeSettings,
        opaque: opaque);
  }

  static startUserProfilePage(BuildContext context, int? uid) {
    if (uid != null) {
      // routePage(context, PageUserProfile,params: {"uid":uid});
      ProfilePageStartup.open(context, uid);
    }
  }

  ///拨号通话
  static Future? startChatCall(
      BuildContext context, CommonUser user, int payFromType,
      {AppChatCall? chatCall}) async {
    final uid = user.uid;
    if (uid == null) {
      Fluttertoast.showToast(
          msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
      return null;
    }
    // CommonUserOnlineStatus? onlineStatus =
    //     UserOnlineStatesNotifier.onlineMap?[uid] ?? user.onlineStatus;

    WenanUserOnlineStatusEnum? onlineStatus =  WenanUserOnlineStatusManager().getStatus(uid);
    AuvChatLog.d("startChatCall, onlineStatus: $onlineStatus");
    if (onlineStatus == null || onlineStatus == WenanUserOnlineStatusEnum.online) {
      AuvChatLog.d("startChatCall onlineStatus is null");
      try {
        final resp = await ProfileApi(DioHelper.getInstance())
            .getUserOnLineStatus("$uid");
        AuvChatLog.d(
            "startChatCall getUserOnLineStatus resp:${resp.toJson()}}");
        if (resp.code == 0) {
          if (!Utils.isEmptyList(resp.data?.online_status) &&
              resp.data!.online_status![0].uid == uid) {
            onlineStatus = WenanUserOnlineStatusRefresher.instance.updateUserStatus(resp.data!.online_status![0]);
          }
        }
      } catch (e, stackTrace) {
        AuvChatLog.printE(e, error: e, stackTrace: stackTrace);
      }
      if (onlineStatus == null) {
        Fluttertoast.showToast(
            msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
        return null;
      }
    }
    AuvChatLog.d("startChatCall, onlineStatus2: $onlineStatus");
    try {
      final checkCallRsp = await CallApi.sendCheckVideoCallReq(uid).first;

      if (onlineStatus == WenanUserOnlineStatusEnum.online) {
        //对方的状态可以打电话
        if (checkCallRsp.noDisturb == 1) {
          Fluttertoast.showToast(
              msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_can_not_start_is_calling));
          return null;
        }
        if (checkCallRsp.hasExpCard == 1 ||
            checkCallRsp.balance >= checkCallRsp.chatPrice) {
          AuvChatLog.d("startChatCall user:${user.toJson()}");
          Map<Permission, PermissionStatus> statuses = await [
            Permission.camera,
            Permission.microphone,
          ].request();

          if (statuses[Permission.camera] == PermissionStatus.granted &&
              statuses[Permission.microphone] == PermissionStatus.granted) {
            //
            Map<String, dynamic> data = {};
            data["user"] = user;
            data["chatCall"] = chatCall ?? AppChatCall.callInvite(user.uid!);
            return routePage(context, PageRouter.PhoneCallPage,
                routeSettings: RouteSettings(arguments: data));
          } else {
            //缺少必要权限
            Fluttertoast.showToast(
                msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_permission_required));
            return null;
          }
        } else {
          SharedViewLogic.showFirstRechargeModal(context, payFromType);
        }
      } else {
        if (checkCallRsp.hasExpCard == 1 ||
            checkCallRsp.balance >= checkCallRsp.chatPrice) {
          //我有给对方打电话的能力
          if (onlineStatus.isBusy()) {
            Fluttertoast.showToast(
                msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_the_user_is_busy));
            return null;
          } else {
            Fluttertoast.showToast(
                msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_the_girl_offline_try_other));
            return null;
          }
        } else {
          SharedViewLogic.showFirstRechargeModal(context, payFromType);
        }
      }
    } catch (e) {
      if (e is SocketRspError) {
        Fluttertoast.showToast(
            msg: Utils.isEmpty(e.errorMsg)
                ? StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed) : e.errorMsg!);
      }
    }
  }

  static Future startViewPhoto(
      BuildContext context, MediaPhotoViewerDataSource dataSource) {
    return routePage(context, PagePhotoViewer,
        routeSettings: RouteSettings(arguments: dataSource));
  }

  static Future startViewVideo(
      BuildContext context, MediaVideoViewerDataSource dataSource) {
    return routePage(context, PageVideoViewer,
        routeSettings: RouteSettings(arguments: dataSource));
  }

  static Future startChatDetailPage(
      BuildContext context, Map<String, dynamic> dataSource) {
    return routePage(context, PageChatDetail,
        routeSettings: RouteSettings(arguments: dataSource));
  }

  static Future pushPage(BuildContext context, String pageName) {
    return routePage(context, pageName, transition: TransitionType.cupertino);
  }

  static Future startWebview(BuildContext context, String webviewUrl) {
    return routePage(context, WebviewPage,
        routeSettings: RouteSettings(arguments: webviewUrl),
        transition: TransitionType.cupertino);
  }

  static startBrowserWeb(BuildContext context, String url) {
    return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  static Future startSvgaPlayer(BuildContext context, String svgaPath,
      {String? svgaIcon}) {
    return routePage(context, SvgaPlayerPage,
        routeSettings: RouteSettings(
            arguments: {"svgaPath": svgaPath, "svgaIcon": svgaIcon}),
        transition: TransitionType.none,
        opaque: false);
  }

  static Future startProfilePage(BuildContext context, CommonUser user) {
    return routePage(context, UserMediaPage,
        routeSettings: RouteSettings(arguments: user),
        transition: TransitionType.cupertino);
  }

  static Future startPayHandlerPage(
      BuildContext context, PaymentOption paymentOption, int fromType) {
    return routePage(context, PayHandlerPage,
        routeSettings: RouteSettings(arguments: paymentOption),
        params: {"fromType": fromType},
        transition: TransitionType.cupertino);
  }
}
