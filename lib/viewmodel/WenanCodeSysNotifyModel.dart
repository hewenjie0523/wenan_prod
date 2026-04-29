
import 'dart:convert';

import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/FeedItem.dart';
import 'package:wenan/data/chat/NotifyItem.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/FeedApi.dart';
import 'package:wenan/http/SysNotifyApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodeutils.dart';



class SysNotifyListNotifier extends BasePageStateNotifier<BaseApiPageState<NotifyItem>>{

  static const int pageSize = 20;

  SysNotifyListNotifier(BaseApiPageState<NotifyItem> state) : super(state){
    loadOld();
  }
  final SysNotifyApi _notifyApi = SysNotifyApi(DioHelper.getInstance());

  //在当前界面有新消息时，需要加载更新的数据
  bool loadNew(){
    if(Utils.isEmpty(state.dataList)){
      return loadOld();
    } else {
      int maxId = state.dataList!.last.id??0;
      mapRspToNotifier(_notifyApi.newsSysNotifyList(maxId),dataFilter: (list)=>list?.reversed.toList(),dataAppendStrategy: DataAppendStrategy.TAIL);
      return true;
    }
  }

  //加载旧数据
  bool loadOld(){
    int minId = Utils.isEmpty(state.dataList)?0:state.dataList!.first.id??0;
    if(minId==0||state.hasMore){
      mapRspToNotifier(_notifyApi.oldsSysNotifyList(minId, pageSize),dataFilter: (list)=>list?.reversed.toList(),dataAppendStrategy: DataAppendStrategy.HEAD);
      return true;
    }

    return false;

  }

}