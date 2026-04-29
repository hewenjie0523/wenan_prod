import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'UserAccount.g.dart';
//UserAccount(var id: Long, var type: Int, var amount: Float = 0F)

class UserAccount {
  UserAccount();

  
  int? id;
  
  int? type;
  
  double? amount;
 

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UserAccount.fromJson(Map<String, dynamic> json) => _$UserAccountFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserAccountToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);
}
