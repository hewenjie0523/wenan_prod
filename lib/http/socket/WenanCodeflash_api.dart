import 'dart:convert';
import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/proto/we_ps_bu_common.pb.dart';
import 'package:wenan/http/socket/WenanCodesocket_api.dart';
import 'package:wenan/proto/we_ps_bu_message.pbenum.dart' as Club9Message;
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';

class FlashApi {
  static const int MessageCateFlash = 3;
  static const String ParameterNameCode = 'code';
  static const String ParameterNameMsg = 'msg';
  static const String ParameterNameMsgObject = 'msgObject';
  static const int NotifyTypeConnectStateChange = -100;

  ///Club9Common.GetUserOnlineTimeReq onlineTimeReq = Club9Common.GetUserOnlineTimeReq.newBuilder()
  //                 .addAllUids(ids)
  //                 .build();
  static Stream<List<CommonUserOnlineStatus>> getUserOnlineTimeReq(List<int> uIds){
    final req = GetUserOnlineTimeReq.create();
    for (var element in uIds) {
      req.uids.add(Int64(element));
    }


    return SocketApi.sendCommonMsgWithRspInstance(
      GetUserOnlineTimeRsp.create(),
      MessageCateFlash,
      Club9Message.Message_Type.GETUSERONLINETIMEREQ.value,
      req,
    ).map((realRsp){
      if (realRsp != null) {
        if(realRsp.code == 0){
          return realRsp.onlineTimes.map((e) => CommonUserOnlineStatus.fromProto(e)).toList();
        } else {
          throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }
}
