import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:wenan/base/WenanCodeApiResult.dart';
import 'package:wenan/base/WenanCodeCallBackInterceptor.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/WenanCodeCommonRspObserver.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HttpReqHelper{
  static void mapRsp<T extends BaseRsp>(Future<T> rsp,CommonRspObserver<T> commonRspObserver,{CallBackInterceptor? callBackInterceptor}){
    rsp.then((value) {
      if(callBackInterceptor==null||!callBackInterceptor()){
        commonRspObserver.onSuccess(value);
      }
    }).catchError((obj,stackTrace){
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode??-1;
          msg = res?.statusMessage??"";
          break;
        default:
          break;
      }
      AuvChatLog.e("http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      if(callBackInterceptor==null||!callBackInterceptor()){
        commonRspObserver.onFailure(errorCode, msg);
      }
    });
  }
  


  //适合StreamBuilder
  static Stream<ApiResult<T>> mapApiResult<T extends BaseRsp>(Future<T> rsp) async*{
    yield ApiResultLoading<T>();
    try {
      var result = await rsp;
      if(result.getCodeInt()==0){
        yield ApiResultSuccess(result, result.msg);
      } else {
        yield ApiResultError(result.getCodeInt(), result.msg);
      }

    } catch (obj,stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode??-1;
          msg = res?.statusMessage??"";
          break;
        default:
          break;
      }
      AuvChatLog.e("http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      yield ApiResultError(errorCode, msg);
    }
  }

}