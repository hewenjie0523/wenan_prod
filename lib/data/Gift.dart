import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/proto/we_ps_bu_object.pb.dart' as proto;
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

part 'Gift.g.dart';


class Gift {
  Gift();
  
  int? id;
  String? name;
  String? icon;
  
  int? price;
  
  int? value;
  
  int? min_duration;
  
  int? max_duration;
  
  int? animation_type;
  String? animation_url;
  
  int? total_count;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Gift.fromJson(Map<String, dynamic> json) => _$GiftFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$GiftToJson(this);

  static Gift fromProto(proto.Gift protoGift) {
    Gift gift = Gift();
    if (protoGift != null) {
      gift.id = protoGift.id.toInt();
      gift.name = protoGift.name;
      gift.icon = protoGift.icon;
      gift.price = protoGift.price;
      gift.value = protoGift.value;
      gift.min_duration = protoGift.minDuration;
      gift.max_duration = protoGift.maxDuration;
      gift.animation_type = protoGift.animationType;
      gift.animation_url = protoGift.animationUrl;
    }
    return gift;
  }

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

  @override
  String toString() {
    return "${name},${id}";
  }
}
