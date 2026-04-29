import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/FeedItem.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'FeedApi.g.dart';

abstract class FeedApi{
  factory FeedApi(Dio dio, {String baseUrl}) = _FeedApi;

  
  Future<FeedListRsp> feedList( int page,  int page_size);

}


///分页数据结构demo

class FeedPageData extends BasePageData<FeedItem>{
  FeedPageData();
  List<FeedItem>? records;
  @override
  List<FeedItem>? getDataList() {
    return records;
  }

  factory FeedPageData.fromJson(Map<String, dynamic> json) => _$FeedPageDataFromJson(json);
  Map<String, dynamic> toJson() => _$FeedPageDataToJson(this);

}


class FeedListRsp extends BaseRsp<FeedPageData> {
  FeedPageData? data;

  FeedListRsp();

  factory FeedListRsp.fromJson(Map<String, dynamic> json) => _$FeedListRspFromJson(json);
  Map<String, dynamic> toJson() => _$FeedListRspToJson(this);

  @override
  FeedPageData? getData() {
    return data;
  }
}