import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/AppConfig.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/QiniuToken.dart';
import 'package:wenan/data/Region.dart';
import 'package:wenan/data/user/UserAccount.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'CommonApi.g.dart';

abstract class CommonApi {
  factory CommonApi(Dio dio, {String baseUrl}) = _CommonApi;

  Future<AppConfigRsp> getConfig(String clientInfo);

  Future<QiniuTokenRsp> qiniuToken();

  Future<RawDataRsp> reportUser(int target_uid, int type, String? reason);

  Future<ListRegionRspMap> listRegions();

  Future<GiftsResp> gifts();

  Future<UserAccountRespMap> walletAccount(int type);

  Future<LoginConfigRsp> ticket(String package_name, String version);

  Future<RawDataRsp> upgradeVersion(String version);

  Future<RawDataRsp> statsAppStartUp(String package_name, String version, String app_id);
}

class AppConfigRsp extends BaseRsp<AppConfig> {
  AppConfig? data;

  AppConfigRsp();

  factory AppConfigRsp.fromJson(Map<String, dynamic> json) => _$AppConfigRspFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigRspToJson(this);

  @override
  AppConfig? getData() {
    return data;
  }

}

class QiniuTokenRsp extends BaseRsp<QiniuToken> {
  QiniuToken? data;

  QiniuTokenRsp();

  factory QiniuTokenRsp.fromJson(Map<String, dynamic> json) => _$QiniuTokenRspFromJson(json);

  Map<String, dynamic> toJson() => _$QiniuTokenRspToJson(this);

  @override
  QiniuToken? getData() {
    return data;
  }
}

class ListRegionData {
  List<Region>? regions;

  ListRegionData();

  factory ListRegionData.fromJson(Map<String, dynamic> json) => _$ListRegionDataFromJson(json);

  Map<String, dynamic> toJson() => _$ListRegionDataToJson(this);
}

class ListRegionRspMap extends BaseRsp<Map<String, List<Region>>> {
  Map<String, List<Region>>? data;

  ListRegionRspMap();

  factory ListRegionRspMap.fromJson(Map<String, dynamic> json) => _$ListRegionRspMapFromJson(json);

  Map<String, dynamic> toJson() => _$ListRegionRspMapToJson(this);

  @override
  Map<String, List<Region>>? getData() {
    return data;
  }
}

class GiftsResp extends BaseRsp<GiftsRespData> {
  GiftsRespData? data;

  GiftsResp();

  factory GiftsResp.fromJson(Map<String, dynamic> json) => _$GiftsRespFromJson(json);

  Map<String, dynamic> toJson() => _$GiftsRespToJson(this);

  @override
  GiftsRespData? getData() {
    return data;
  }
}
//class GiftsResp(var types: List<GiftType>, var gifts: List<Gift>)

class GiftsRespData {
  List<GiftType>? types;
  List<Gift>? gifts;

  GiftsRespData();

  factory GiftsRespData.fromJson(Map<String, dynamic> json) => _$GiftsRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$GiftsRespDataToJson(this);
}

//class GiftType(var id: String?, var name: String?, var gifts: List<Gift>? = null)

class GiftType {
  String? id;
  String? name;
  List<Gift>? gifts;

  GiftType();

  factory GiftType.fromJson(Map<String, dynamic> json) => _$GiftTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GiftTypeToJson(this);
}

class UserAccountRespMap extends BaseRsp<Map<String, UserAccount>> {
  Map<String, UserAccount>? data;

  UserAccountRespMap();

  factory UserAccountRespMap.fromJson(Map<String, dynamic> json) => _$UserAccountRespMapFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountRespMapToJson(this);

  @override
  Map<String, UserAccount>? getData() {
    return data;
  }
}

class LoginConfigRsp extends BaseRsp<LoginEntries> {
  LoginEntries? data;

  LoginConfigRsp();

  factory LoginConfigRsp.fromJson(Map<String, dynamic> json) => _$LoginConfigRspFromJson(json);

  Map<String, dynamic> toJson() => _$LoginConfigRspToJson(this);

  @override
  LoginEntries? getData() {
    return data;
  }
}

class LoginEntries {
  LoginConfigData? login_entries;

  LoginEntries();

  factory LoginEntries.fromJson(Map<String, dynamic> json) => _$LoginEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntriesToJson(this);
}

///class LoginConfigData(var login_google: Boolean = true,var login_facebook: Boolean = true,var login_user: Boolean = true,var login_quick: Boolean = false)

class LoginConfigData {
  bool? login_google;
  bool? login_facebook;
  bool? login_user;
  bool? login_quick;
  String? ai_help_domain;
  String? ai_help_app_key;
  String? agora_app_id;
  String? ai_help_app_id;

  LoginConfigData();

  factory LoginConfigData.fromJson(Map<String, dynamic> json) => _$LoginConfigDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginConfigDataToJson(this);

}