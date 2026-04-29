


import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AdjustAdInfo.g.dart';
/*
///data class AdjustUploadData(var tt: String = "", var tn: String = "", var net: String = "", var cam: String = "", var adg: String = "",
///   var cre: String = "", var cl: String = "", var adid: String = "", var ct: String = "", var ca: String = "",var cc: String = "") : Parcelable
 */

class AdjustAdInfo {
  AdjustAdInfo([this.tt, this.tn, this.net, this.cam, this.adg, this.cre, this.cl, this.adid, this.ct, this.ca, this.cc]);

  String? tt;
  String? tn;
  String? net;
  String? cam;
  String? adg;
  String? cre;
  String? cl;
  String? adid;
  String? ct;
  String? ca;
  String? cc;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AdjustAdInfo.fromJson(Map<String, dynamic> json) => _$AdjustAdInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AdjustAdInfoToJson(this);

}
