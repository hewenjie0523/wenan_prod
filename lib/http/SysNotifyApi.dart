import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/chat/NotifyItem.dart';
import 'package:wenan/data/chat/NotifyLatestItem.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'SysNotifyApi.g.dart';

abstract class SysNotifyApi{
  factory SysNotifyApi(Dio dio, {String baseUrl}) = _SysNotifyApi;

  
  Future<SysNotifyListRsp> sysNotifyList( int page,  int page_size);

  
  Future<SysNotifyListRsp> oldsSysNotifyList( int min_id,  int page_size);

  
  Future<SysNotifyListRsp> newsSysNotifyList( int max_id);

  
  Future<SysNotifyLatestInfoRsp> latestInfo();

}


class SysNotifyLatestInfoRsp extends BaseRsp<NotifyLatestItem> {
  NotifyLatestItem? data;

  SysNotifyLatestInfoRsp();

  factory SysNotifyLatestInfoRsp.fromJson(Map<String, dynamic> json) => _$SysNotifyLatestInfoRspFromJson(json);
  Map<String, dynamic> toJson() => _$SysNotifyLatestInfoRspToJson(this);

  @override
  NotifyLatestItem? getData() {
    return data;
  }
}


///分页数据结构demo

class SysNotifyPageData extends BasePageData<NotifyItem>{
  SysNotifyPageData();
  List<NotifyItem>? records;
  @override
  List<NotifyItem>? getDataList() {
    return records;
  }

  factory SysNotifyPageData.fromJson(Map<String, dynamic> json) => _$SysNotifyPageDataFromJson(json);
  Map<String, dynamic> toJson() => _$SysNotifyPageDataToJson(this);

}


class SysNotifyListRsp extends BaseRsp<SysNotifyPageData> {
  SysNotifyPageData? data;

  SysNotifyListRsp();

  factory SysNotifyListRsp.fromJson(Map<String, dynamic> json) => _$SysNotifyListRspFromJson(json);
  Map<String, dynamic> toJson() => _$SysNotifyListRspToJson(this);

  @override
  SysNotifyPageData? getData() {
    return data;
  }
}