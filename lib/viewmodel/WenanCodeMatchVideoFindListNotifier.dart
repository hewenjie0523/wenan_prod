


import '../base/WenanCodeApplication.dart';
import '../data/MatchVideoFindItem.dart';
import '../http/DiscoverApi.dart';
import '../http/WenanCodedio_helper.dart';
import '../state/WenanCodeBaseApiState.dart';
import '../utils/WenanCodelog.dart';
import '../utils/WenanCodeutils.dart';

class MatchVideoFindListNotifier extends BasePageStateNotifier<BaseApiPageState<MatchVideoFindItem>>{

  final pageSize = 100;
  String regionCode;

  MatchVideoFindListNotifier(BaseApiPageState<MatchVideoFindItem> state, this.regionCode) : super(state){
    if(Utils.isEmptyString(regionCode)){
      regionCode = Application.commonUser?.regionCode ?? "";
    }
    refresh();
  }

  final DiscoverApi _discoverApi = DiscoverApi(DioHelper.getInstance());

  void loadMore(){
    AuvChatLog.d("matchVideoFindListByRegion loadMore,_regionCode=$regionCode,page+1:${state.page+1}");
    if(state.hasMore){
      var api = _discoverApi.matchVideoFindListByRegion(state.page+1, pageSize, regionCode!);
      mapRspToNotifier(api);
    }
  }

  void refresh(){
    mapRspToNotifier(_discoverApi.matchVideoFindListByRegion(1, pageSize, regionCode!));

  }

  @override
  void dispose() {
    super.dispose();
  }
}

