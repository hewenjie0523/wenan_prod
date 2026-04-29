import 'dart:convert';

import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/http/UserApi.dart';
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/data/AdjustAdInfo.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/event/WenanChatPriceEvent.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/db/repository/im/WenanCodeChatContext.dart';
import 'package:wenan/http/socket/WenanCodecall_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_manager.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/WenanCodePhoneCallPage.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

import 'WenanCodeAppConfiguration.dart';

class Application {
  static String get session {
    if (!isLogin()) {
      return "";
    }
    if (Utils.isEmpty(_session)) {
      _session = SpHelper.getAppSession();
    }
    return _session;
  }

  static String _session = "";
  static String get secretKey {
    if (Utils.isEmpty(_secretKey)) {
      _secretKey = SpHelper.getAppSecret();
    }
    return Utils.isEmpty(_secretKey) ? AppConfig.defaultSecretKey : _secretKey;
  }

  static String _secretKey = AppConfig.defaultSecretKey;

  static CommonUser? _commonUser;
  static CommonUser? get commonUser =>_commonUser;
  static int? realBalance;
  static String userPath = "";
  static String cachePath = "";
  static final EventBus _eventBus = EventBus();

  static var keyboardHeight = 200;
  static EventBus get eventBus => _eventBus;
  static bool _isForeground = true;
  static bool get isForeground => _isForeground;
  static ChatContext chatContext = ChatContext();
  static String appRootPath = "";
  static BuildContext? appContext;
  static bool registerActive = false;
  static MethodChannel? methodChannel;

  static AdjustAdInfo? _adjustAdInfo;

  static int tabIndex = 0;

  static bool showImTips = false;

  static void updateCommonUser(CommonUser? pCommonUser){
     _commonUser = pCommonUser;
  }

  static Future<AdjustAdInfo?> get adjustAdInfo async {
    if (_adjustAdInfo == null) {
      AdjustAttribution attribution = await Adjust.getAttribution();
      _adjustAdInfo = AdjustAdInfo(
          attribution.trackerToken,
          attribution.trackerName,
          attribution.network,
          attribution.campaign,
          attribution.adgroup,
          attribution.creative,
          attribution.clickLabel,
          attribution.adid,
          attribution.costType,
          attribution.costAmount?.toString(),
          attribution.costCurrency);
    }
    return _adjustAdInfo;
  }

  static int currUserId() {
    return commonUser?.uid ?? 0;
  }

  static int currUserCode() {
    return Utils.parseInt(commonUser?.ucode) ?? 0;
  }

  static bool isLogin() {
    AuvChatLog.d("Application isLogin() ${currUserId()} $_session");
    return currUserId() > 0 && !Utils.isEmpty(_session);
  }

  static bool isUserStatusOk() {
    return isLogin() && (commonUser?.status ?? 0) > 0;
  }

  static const String channelName = "com.wenan.mobile.channel";

  static Future init() async {
    AuvChatLog.d("Application init start");
    try {
      await _initAsync();
      await AppConfig.init();
      PushHelper.initOneSignal();
      refreshUserInfo();
      await _initPaths();
      await initAdjust();
      //聊天相关资源初始化依赖于user信息
      await chatContext.init();
      await CallApi.listenOn();
      SocketManager.instance.connect();
      methodChannel = const MethodChannel(channelName);
      methodChannel?.setMethodCallHandler((call) async {
        AuvChatLog.d(
            "Application methodChannel on call ${call.method} ${call.arguments}");
        if (call.method == '$channelName.installReferrer') {
          String installReferrer = call.arguments['$channelName.installReferrer'];
          int referrerClickTimestampSeconds =
              call.arguments['$channelName.referrerClickTimestampSeconds'];
          int installBeginTimestampSeconds =
              call.arguments['$channelName.installBeginTimestampSeconds'];
          bool instantExperienceLaunched =
              call.arguments['$channelName.instantExperienceLaunched'];
          // Your method logic here
          AuvChatLog.d(
              "installReferrer $installReferrer $referrerClickTimestampSeconds $installBeginTimestampSeconds $instantExperienceLaunched");
          AppCache.instance
              .putUserSharePref(AppCacheKeys.installReferrer, installReferrer);
          AppCache.instance.putUserSharePref(
              AppCacheKeys.referrerClickTimestampSeconds,
              referrerClickTimestampSeconds);
          AppCache.instance.putUserSharePref(
              AppCacheKeys.installBeginTimestampSeconds,
              installBeginTimestampSeconds);
          AppCache.instance.putUserSharePref(
              AppCacheKeys.instantExperienceLaunched,
              instantExperienceLaunched);
        } else if (call.method == '$channelName.notifyKeyboardChange') {
          try {
            int keyboardHeight = call.arguments['$channelName.height'];
            if (keyboardHeight > 0) {
              Application.keyboardHeight = keyboardHeight;
            }
            eventBus.fire(KeyBoardEvent(keyboardHeight));
          } catch (e) {
            print(e);
          }
        }
      });
      DataReporter.initFlurry();
      AuvChatLog.d("Application init end");
    } catch (e, stack) {
      AuvChatLog.printE(e, error: e, stackTrace: stack);
    }
    // ChatEmojiManager.instance.getEmojiInfoList();
  }

