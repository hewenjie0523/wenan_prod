import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/proto/we_ps_bu_object.pb.dart' as proto;
import 'package:wenan/StringTranslate.dart';

part 'UploadMediaData.g.dart';


class UploadMediaData {
  UploadMediaData();
  int? id;
  int? type;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UploadMediaData.fromJson(Map<String, dynamic> json) =>
      _$UploadMediaDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UploadMediaDataToJson(this);
}
