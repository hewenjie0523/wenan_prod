import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppConfig.g.dart';


class AppHttp {
  String? url;
  
  String? port = "0";
  
  String? weight;

  AppHttp();

  factory AppHttp.fromJson(Map<String, dynamic> json) => _$AppHttpFromJson(json);

  Map<String, dynamic> toJson() => _$AppHttpToJson(this);
}


class AppSocket {
  
  String? host;
  
  String? port = "0";
  
  String? weight;

  AppSocket();

  factory AppSocket.fromJson(Map<String, dynamic> json) => _$AppSocketFromJson(json);

  Map<String, dynamic> toJson() => _$AppSocketToJson(this);
}


class AppRouter {
  
  List<AppHttp>? https;
  
  List<AppSocket>? sockets;

  AppRouter();

  factory AppRouter.fromJson(Map<String, dynamic> json) => _$AppRouterFromJson(json);

  Map<String, dynamic> toJson() => _$AppRouterToJson(this);
}


class AppIav {
  String? version;
  
  String? bundleId;
  String? channel;

  AppIav();

  factory AppIav.fromJson(Map<String, dynamic> json) => _$AppIavFromJson(json);

  Map<String, dynamic> toJson() => _$AppIavToJson(this);
}



class AppExtensions {

  
  bool? enable_google_login;
  
  bool? enable_facebook_login;
  String? user_stats_url;
  String? contact_number;
  String? faq;
  String? ngc;

  AppExtensions();

  factory AppExtensions.fromJson(Map<String, dynamic> json) => _$AppExtensionsFromJson(json);

  Map<String, dynamic> toJson() => _$AppExtensionsToJson(this);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);
}


class AppConfig {
  String? iav;
  AppRouter? router;
  List<AppIav>? iavs;
  List<AppIav>? iavs_android;
  AppExtensions? extensions;
  ///当没有支付过时，隐藏价格
  int hide_price_when_amount_zero = 0;

  AppConfig();

  String? iavByBundleId(String bundleId) {
    if (Utils.isEmptyString(bundleId)) return null;
    if (Utils.isEmptyList(iavs)) return null;
    for (final iav in iavs!) {
      if (iav.bundleId == bundleId) {
        return iav.version;
      }
    }
    return null;
  }

  String? iavByAndroidChanel(String bundleId,String channel) {
    if (Utils.isEmptyString(bundleId)||Utils.isEmptyString(channel)) return null;
    if (Utils.isEmptyList(iavs_android)) return null;
    for (final iav in iavs_android!) {
      if (iav.bundleId == bundleId&&iav.channel==channel) {
        return iav.version;
      }
    }
    return null;
  }

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static bool isInIav(String v, String iav) {
    return Utils.isEmptyString(v) ? true : v == iav;
  }
}
