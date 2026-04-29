

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/StringTranslate.dart';

import '../base/WenanCodeApplication.dart';
import '../utils/WenanCodelog.dart';
import '../utils/WenanCodeutils.dart';

class DioHelper{
  static Dio? _instance;

  static Dio getInstance(){
    if(_instance==null){
      _instance = Dio(BaseOptions(
        baseUrl: AppConfig.apiUrl,
        connectTimeout: 15000,
        receiveTimeout: 100000,
        // 5s
        contentType: Headers.jsonContentType,
        // Transform the response data to a String encoded with UTF8.
        // The default value is [ResponseType.JSON].
        responseType: ResponseType.json,
      ));
      AppConfig.getUserAgentForce().then((value) => _instance?.options.headers["user-agent"]=value).catchError((e){});
      _instance?.interceptors.add( InterceptorsWrapper(onRequest: ((options, handler) async {
        if (options.method.toLowerCase() == "post") {
          //添加通用参数的逻辑
//            Map<String,String> params = options.data;
          AuvChatLog.d("interceptors:data:${options.data},options.baseUrl=${options.baseUrl},option_path=${options.path}");

          try {
            var params = <String, dynamic>{};
            if(options.data!=null){
              params.addAll(options.data);
            }
            params[StringTranslate.e2z("reenqn_epnaatnhe_n_n")] = options.path;
            if (!options.data.containsKey("sig")) {
              commonParams(params);
            }
            String json = jsonEncode(params);
            json = await Application.callPlatformMethod("${Application.channelName}.eString",<String, dynamic>{
              '${Application.channelName}.string': json
            });
            AuvChatLog.d("encryptStr=$json");
            params.clear();
            params[StringTranslate.e2z("daantnan_w_e")] = json;
            options.data = params;
            options.path = options.baseUrl;
            AuvChatLog.d("interceptors:params:${options.data}");
          } catch (e,stack) {
            AuvChatLog.e(e.toString(),error: stack);
          }
        }
        // 在请求被发送之前做一些事情
       handler.next(options);
      }),onResponse:((response, handler) async {
        try {
          if(!AppConfig.inProduction){
              String deReqData  = await Application.callPlatformMethod("${Application.channelName}.dString",<String, dynamic>{
                '${Application.channelName}.string': response.requestOptions.data[StringTranslate.e2z("dnantnan_w_n")]
              });
              AuvChatLog.d("onResponse:.req_path__=${jsonDecode(deReqData)['req_path__']}");
          }
        } catch (e) {
          AuvChatLog.printE(e);
        }
        AuvChatLog.d("onResponse:isstring:${response.data is String},uri:${response.realUri},${response.data}");
        try {
          int? respCode;
          if(response.data is Map){
            respCode = Utils.parseInt(response.data["code"]);
          } else if(response.data is String){
            bool isEncrypt = true;
            try {
              Map<String, dynamic> json = jsonDecode(response.data);
              if(json["code"]!=null){
                respCode = Utils.parseInt(json["code"]);
                isEncrypt = false;
                response.data = json;
              }
            } catch (e) {
              // AuvChatLog.printE(e);
            }
            if(isEncrypt){
              String decryptStr = await Application.callPlatformMethod("${Application.channelName}.dString",<String, dynamic>{
                '${Application.channelName}.string': response.data
              });
              AuvChatLog.d("decryptStr=$decryptStr");
              response.data = jsonDecode(decryptStr);
              respCode = Utils.parseInt(response.data["code"]);
            }
          }
          if(respCode==20){
            //session过期需要重新登录
            Application.quit();
            Application.eventBus.fire(OverdueSession(""));
          }
        } catch (e,stack) {
          AuvChatLog.printE(e,error: stack);
        }
        handler.next(response);
      } )));
      _instance?.interceptors.add(LogInterceptor(responseBody: true,logPrint:(object){
        AuvChatLog.d(object.toString());
      }));
    }
    
    return _instance!;
  }


  static void commonParams(Map<String, dynamic> old) {
    old["ts"] = DateTime.now().millisecondsSinceEpoch.toString();
    if (!Utils.isEmpty(Application.session)) {
      old["session"] = Application.session;
    }
    old["client"] = "flutter";
    List<String> keys = <String>[];
    keys.addAll(old.keys);
    keys.sort((a, b) => b.compareTo(a));
    String sig = buildSig(keys, old);
    old["sig"] = sig;
  }

  static String buildSig(List<String> keys, Map<String, dynamic> old) {
    var buffer = StringBuffer();
    for (final elem in keys) {
      buffer.write(Utils.parseString(old[elem]));
      buffer.write(":");
    }
    buffer.write(Application.secretKey);
    AuvChatLog.d("buildSig: \n\t${buffer.toString()} \n\t$old \n\t${Application.secretKey}");
    return Utils.generateMd5(buffer.toString());
  }

  static Future download(String urlPath, String savePath) async {
    var response = await getInstance().download(urlPath, savePath);
    return response;
  }
}