  static Future<dynamic> callPlatformMethod(String methodName, [dynamic arguments]) async {
    try {
     return await methodChannel?.invokeMethod(methodName, arguments);
    } catch (e) {
      AuvChatLog.printE(e);
    }
  }

  //需要同步操作的初始化动作放这里
  static Future<void> _initAsync() async {
    await SpHelper.init();
    await GetStorage.init();
    initSdks();
    // try {
    //   AuvChatLog.d("_initAsync PhoneCallManager");
    //   await PhoneCallManager.init();
    // } catch (e) {
    //   AuvChatLog.printE(e);
    // }
  }

  static _initPaths() async {
    final documentPath = await getApplicationDocumentsDirectory();
    userPath = Path.join(documentPath.path, currUserId().toString());
    await PathUtils.makeSureDirectory(userPath);
    cachePath = Path.join(documentPath.path, 'cache');
    await PathUtils.makeSureDirectory(cachePath);
    appRootPath = Path.join(documentPath.path, "app");
    await PathUtils.makeSureDirectory(appRootPath);
  }

  static refreshUserInfo() {
    String? userInfoJson = SpHelper.getCurrUserJson();
    AuvChatLog.d('[initApp] userInfoJson: $userInfoJson');
    Map<String, dynamic>? info =
        Utils.isEmptyString(userInfoJson) ? null : json.decode(userInfoJson!);
    if (!Utils.isEmptyMap(info)) {
      _commonUser = CommonUser.fromJson(info!);

      _session = SpHelper.getAppSession();
      _secretKey = SpHelper.getAppSecret();

      AuvChatLog.d('[initApp] session: $session,isLogin=${isLogin()}');
      // String tokenInfoJson = SpHelper.getQiniuTokenInfo();
      // if (!Utils.isEmpty(tokenInfoJson)) {
      //   AuvChatLog.d('[initApp] tokenInfoJson: $tokenInfoJson');
      //   Map<String, dynamic> info = json.decode(tokenInfoJson);
      //   qnImageToken = info['image_token'];
      //   qnVideoToken = info['video_token'];
      //   qnVoiceToken = info['voice_token'];
      //   qnTokenExpiredTime = Utils.parseInt(info['expire_time']);
      // }
    }
    PushHelper.updatePushAlias();
  }

  static updateHasRecharge() async {
    UserInfoRsp rsp = await UserApi(DioHelper.getInstance()).updateUserInfo();
    if (rsp.code == 0) {
      CommonUser? user = rsp.getData();
      if (_commonUser?.extend?.has_recharge != user?.extend?.has_recharge) {
        _commonUser?.extend?.has_recharge = user?.extend?.has_recharge;
        SpHelper.setCurrUserJson(jsonEncode(Application.commonUser));
        eventBus.fire(ChatPriceEvent());
      }
    }
  }

