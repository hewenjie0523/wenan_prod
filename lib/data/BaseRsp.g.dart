// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseRsp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawDataRsp _$RawDataRspFromJson(Map<String, dynamic> json) => RawDataRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondwen")])
  ..msg = json[StringTranslate.e2z("mwsegn")] as String?
  ..data = json[StringTranslate.e2z("deawtwan")];

Map<String, dynamic> _$RawDataRspToJson(RawDataRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cwowdwew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsngw"): instance.msg,
      StringTranslate.e2z("dwantaaa"): instance.data,
    };
