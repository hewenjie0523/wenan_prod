import 'package:wenan/StringTranslate.dart';
import 'dart:convert';

import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/BannerInfo.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ActivityApi.g.dart';

abstract class ActivityApi{
  factory ActivityApi(Dio dio, {String baseUrl}) = _ActivityApi;

  
  Future<ActivityListDataRsp> acList();

}



class ActivityListData {
  List<ActivityVo>? activities;

  ActivityListData();

  factory ActivityListData.fromJson(Map<String, dynamic> json) => _$ActivityListDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityListDataToJson(this);
}


class ActivityListDataRsp extends BaseRsp<ActivityListData> {
  ActivityListData? data;

  ActivityListDataRsp();

  factory ActivityListDataRsp.fromJson(Map<String, dynamic> json) => _$ActivityListDataRspFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityListDataRspToJson(this);

  @override
  ActivityListData? getData() {
    return data;
  }
}

///class OperationalActivityVo {
//     fun isLottery(): Boolean {
//         return type==TYPE_LOTTERY
//     }
//     fun isFirstCharge(): Boolean {
//         return type==TYPE_FIRST_CHARGE
//     }
//
//     companion object{
//         const val TYPE_LOTTERY = 1
//         const val TYPE_FIRST_CHARGE = 2
//     }
//     var first_charge: FirstChargeActivityVO? = null
//     var lottery:LotteryActivityVO? = null
//     var type:Int = TYPE_LOTTERY
//
// }


class ActivityVo {
  
  int type = 0;

  bool get isFirstCharge => type == 2&&first_charge!=null;

  FirstChargeVo? first_charge;

  ActivityVo();

  factory ActivityVo.fromJson(Map<String, dynamic> json) => _$ActivityVoFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityVoToJson(this);
}

///class FirstChargeActivityVO {
//     var id: Long = 0
//     var video_info: Video? = null
//     var text_img_info:ImageInfo? = null
//     var option:CoinChargeData? = null
// }

class FirstChargeVo {
  
  int id = 0;
  AppVideo? video_info;
  PaymentOption? option;
  AppImage? text_img_info;

  FirstChargeVo();

  factory FirstChargeVo.fromJson(Map<String, dynamic> json) => _$FirstChargeVoFromJson(json);

  Map<String, dynamic> toJson() => _$FirstChargeVoToJson(this);
}