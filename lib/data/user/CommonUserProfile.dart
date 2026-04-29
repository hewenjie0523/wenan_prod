import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/user/CommonUserCountry.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import '../AppMedia.dart';

part 'CommonUserProfile.g.dart';


class CommonUserProfile {
  CommonUserProfile() {
    country_region = CommonUserCountry();
  }

  
  int? uid;
  
  int? age;
  
  int? gender;
  
  int? follow; // 0：互不关注；1：我关注他；2：他关注我；3：互相关注；
  
  int? follow_count;
  
  int? followed_count;
  
  int? black;
  
  int? black_me;
  
  int? feed_status;
  String? location;
  String? brithday;
  String? age_section;
  String? area;
  String? province;
  
  int? is_god; // 是否大神，1:是；0:否
  
  int? user_guest_total; // 总访客人数
  
  int? user_guest_new; // 新访客人数
  
  int? mark_star; // 标星，1:是；0:否
  
  int? avatar_audit_status; // 头像认证状态，0：未申请；1:申请中；2:通过：3:不通过
  
  int? recommend_first; // 优先推荐，1:是；0:否
  
  int? change_avatar; // 是否可以换头像，1:是；0:否
  
  int? is_vip; // 是否vip，1:是
  
  int? vip_expire_time;
  
  int? no_disturb; //" 1 是免打扰 0 是不免打扰
  String? region_code; //"IN"

  ///价格
  int chat_price = 60;

  
  factory CommonUserProfile.fromJson(Map<String, dynamic> json) =>
      _$CommonUserProfileFromJson(json);

  CommonUserCountry? country_region;
  List<AppMedia>? pic_videos;
  List<Gift>? gifts;

  String get getLocationInfo {
    StringBuffer buffer = StringBuffer("");
    if (StringUtils.isNotEmpty(province)) {
      buffer.write(province);
    }
    if (StringUtils.isNotEmpty(area)) {
      buffer.write(" ");
      buffer.write(area);
    }
    return buffer.toString();
  }

  String get getLocationArea {
    if (StringUtils.isNotEmpty(area)) {
      return area!;
    }
    if (StringUtils.isNotEmpty(province)) {
      return province!;
    }
    return "";
  }

  Map<String, dynamic> toJson() => _$CommonUserProfileToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);

  @override
  String toString() {
    return 'CommonUserProfile{uid: $uid, follow: $follow, follow_count: $follow_count, followed_count: $followed_count, black: $black, brithday: $brithday, area: $area, is_vip: $is_vip, vip_expire_time: $vip_expire_time, no_disturb: $no_disturb, region_code: $region_code}';
  }
}