  static void onAppForegroundChange(bool isForegroundValue) {
    _isForeground = isForegroundValue;
    if (isForeground) {
      Adjust.onResume();
      onAppForeground();
    } else {
      Adjust.onPause();
      onAppBackground();
    }
  }

  static void onAppForeground() {
    SocketManager.instance.connect();
  }

  static void onAppBackground() {
    if (!PhoneCallPage.inCalling("Application")) {
      SocketManager.instance.disconnect();
    }
  }

  static bool isSocketAuthed() {
    return false;
  }

  static void initSdks() {}

  static String getLanguageCode() {
    var locale = Localizations.maybeLocaleOf(appContext!);
    final String languageCode = locale?.languageCode.toLowerCase() ?? "";
    return languageCode;
  }

  static bool isARLanguage() {
    return getLanguageCode() == 'ar' || getLanguageCode() == "ur";
  }

  static AppLocalizations? get appLocalizations =>
      appContext != null ? AppLocalizations.of(appContext!) : null;

  //退出登录
  static void quit() {
    AuvChatLog.d("onUser quit:");
    SpHelper.setCurrUserJson("");
    _commonUser = null;
    _session = "";
    SpHelper.setAppSession("");
    _secretKey = AppConfig.defaultSecretKey;
    SpHelper.setAppSecret(AppConfig.defaultSecretKey);
    chatContext.onUserChange(true);
    SocketManager.instance.disconnect();
  }

  static void onUserLogin() async {
    AuvChatLog.d("onUserLogin:");
    refreshUserInfo();
    await _initPaths();
    chatContext.onUserChange(false);
    SocketManager.instance.connect();
  }

  static initAdjust() async {
    AuvChatLog.d("Application initAdjust init");
    AdjustConfig config = AdjustConfig(
        AppConfig.adjustID,
        AppConfig.isDebug
            ? AdjustEnvironment.sandbox
            : AdjustEnvironment.production);
    config.logLevel = AdjustLogLevel.verbose;
    config.sendInBackground = true;
    config.attributionCallback = (AdjustAttribution attributionChangedData) {
      AuvChatLog.d("Application initAdjust attributionCallback");
      if (attributionChangedData.trackerToken != null) {
        AuvChatLog.d(
            '[Adjust]: Tracker token: ' + attributionChangedData.trackerToken!);
      }
      if (attributionChangedData.trackerName != null) {
        AuvChatLog.d(
            '[Adjust]: Tracker name: ' + attributionChangedData.trackerName!);
      }
      if (attributionChangedData.campaign != null) {
        AuvChatLog.d('[Adjust]: Campaign: ' + attributionChangedData.campaign!);
      }
      if (attributionChangedData.network != null) {
        AuvChatLog.d('[Adjust]: Network: ' + attributionChangedData.network!);
      }
      if (attributionChangedData.creative != null) {
        AuvChatLog.d('[Adjust]: Creative: ' + attributionChangedData.creative!);
      }
      if (attributionChangedData.adgroup != null) {
        AuvChatLog.d('[Adjust]: Adgroup: ' + attributionChangedData.adgroup!);
      }
      if (attributionChangedData.clickLabel != null) {
        AuvChatLog.d(
            '[Adjust]: Click label: ' + attributionChangedData.clickLabel!);
      }
      if (attributionChangedData.adid != null) {
        AuvChatLog.d('[Adjust]: Adid: ' + attributionChangedData.adid!);
      }
      if (attributionChangedData.costType != null) {
        AuvChatLog.d(
            '[Adjust]: Cost type: ' + attributionChangedData.costType!);
      }
      if (attributionChangedData.costAmount != null) {
        AuvChatLog.d('[Adjust]: Cost amount: ' +
            attributionChangedData.costAmount!.toString());
      }
      if (attributionChangedData.costCurrency != null) {
        AuvChatLog.d(
            '[Adjust]: Cost currency: ' + attributionChangedData.costCurrency!);
      }
      _adjustAdInfo = AdjustAdInfo(
          attributionChangedData.trackerToken,
          attributionChangedData.trackerName,
          attributionChangedData.network,
          attributionChangedData.campaign,
          attributionChangedData.adgroup,
          attributionChangedData.creative,
          attributionChangedData.clickLabel,
          attributionChangedData.adid,
          attributionChangedData.costType,
          attributionChangedData.costAmount?.toString(),
          attributionChangedData.costCurrency);
      AppCache.instance.put(AppCacheKeys.ADJUST_AD_INFO_UPLOADED, false);
      updateAdjustAdInfo();
    };
    if (isLogin()) {
      Adjust.addSessionCallbackParameter("user_id", "${currUserId()}");
    }

    Adjust.start(config);
  }

