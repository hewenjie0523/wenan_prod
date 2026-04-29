import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'QiniuToken.g.dart';
///private String image_token;
//     private String video_token;
//     private long expire_time;
//     private String voice_token;

class QiniuToken {
  String? video_token;
  String? voice_token;
  String? image_token;
  
  int? expire_time;

  QiniuToken();

  factory QiniuToken.fromJson(Map<String, dynamic> json) => _$QiniuTokenFromJson(json);

  Map<String, dynamic> toJson() => _$QiniuTokenToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();
}

