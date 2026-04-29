import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import 'CommonUserOnlineStatus.dart';
import 'CommonUserProfile.dart';


part 'CommonUserExtend.g.dart';


class CommonUserExtend {
  CommonUserExtend() {
    profile = CommonUserProfile();
    online_status = CommonUserOnlineStatus();
  }

  
  bool? has_pwd;
  CommonUserOnlineStatus? online_status;
  CommonUserProfile? profile;
  String? display_name;
  
  int? balance;
  
  int? has_recharge;//0：未充值；1：已充值；


  factory CommonUserExtend.fromJson(Map<String, dynamic> json) {
    final u = _$CommonUserExtendFromJson(json);
    return u;
  }

  Map<String, dynamic> toJson() => _$CommonUserExtendToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);

  @override
  String toString() {
    return 'CommonUserExtend{online_status: $online_status, profile: $profile}';
  }
}
