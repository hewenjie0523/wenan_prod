import 'package:wenan/proto/we_ps_common.pb.dart';
import 'package:wenan/proto/we_ps_message.pb.dart';
import 'package:protobuf/protobuf.dart';

import 'WenanCodesocket_util.dart';

class SocketRsp {
  /// Codes
  static const int ERROR_CODE_SUCCESS = 0;
  static const int ERROR_CODE_NO_CONNECTION = -1;
  static const int ERROR_CODE_TIMEOUT = -2;
  static const int ERROR_CODE_NOT_AUTH = -3;
  static const int ERROR_CODE_UNKNOWN_ERROR = -4;

  /// const instances
  static final noConnection =
      SocketRsp(code: ERROR_CODE_NO_CONNECTION, msg: '');
  static final timeout = SocketRsp(code: ERROR_CODE_TIMEOUT, msg: '');
  static final notAuth = SocketRsp(code: ERROR_CODE_NOT_AUTH, msg: '');
  static final unknownError = SocketRsp(code: ERROR_CODE_UNKNOWN_ERROR, msg: '');

  SocketRsp({this.message, this.code = ERROR_CODE_SUCCESS, this.msg = ''});

  final int code;
  final String msg;
  final Message? message;

  bool get isSuccess => code == ERROR_CODE_SUCCESS;

  T? getRsp<T extends GeneratedMessage>(T clazz) {
    return message == null
        ? null
        : SocketUtil.unpackMessage(clazz, message!.messageObject);
  }

  CommonRsp? getCommonRsp() {
    return message == null
        ? null
        : SocketUtil.unpackMessage(CommonRsp(), message!.messageObject);
  }
}

class SocketRspError implements Exception{

  static unknownError(){
    return SocketRspError(SocketRsp.ERROR_CODE_UNKNOWN_ERROR);
  }

  SocketRspError(this.errorCode,{this.errorMsg});
  int errorCode;
  String? errorMsg;

  @override
  String toString() {
    return "$errorMsg";
  }
}
