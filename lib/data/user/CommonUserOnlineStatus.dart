import 'package:wenan/proto/we_ps_bu_object.pb.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'CommonUserOnlineStatus.g.dart';



class CommonUserOnlineStatus {
  CommonUserOnlineStatus();

  
  int? uid;
  
  int? onlineTime;
  
  bool? online;
  
  bool? onLive;
  
  int? roomId;
  
  bool? isPrivateLive;
  
  int? roomType; //1 语音  0 视频
  
  String? roomTopicName;
  
  bool? onCall;


  ///  public boolean isBusy() {
  //         return on_call;
  //     }
  
  bool get isBusy => onCall == true;

  ///public boolean isOnline() {
  //         return online;
  //     }

  
  bool get isOnline => online == true;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory CommonUserOnlineStatus.fromJson(Map<String, dynamic> json) =>
      _$CommonUserOnlineStatusFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CommonUserOnlineStatusToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? 0;

  static bool? _dynamicToBool(dynamic obj) => Utils.parseBool(obj);

  @override
  String toString() {
    return 'CommonUserOnlineStatus{uid: $uid, online: $online, onLive: $onLive}';
  }

  static CommonUserOnlineStatus fromProto(UserOnlineTime userOnlineTime) {
    return CommonUserOnlineStatus()
      ..uid = userOnlineTime.uid.toInt()
      ..onCall = userOnlineTime.isOnCall
      ..online = userOnlineTime.isOnline
      ..onLive = userOnlineTime.isOnLive
      ..onlineTime = userOnlineTime.onlineTime.toInt()
      ..roomId = userOnlineTime.roomId.toInt();
  }
}
