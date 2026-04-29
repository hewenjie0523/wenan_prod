

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/data/BannerInfo.dart';
import 'package:wenan/http/ActivityApi.dart';
import 'package:wenan/http/BannerApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';


final  firstChangeNotifier = StateNotifierProvider<FirstChargeAcNotifier,BaseApiState<FirstChargeVo>>((ref)=>FirstChargeAcNotifier(BaseApiState<FirstChargeVo>()));

class FirstChargeAcNotifier extends BaseStateNotifier<BaseApiState<FirstChargeVo>>{

  FirstChargeAcNotifier(BaseApiState<FirstChargeVo> state) : super(state){
    refresh();
  }
  final ActivityApi _api = ActivityApi(DioHelper.getInstance());

  void refresh() async{
    if(state.status==ReqStatus.loading){
      return;
    }
    state = state.copyWith(status: ReqStatus.loading,rsp: state.data);
    try {
      ActivityListDataRsp rsp = await _api.acList();
      if(rsp.getCodeInt()==0){
        var list = rsp.data?.activities?.where((element) => element.isFirstCharge).toList();
        if(Utils.isEmptyList(list)){
          state = state.copyWith(status: ReqStatus.success,rsp: null,message: rsp.msg);
        } else {
          state = state.copyWith(status: ReqStatus.success,rsp: list![0].first_charge,message: rsp.msg);
        }
      } else {
        state = state.copyWith(status: ReqStatus.error,rsp: state.data,message: rsp.msg,errorCode: rsp.getCodeInt());
      }
    } catch (e) {
      AuvChatLog.printE(e);
    }
    state = state.copyWith(status: ReqStatus.idle,rsp: state.data);
  }

}