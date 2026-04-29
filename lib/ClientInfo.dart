import 'package:wenan/StringTranslate.dart';
import 'dart:io';
import 'dart:ui';

import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';

part 'ClientInfo.g.dart';


class ClientInfo{
  String? version;//所有类型填写, 客户端版本
  String? brand;//所有类型填写, 手机品牌
  String? model;//设备型号。
  String? platform;//所有类型填写, 客户端平台
  String? system;//所有类型填写, 操作系统版本
  String? channel;//所有类型填写, 客户端渠道信息
  int? screen_width;//所有类型填写, 屏幕宽度
  int? screen_height;//所有类型填写, 屏幕高度
  String? device_id;//设备唯一标识。
  String? timeZoneId;//时区id
  String? lang;
  String? appPackage;
  String? installReferrer ="";// 已安装软件包的引荐来源网址
  int? referrerClickTimestampSeconds =0;// 引荐来源网址点击事件发生时的时间戳（以秒为单位）
  int? installBeginTimestampSeconds =0;// 安装开始时的时间戳（以秒为单位）
  bool? instantExperienceLaunched = false;// 用于检查用户在过去 7 天内是否曾与应用的免安装体验互动
  String? ad_info = "";

  ClientInfo(){
    version = AppConfig.appVersion;
    brand = AppConfig.brand;
    model = AppConfig.model;
    platform = Platform.isIOS?"iOS":"Android";
    system = AppConfig.roomInfo;
    screen_width = window.physicalSize.width.toInt();
    screen_height = window.physicalSize.height.toInt();
    timeZoneId = DateTime.now().timeZoneName;
    lang = "${window.locale.languageCode}_${window.locale.countryCode}";
    appPackage = AppConfig.packageName;
    device_id = "$appPackage${AppConfig.deviceId}";
    installReferrer = AppCache.instance.getUserSharePref(AppCacheKeys.installReferrer)??"";
    referrerClickTimestampSeconds = AppCache.instance.getUserSharePref(AppCacheKeys.referrerClickTimestampSeconds)??0;
    installBeginTimestampSeconds = AppCache.instance.getUserSharePref(AppCacheKeys.installBeginTimestampSeconds)??0;
    instantExperienceLaunched = AppCache.instance.getUserSharePref(AppCacheKeys.instantExperienceLaunched)??false;
  }

  ///给三方使用的UserAgent
  String get payUserAgent {
    return "Mozilla/5.0 ($platform)";
  }

  factory ClientInfo.fromJson(Map<String, dynamic> json) {
    final u = _$ClientInfoFromJson(json);
    return u;
  }

  Map<String, dynamic> toJson() => _$ClientInfoToJson(this);
}