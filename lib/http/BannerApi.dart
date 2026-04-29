import 'package:wenan/StringTranslate.dart';
import 'dart:convert';

import 'package:wenan/data/BannerInfo.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'BannerApi.g.dart';

abstract class BannerApi{
  factory BannerApi(Dio dio, {String baseUrl}) = _BannerApi;

  
  Future<ConfigBannerRsp> bannerList( String name);

}



class ConfigBannerRsp extends BaseRsp<List<BannerInfo>> {

  Map<String, dynamic>? data;
  ConfigBannerRsp();

  factory ConfigBannerRsp.fromJson(Map<String, dynamic> json) => _$ConfigBannerRspFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigBannerRspToJson(this);

  @override
  List<BannerInfo>? getData() {
    AuvChatLog.d("ConfigBannerRsp,value=$data");
    if(Utils.isEmpty(data?["value"])){
      return null;
    } else {
      return (jsonDecode(data!["value"]) as List<dynamic>?)
        ?.map((e) => BannerInfo.fromJson(e as Map<String, dynamic>))
    .toList();
    }

  }
}