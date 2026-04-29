

import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';
part 'BaseRsp.g.dart';
abstract class BaseRsp<T>{
  
  int? code;
  String? msg;
  T? getData();

  BaseRsp({int? code,String? msg}){
    this.code = code;
    this.msg = msg;
  }


  int getCodeInt(){
    return Utils.parseInt(code)??-1;
  }

  @override
  String toString() {
    return "BaseRsp:code=$code,msg=$msg,data=${getData()}";
  }
  static int? dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? stringFromInt(int? number) => number?.toString();
}


class RawDataRsp extends BaseRsp{
  RawDataRsp();
  
  factory RawDataRsp.fromJson(Map<String, dynamic> json) => _$RawDataRspFromJson(json);
  Map<String, dynamic> toJson() => _$RawDataRspToJson(this);
  
  dynamic data;
  @override
  getData() {
    return data;
  }

}

abstract class BasePageData<T>{
  
  int? page = 1;  //当前页码
  
  bool? has_more = false; //是否还有数据
  
  int? total;
  List<T>? getDataList();

  static int? dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? stringFromInt(int? number) => number?.toString();
  static bool? dynamicToBool(dynamic number) => Utils.parseBool(number);

  @override
  String toString() {
    return "BasePageData:page=$page,has_more=$has_more,lise.size=${getDataList()?.length}";
  }
}

///分页数据结构demo
class UserPageData extends BasePageData<CommonUser>{
  List<CommonUser>? records;
  @override
  List<CommonUser>? getDataList() {
    return records;
  }

}

class UserPageRsp extends BaseRsp<UserPageData>{
  UserPageData? data;
  @override
  UserPageData? getData() {
    return data;
  }

}