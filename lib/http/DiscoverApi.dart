import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/AppMedia.dart';
import 'package:wenan/data/FeedItem.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../data/MatchVideoFindItem.dart';

part 'DiscoverApi.g.dart';

abstract class DiscoverApi{
  factory DiscoverApi(Dio dio, {String baseUrl}) = _DiscoverApi;

  
  Future<DiscoverPageRsp> discovers( int page,  int pageSize);

  
  Future<DiscoverPageRsp> discoversByRegion( int page,  int pageSize, String regions);

  
  Future<DiscoverPageRsp> followingUsers( int page,  int pageSize);

  Future<MatchDiscoverPageRsp> matchVideoFindListByRegion( int page,  int pageSize, String regions);

}

///分页数据结构demo

class DiscoverListData extends BasePageData<CommonUser>{
  DiscoverListData();
  List<CommonUser>? records;
  @override
  List<CommonUser>? getDataList() {
    return records;
  }
  factory DiscoverListData.fromJson(Map<String, dynamic> json) => _$DiscoverListDataFromJson(json);
  Map<String, dynamic> toJson() => _$DiscoverListDataToJson(this);
}


class DiscoverPageRsp extends BaseRsp<DiscoverListData> {

  DiscoverListData? data;

  DiscoverPageRsp();

  factory DiscoverPageRsp.fromJson(Map<String, dynamic> json) => _$DiscoverPageRspFromJson(json);
  Map<String, dynamic> toJson() => _$DiscoverPageRspToJson(this);

  @override
  DiscoverListData? getData() {
    return data;
  }
}


///分页数据结构demo

class MatchDiscoverListData extends BasePageData<MatchVideoFindItem>{
  MatchDiscoverListData();
  List<MatchVideoFindItem>? records;
  @override
  List<MatchVideoFindItem>? getDataList() {
    return records;
  }

  factory MatchDiscoverListData.fromJson(Map<String, dynamic> json) => _$MatchDiscoverListDataFromJson(json);
  Map<String, dynamic> toJson() => _$MatchDiscoverListDataToJson(this);

}


class MatchDiscoverPageRsp extends BaseRsp<MatchDiscoverListData> {
  MatchDiscoverListData? data;

  MatchDiscoverPageRsp();

  factory MatchDiscoverPageRsp.fromJson(Map<String, dynamic> json) => _$MatchDiscoverPageRspFromJson(json);
  Map<String, dynamic> toJson() => _$MatchDiscoverPageRspToJson(this);

  @override
  MatchDiscoverListData? getData() {
    return data;
  }
}


