import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'BannerInfo.g.dart';
/*
data class BannerDetailData(var image_url: String?, var type: Int = 0, var scheme_url: String?) : Parcelable {

    companion object {
        const val WEB_TYPE = 0
        const val NATIVE_TYPE = 1
    }
}
 */

class BannerInfo {
  BannerInfo();

  
  int? type;
  String? image_url;
  String? scheme_url;
  bool get isWeb => type==0;
  bool get isNative => type==1;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory BannerInfo.fromJson(Map<String, dynamic> json) => _$BannerInfoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BannerInfoToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
