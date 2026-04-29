import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';


part 'Region.g.dart';


class Region {
  Region();

  String? region_code;
  String? name;
  
  int? vip_only;

  bool get isVipOnly => vip_only==1;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Region.fromJson(Map<String, dynamic>  json) =>
      _$RegionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? 0;

  static bool? _dynamicToBool(dynamic obj) => Utils.parseBool(obj);

  @override
  toString() => toJson().toString();
}
