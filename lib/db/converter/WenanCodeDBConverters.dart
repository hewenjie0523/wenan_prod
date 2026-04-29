import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';

class AppImageConverter extends TypeConverter<AppImage, String> {
  const AppImageConverter();

  @override
  AppImage fromSql(String fromDb) {
    return AppImage.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(AppImage value) {
    return json.encode(value.toJson());
  }
}

class AppImageListConverter extends TypeConverter<List<AppImage>, String> {
  const AppImageListConverter();

  @override
  List<AppImage> fromSql(String fromDb) {
    return (json.decode(fromDb) as List<Map<String, dynamic>>).map((e) => AppImage.fromJson(e)).toList();
  }

  @override
  String toSql(List<AppImage> value) {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

class AppVideoConverter extends TypeConverter<AppVideo, String> {
  const AppVideoConverter();

  @override
  AppVideo fromSql(String fromDb) {
    return AppVideo.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(AppVideo value) {
    return json.encode(value.toJson());
  }
}

class AppVoiceConverter extends TypeConverter<AppVoice, String> {
  const AppVoiceConverter();

  @override
  AppVoice fromSql(String fromDb) {
    return AppVoice.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(AppVoice value) {
    return json.encode(value.toJson());
  }
}