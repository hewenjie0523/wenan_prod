import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'UserApi.g.dart';

abstract class UserApi{
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  
  Future<UserInfoRsp> fillUserInfo( String nickName,  int gender,  String birthday,  int headImageId);

  
  Future<UserInfoRsp> updateUserInfo();

  
  Future<UserInfoRsp> userInfo( int uid);

  
  Future<RawDataRsp> follow( int uid);

  
  Future<RawDataRsp> unFollow( int uid);

  
  Future<RawDataRsp> block( int uid);

  
  Future<RawDataRsp> unBlock( int uid);

  
  Future<RawDataRsp> editUserInfo( int avatarId, String nickname);

  
  Future<RawDataRsp> editUserNickName( String nickname);

  
  Future<RawDataRsp> editUserBirthday( String birthday);

  
  Future<RawDataRsp> editUserSignature( String signature);

  
  Future<RawDataRsp> editUserHead( int avatarId);


}


class UserInfoRsp extends BaseRsp<CommonUser> {

  CommonLoginData? data;
  UserInfoRsp();

  factory UserInfoRsp.fromJson(Map<String, dynamic> json) => _$UserInfoRspFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoRspToJson(this);

  @override
  CommonUser? getData() {
    return data?.user;
  }
}