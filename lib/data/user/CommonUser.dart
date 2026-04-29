import 'dart:ffi';
import 'dart:math';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/user/CommonUserCountry.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import 'package:wenan/data/AppConfig.dart';
import '../../base/WenanCodeSpHelper.dart';
import '../../base/cache/WenanCodeAppCache.dart';
import '../../http/CommonApi.dart';
import '../../utils/WenanCodeAppCacheKeys.dart';
import '../AppMedia.dart';
import 'CommonUserExtend.dart';
import 'CommonUserProfile.dart';

/// This allows the `User` class to access members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'CommonUser.g.dart';

class CommonUser {
  CommonUser() {
    extend = CommonUserExtend();
  }

  factory CommonUser.fromJson(Map<String, dynamic> json) {
    final u = _$CommonUserFromJson(json);
    return u;
  }

  Map<String, dynamic> toJson() => _$CommonUserToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  int? uid; //用户平台 ID
  String? nick_name;

  int? gender; //性别 男为1，女为2，0为未知
  String? birthday;
  String? avatar_url;

  int? avatar_id;

  int? status; //用户状态 ： 0，未完善信息；1，默认状态；2，封禁状态
  String? ucode;
  String? mobile;
  String? cover_url; //	String	封面url
  String? signature; //	String	个性签名
  String? constellation;
  CommonUserExtend? extend;

  /// Added Properties

  @override
  int get hashCode => this.uid.hashCode;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is CommonUser && this.uid == other.uid;
  }

  String? get showName => Utils.isEmptyString(extend?.display_name) ? nick_name : extend?.display_name;

  bool get isMainUser => uid == Application.currUserId();

  bool get isFollowed {
    int? follow = extend?.profile?.follow;
    AuvChatLog.d("isFollowed:$follow");
    return follow != null && (follow == 1 || follow == 3);
  }

  set setFollowed(bool fo) {
    extend?.profile?.follow = fo ? 1 : 0;
  }

  bool get isFollower {
    int? follow = extend?.profile?.follow;
    return follow != null && (follow == 2 || follow == 3);
  }

  String? get regionCode => extend?.profile?.region_code;

  int? get follow => extend?.profile?.follow;

  set follow(int? follow) => extend?.profile?.follow = follow;

  bool get isMale => gender == 1;

  bool get isStar => extend?.profile?.mark_star == 1;

  set isStar(bool? isStar) => extend?.profile?.mark_star = isStar ?? false ? 1 : 0;

  bool get isBlocked => extend?.profile?.black == 1;

  bool get isGod => extend?.profile?.is_god == 1;

  set isGod(bool isGod) => extend?.profile?.is_god = isGod ? 1 : 0;

  set isBlocked(bool isBlocked) => extend?.profile?.black = isBlocked ? 1 : 0;

  bool get isBlockedMe => extend?.profile?.black_me == 1;

  set isBlockedMe(bool isBlockedMe) => extend?.profile?.black_me = isBlockedMe ? 1 : 0;

  bool get isOnline {
    return extend?.online_status?.online ?? false;
  }

  bool get isOnLive {
    return extend?.online_status?.onLive ?? false;
  }

  CommonUserOnlineStatus? get onlineStatus => extend?.online_status;

  int uCodeInt() {
    return Utils.parseInt(ucode) ?? 0;
  }

  String? getLocationDesc() {
    CommonUserProfile? profile = extend?.profile;
    String? locationDesc = "";
    if (profile == null) {
      return locationDesc;
    }
    if (StringUtils.isNotEmpty(profile.province)) {
      locationDesc = profile.province;
    }
    if (StringUtils.isNotEmpty(profile.area)) {
      locationDesc = locationDesc! + profile.area!;
    }
    return locationDesc;
  }

  CommonUserCountry? getCountry() => extend?.profile?.country_region;

  getAge() => extend?.profile?.age;

  int getBalance() => extend?.balance ?? 0;

  bool isVip() {
    if (extend?.profile?.is_vip == 1) {
      int vipTime = extend?.profile?.vip_expire_time ?? 0;
      int nowTime = DateTime.now().millisecondsSinceEpoch;
      return vipTime >= nowTime;
    }
    return false;
  }

  int vipExpireDay() {
    if (extend?.profile?.is_vip == 1) {
      int vipTime = extend?.profile?.vip_expire_time ?? 0;
      int nowTime = DateTime.now().millisecondsSinceEpoch;
      if (vipTime > nowTime) {
        return ((vipTime - nowTime) / 1000.0 / (24.0 * 60.0 * 60.0)).ceil();
      }
    }
    return 0;
  }

  bool get hasCharged => extend?.has_recharge == 1;

  int getVipExpireTime() => extend?.profile?.vip_expire_time ?? 0;

  bool isDisturb() => extend?.profile?.no_disturb == 1;

  setDisturb(int disturb) => extend?.profile?.no_disturb = disturb;

  int getFollowedCount() => extend?.profile?.followed_count ?? 0;

  setFollowedCount(int add) {
    var profile = extend?.profile;
    if (profile != null) {
      profile.followed_count = (profile.followed_count ?? 0) + add;
    }
  }

  List<AppMedia> getUserMedias() {
    var medias = extend?.profile?.pic_videos;
    medias ??= [];
    return medias;
  }

  setUserMedias(List<AppMedia> medias) {
    extend?.profile?.pic_videos = medias;
  }

  List<Gift> getUserGifts() {
    var gifts = extend?.profile?.gifts;
    gifts ??= [];
    return gifts;
  }

  @override
  String toString() {
    return 'CommonUser{uid: $uid, nick_name: $nick_name, gender: $gender, birthday: $birthday, avatar_url: $avatar_url, avatar_id: $avatar_id, status: $status, ucode: $ucode, mobile: $mobile, cover_url: $cover_url, signature: $signature, constellation: $constellation, extend: $extend}';
  }

  int chatPrice() {
    if (extend != null && extend!.profile != null && extend!.profile!.chat_price > 0) {
      return extend!.profile!.chat_price;
    }
    return 60;
  }
}