  static void updateAdjustAdInfo() async {
    if (!isLogin() ||
        AppCache.instance.get(AppCacheKeys.ADJUST_AD_INFO_UPLOADED) == true) {
      return;
    }

    adjustAdInfo.then((value) async {
      if (value != null) {
        // AuvChatLog.d("Application _updateAdjustAdInfo");
        var rsp = await ProfileApi(DioHelper.getInstance())
            .uploadAdjustInfo(jsonEncode(value));
        if (rsp.code == 0) {
          AppCache.instance.put(AppCacheKeys.ADJUST_AD_INFO_UPLOADED, true);
          // coupon check
          PhoneCallNotify.checkAvailableCoupon();
        }
      }
    });
  }

  static bool installRefUpdated = false;
  static void updateInstallRef() {
    AuvChatLog.d("installRefUpdated=$installRefUpdated");
    if (!installRefUpdated) {
      installRefUpdated = true;
      callPlatformMethod("${Application.channelName}.upgradeInstallReferrer");
    }
  }

  static void upgradeVersion(CommonApi commonApi) async{
    String currVersion = AppConfig.appVersion;
    AuvChatLog.d("loadConfigFromCloud:currVersion=$currVersion,sp=${SpHelper.getAppVersionUpgraded()}");
    if(currVersion!=""){
      if(SpHelper.getAppVersionUpgraded()!=currVersion){
        try {
          RawDataRsp rsp = await commonApi.upgradeVersion(AppConfig.appVersion);
          if(rsp.code==0){
            SpHelper.setAppVersionUpgraded(currVersion);
          }
        } catch (e) {
          AuvChatLog.printE(e);
        }
      }
    }
  }

  static void statsAppStartup(CommonApi commonApi) async{
    AuvChatLog.d("statsAppStartup id=${SpHelper.getAppStartupId()}");
    if(SpHelper.getAppStartupId()==0){
      try {
        RawDataRsp rsp = await commonApi.statsAppStartUp(AppConfig.packageName,AppConfig.appVersion,"0");
        if(rsp.code==0){
          SpHelper.setAppStartupId(Utils.parseInt(rsp.data["app_id"])??0);
        }
      } catch (e) {
        AuvChatLog.printE(e);
      }
    }
  }

  static void getIds({CommonApi? commonApi,bool force = false}) async{
    try {
      AuvChatLog.d("getIds:force=$force");
      if(!force&&!Utils.isEmptyString(SpHelper.getAgoraAppId())){
        return;
      }
      CommonApi api = commonApi??CommonApi(DioHelper.getInstance());
      LoginConfigRsp rsp = await api.ticket(AppConfig.packageName,AppConfig.appVersion);
      if(rsp.code==0){
        if(rsp.data?.login_entries!=null){
          SpHelper.setAgoraAppId(rsp.data?.login_entries?.agora_app_id??"");
          SpHelper.setAIHelpAppId(rsp.data?.login_entries?.ai_help_app_id??"");
          SpHelper.setAIHelpAppKey(rsp.data?.login_entries?.ai_help_app_key??"");
          SpHelper.setAIHelpDomain(rsp.data?.login_entries?.ai_help_domain??"");
        }
      }
    } catch (e) {
      AuvChatLog.printE(e);
    }
  }

  static void getFromC() async{
    AuvChatLog.d("getFromC");
    CommonApi commonApi = CommonApi(DioHelper.getInstance());
    upgradeVersion(commonApi);
    statsAppStartup(commonApi);
    getIds(commonApi:commonApi,force: true);
  }
}
