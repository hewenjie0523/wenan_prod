import 'dart:convert';
import 'dart:io';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:android_id/android_id.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:uuid/uuid.dart';


class AppConfig {
  static const bool inProduction = bool.fromEnvironment("dart.vm.product"); //
  static const String apiUrlOnline = "https://api.ucmetas.com/g/req/";
  static String userPrivacy = "$h5Url/privacy.html";
  static String userAgreement = "$h5Url/terms.html";
  static const String apiUrl = apiUrlOnline;
  static const String hostUrl = hostOnlineUrl;
  static const String h5Url = h5OnlineUrl;
  static const String hostOnlineUrl = "https://api.ucmetas.com";
  static const String h5OnlineUrl = "https://h5.ucmetas.com";
  static const String h5ChatUrl = "$h5OnlineUrl/chat";
  static const String h5SysMsgUrl = "$h5OnlineUrl/sysmsg";
  static const String h5AnchorOnlineUrl = "$h5OnlineUrl/aonline";
  static const String _defaultSecretKey = "eWlobzpCNGZYc2xjQk9ROFpDOEE1QTQ=";
  static const String adjustID = "2jyda8e54d4w";
  static const String adjustPayEvent = "g19rnt";
  static const String adjustLoginEvent = "a3pyhe";
  static const bool printSocketLog = false;
  static const String flurryKey = "MSS3X6DT3R3999FG6XPX";
  static const String oneSignalAppId = "89e6353a-210f-46db-9098-9830f3a50e94";

  static String get defaultSecretKey {
    String keys = Utils.base64Decode(_defaultSecretKey);
    return keys.split(":")[1];
  }

  static PackageInfo? _packageInfo;
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static AndroidDeviceInfo? _androidInfo;

  static IosDeviceInfo? _iosInfo;

  static WebBrowserInfo? _webBrowserInfo;

  static bool inited = false;

  static String? deviceId;

  //既便被调用多次，也不影响数据正确性，比阻塞应用初始化要好，但现在服务端接口依赖包名，必须阻塞初始化了
  static Future<void> init() async {
    ///经过测试 必须阻塞等待 拿到正确的包名和deviceId之后才能auth成功
    await _innerInit();
  }

  static Future<void> _innerInit() async {
    if (inited) {
      return;
    }
    try {
      _packageInfo = await PackageInfo.fromPlatform();
      if (Platform.isAndroid) {
        _androidInfo = await _deviceInfo.androidInfo;
        deviceId = await const AndroidId().getId();
      }
      if (Platform.isIOS) {
        _iosInfo = await _deviceInfo.iosInfo;
        deviceId =  _iosInfo?.identifierForVendor ?? "";
      }
      deviceId = await _safeDeviceId(deviceId);
      _webBrowserInfo = await _deviceInfo.webBrowserInfo;
    } catch (e) {
      AuvChatLog.e(e.toString(), error: e);
    }
    inited = true;
  }

  static Future<String> _safeDeviceId(String? deviceId) async {
    deviceId ??= const Uuid().v4();
    return deviceId;
  }

  static PackageInfo? getPackageInfo() {
    if (_packageInfo == null) {
      PackageInfo.fromPlatform().then((value) => _packageInfo = value);
    }
    return _packageInfo;
  }

  static String get packageName {
    return _packageInfo?.packageName ?? "flutter";
  }

  static String get appVersion {
    return _packageInfo?.version ?? "";
  }

  static String get appName {
    return _packageInfo?.appName ?? "Wenan";
  }

  static String get agoraAppId {
    return SpHelper.getAgoraAppId() ?? "";
  }

  static String get aiHelpAppId {
    return SpHelper.getAIHelpAppId() ?? "";
  }

  static String get aiHelpAppKey {
    return SpHelper.getAIHelpAppKey() ?? "";
  }

  static String get aiHelpDomain {
    return SpHelper.getAIHelpDomain() ?? "";
  }

  static String get browserUserAgent {
    return _webBrowserInfo?.userAgent ?? "";
  }

  static String get iosRoomInfo {
    return _iosInfo == null ? "IOS" : "${_iosInfo!.systemName ?? "IOS"}(${_iosInfo!.systemVersion ?? ""})";
  }

  static String get androidRoomInfo {
    return "Android(${_androidInfo?.version.sdkInt?.toString() ?? ""})";
  }

  static String get roomInfo {
    return Platform.isIOS ? iosRoomInfo : androidRoomInfo;
  }

  static String get brand {
    return (Platform.isIOS ? _iosInfo?.systemName : _androidInfo?.brand) ?? "";
  }

  static String get model {
    return (Platform.isIOS ? _iosInfo?.model : _androidInfo?.model) ?? "";
  }

  // static String get deviceId {
  //   // device_info_plus no longer exposes androidId directly; use android_id package
  //   if (Platform.isIOS) {
  //     return _iosInfo?.identifierForVendor ?? "";
  //   }
  //   // For Android, attempt to read via android_id synchronously cached (best-effort)
  //   // Caller expecting fast access; fall back to brand+model when not yet available
  //   try {
  //     // This requires async to be accurate; consider exposing an async getter if needed
  //     // Here we return cached value via environment if present
  //     // As a fallback, return empty and let server correlate by other signals
  //     // Note: A truly correct solution is to store once during init
  //   } catch (_) {}
  //   return "";
  // }

  static String get userAgent {
    return "$browserUserAgent $packageName/$appVersion $roomInfo";
  }

  static Future<String> getUserAgentForce() async {
    if (inited) {
      return userAgent;
    } else {
      await _innerInit();
      return userAgent;
    }
  }

  static bool get isDebug => !inProduction;

  static AppConfigRsp? getCachedAppConfig() {
    var cachedConfig = SpHelper.getCurrAppConfigJson();
    if (!Utils.isEmpty(cachedConfig)) {
      return AppConfigRsp.fromJson(jsonDecode(cachedConfig!));
    }

    return null;
  }

  static bool hasNgc(String code) {
    AppConfigRsp? rsp = getCachedAppConfig();
    if (Utils.isEmptyString(rsp?.data?.extensions?.ngc)) {
      return false;
    }
    List<String>? ngcs = rsp?.data?.extensions?.ngc!.split(",");
    return (ngcs?.indexOf(code) ?? -1) >= 0;
  }

  static bool showUserChatPrice(int? chatPrice) {
    // AuvChatLog.d(
    //     "showUserChatPrice hasRecharge:${Application.commonUser?.hasCharged} config:${getCachedAppConfig()?.data?.hide_price_when_amount_zero} chat_price:${user?.extend?.profile?.chat_price ?? 0}");
    var hasRecharge = Application.commonUser?.hasCharged;
    if (hasRecharge == null) return false;
    var configOn = getCachedAppConfig()?.data?.hide_price_when_amount_zero == 1;
    if (configOn && !hasRecharge) return false;
    if ((chatPrice ?? 0) <= 0) return false;
    return true;
  }
}
