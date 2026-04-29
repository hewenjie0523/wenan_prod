import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'LoginApi.g.dart';

abstract class LoginApi{
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  
  Future<LoginDeviceRsp> loginDevice( String clientInfo);

  
  Future<RawDataRsp> logout();

  
  Future<RawDataRsp> deleteAccount();

  
  Future<LoginDeviceRsp> loginPlatform( int appType,  int accountType,  String accessToken,  String clientInfo);

  
  Future<LoginDeviceRsp> loginApple( int appType,  int accountType,  String identity_token,  String clientInfo);

  
  Future<LoginDeviceRsp> loginWithId( String mobile, String password, String client_info);



}


class LoginDeviceRsp extends BaseRsp<CommonLoginData> {
  CommonLoginData? data;

  LoginDeviceRsp();

  factory LoginDeviceRsp.fromJson(Map<String, dynamic> json) => _$LoginDeviceRspFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDeviceRspToJson(this);

  @override
  CommonLoginData? getData() {
    return data;
  }
}