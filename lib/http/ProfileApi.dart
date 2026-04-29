import 'package:wenan/StringTranslate.dart';
import 'dart:core';
import 'dart:core';

import 'package:wenan/data/AppMedia.dart';
import 'package:wenan/data/FeedItem.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ProfileApi.g.dart';

abstract class ProfileApi{
  factory ProfileApi(Dio dio, {String baseUrl}) = _ProfileApi;

  
  Future<UserListRsp> blackList( int page,  int pageSize);


  
  Future<RandomAvatarRsp> randomAvatars();

  
  Future<ProfileMediasRsp> userMedias();

  
  Future<RawDataRsp> resetMedias( String pvs, int isUser);//1：只主播；0：主播和用户；


  
  Future<UserProfileRsp> getProfileUser( int uid);

  
  Future<DisturbRsp> disturb( int disturb);

  
  Future<RawDataRsp> uploadAdjustInfo( String ad_info);

  
  Future<UseOnlineStatusRsp> getUserOnLineStatus( String uids);

}



class BlackListData extends BasePageData<CommonUser>{
  BlackListData();
  List<CommonUser>? records;
  @override
  List<CommonUser>? getDataList() {
    return records;
  }
  factory BlackListData.fromJson(Map<String, dynamic> json) => _$BlackListDataFromJson(json);
  Map<String, dynamic> toJson() => _$BlackListDataToJson(this);
}


class soggyAppBlackListPageRsp extends BaseRsp<BlackListData> {

  BlackListData? data;

  soggyAppBlackListPageRsp();

  factory soggyAppBlackListPageRsp.fromJson(Map<String, dynamic> json) => _$soggyAppBlackListPageRspFromJson(json);
  Map<String, dynamic> toJson() => _$soggyAppBlackListPageRspToJson(this);

  @override
  BlackListData? getData() {
    return data;
  }
}

///分页数据结构demo

class UserPageData extends BasePageData<CommonUser>{
  UserPageData();
  List<CommonUser>? records;
  @override
  List<CommonUser>? getDataList() {
    return records;
  }

  factory UserPageData.fromJson(Map<String, dynamic> json) => _$UserPageDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserPageDataToJson(this);

}


class UserListRsp extends BaseRsp<UserPageData> {
  UserPageData? data;

  UserListRsp();

  factory UserListRsp.fromJson(Map<String, dynamic> json) => _$UserListRspFromJson(json);
  Map<String, dynamic> toJson() => _$UserListRspToJson(this);

  @override
  UserPageData? getData() {
    return data;
  }
}


class RandomAvatar {
  RandomAvatar();

  String? avatar;
  String? name;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory RandomAvatar.fromJson(Map<String, dynamic>  json) =>
      _$RandomAvatarFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RandomAvatarToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? 0;

  static bool? _dynamicToBool(dynamic obj) => Utils.parseBool(obj);
}


class RandomAvatarData {
  List<RandomAvatar>? users;
  
  // int? left_match_video_count;
  // 
  // int? limit_match_txt_count;
  // 
  // int? left_match_txt_count;
  // 
  // int? limit_match_video_count;

  RandomAvatarData();

  factory RandomAvatarData.fromJson(Map<String, dynamic> json) => _$RandomAvatarDataFromJson(json);
  Map<String, dynamic> toJson() => _$RandomAvatarDataToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? 0;
}


class RandomAvatarRsp extends BaseRsp<RandomAvatarData> {
  RandomAvatarData? data;

  RandomAvatarRsp();

  factory RandomAvatarRsp.fromJson(Map<String, dynamic> json) => _$RandomAvatarRspFromJson(json);
  Map<String, dynamic> toJson() => _$RandomAvatarRspToJson(this);

  @override
  RandomAvatarData? getData() {
    return data;
  }
}




class UserMediaData {
  List<AppMedia>? pic_video_list;

  UserMediaData();

  factory UserMediaData.fromJson(Map<String, dynamic> json) => _$UserMediaDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserMediaDataToJson(this);

}


class ProfileMediasRsp extends BaseRsp<List<AppMedia>> {

  UserMediaData? data;

  ProfileMediasRsp();

  factory ProfileMediasRsp.fromJson(Map<String, dynamic> json) => _$ProfileMediasRspFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileMediasRspToJson(this);

  @override
  List<AppMedia>? getData() {
    return data?.pic_video_list;
  }
}





class UserProfileData {
  CommonUser? user;
  List<AppMedia>? pic_video_list;

  UserProfileData();

  factory UserProfileData.fromJson(Map<String, dynamic> json) => _$UserProfileDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);

}


class UserProfileDetailData {

  UserProfileData? discover_detail;

  UserProfileDetailData();

  factory UserProfileDetailData.fromJson(Map<String, dynamic> json) => _$UserProfileDetailDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDetailDataToJson(this);

}


class UserProfileRsp extends BaseRsp<UserProfileDetailData> {
  UserProfileDetailData? data;

  UserProfileRsp();

  factory UserProfileRsp.fromJson(Map<String, dynamic> json) => _$UserProfileRspFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileRspToJson(this);

  @override
  UserProfileDetailData? getData() {
    return data;
  }
}



class DisturbData {

  int? disturb;

  DisturbData();

  factory DisturbData.fromJson(Map<String, dynamic> json) => _$DisturbDataFromJson(json);
  Map<String, dynamic> toJson() => _$DisturbDataToJson(this);

}


class DisturbRsp extends BaseRsp<DisturbData> {
  DisturbData? data;

  DisturbRsp();

  factory DisturbRsp.fromJson(Map<String, dynamic> json) => _$DisturbRspFromJson(json);
  Map<String, dynamic> toJson() => _$DisturbRspToJson(this);

  @override
  DisturbData? getData() {
    return data;
  }
}


class UseOnlineStatusRsp extends BaseRsp<UserOnlineStatusData>{

  UserOnlineStatusData? data;

  UseOnlineStatusRsp();

  factory UseOnlineStatusRsp.fromJson(Map<String, dynamic> json) => _$UseOnlineStatusRspFromJson(json);
  Map<String, dynamic> toJson() => _$UseOnlineStatusRspToJson(this);

  @override
  UserOnlineStatusData? getData() {
    return data;
  }

}


class UserOnlineStatusData {

  List<CommonUserOnlineStatus>? online_status;

  UserOnlineStatusData();

  factory UserOnlineStatusData.fromJson(Map<String, dynamic> json) => _$UserOnlineStatusDataFromJson(json);
  Map<String, dynamic> toJson() => _$UserOnlineStatusDataToJson(this);

}