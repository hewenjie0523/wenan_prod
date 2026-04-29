
import 'dart:convert';

import 'package:wenan/data/AppConfig.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/ClientInfo.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart' as AppConfiguration;

final configNotifier = StateNotifierProvider.autoDispose<ConfigNotifier,BaseApiState<AppConfig>>(
        (ref) => ConfigNotifier(BaseApiState<AppConfig>()));

final loginConfigNotifier = StateNotifierProvider.autoDispose<LoginConfigNotifier,BaseApiState<LoginEntries>>(
        (ref) => LoginConfigNotifier(BaseApiState<LoginEntries>()));

class ConfigModelProvider{
  final CommonApi _commonApi = CommonApi(DioHelper.getInstance());

  Future<AppConfigRsp> getConfigFromCloud(){
    return _commonApi.getConfig(json.encode(ClientInfo().toJson()));
  }

  Future<String> getTestStr() async{
    return Future.delayed(Duration(seconds: 2),()=>"Fuck riverpod");
  }

}

class LoginConfigNotifier extends BaseStateNotifier<BaseApiState<LoginEntries>>{

  LoginConfigNotifier(BaseApiState<LoginEntries> state) : super(state){
    loadConfigFromCloud();
  }
  final CommonApi _commonApi = CommonApi(DioHelper.getInstance());

  void loadConfigFromCloud() async{
    mapRspToNotifier(_commonApi.ticket(AppConfiguration.AppConfig.packageName,AppConfiguration.AppConfig.appVersion)).then((value) {
      if(state.status==ReqStatus.success){
        if(state.data?.login_entries!=null){
          SpHelper.setAgoraAppId(state.data?.login_entries?.agora_app_id??"");
          SpHelper.setAIHelpAppId(state.data?.login_entries?.ai_help_app_id??"");
          SpHelper.setAIHelpAppKey(state.data?.login_entries?.ai_help_app_key??"");
          SpHelper.setAIHelpDomain(state.data?.login_entries?.ai_help_domain??"");
        }
      }
    });
  }

}

class ConfigNotifier extends BaseStateNotifier<BaseApiState<AppConfig>>{

  ConfigNotifier(BaseApiState<AppConfig> state) : super(state){
    loadConfigFromCloud();
  }
  final CommonApi _commonApi = CommonApi(DioHelper.getInstance());

  void loadConfigFromCloud(){
    mapRspToNotifier(_commonApi.getConfig(json.encode(ClientInfo().toJson())));
  }

}
