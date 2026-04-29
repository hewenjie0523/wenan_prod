import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';


part 'ChatDraft.g.dart';


class ChatDraft {
  ChatDraft();

  
  int? id;
  String? content;
  
  int? createTime;

  factory ChatDraft.fromJson(Map<String, dynamic> json) => _$ChatDraftFromJson(json);

  Map<String, dynamic> toJson() => _$ChatDraftToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
