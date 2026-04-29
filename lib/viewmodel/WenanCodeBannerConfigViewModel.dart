

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/data/BannerInfo.dart';
import 'package:wenan/http/BannerApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';


final  bannerConfigNotifier = StateNotifierProvider<BannerConfigNotifier,BaseApiState<List<BannerInfo>>>((ref)=>BannerConfigNotifier(BaseApiState<List<BannerInfo>>()));

class BannerConfigNotifier extends BaseStateNotifier<BaseApiState<List<BannerInfo>>>{

  BannerConfigNotifier(BaseApiState<List<BannerInfo>> state) : super(state){
    refresh();
  }

  void refresh(){
    mapRspToNotifier(_configApi.bannerList("BANNER_LIST"));
  }

  final BannerApi _configApi = BannerApi(DioHelper.getInstance());


}