
import 'dart:async';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/event/WenanCodediscover_event.dart';
import 'package:wenan/state/event/WenanCodediscover_filter_event.dart';
import 'package:wenan/http/DiscoverApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';


enum DiscoverType{
  POPULAR,
  FOLLOWING
}
class DiscoverPageNotifier extends BasePageStateNotifier<BaseApiPageState<CommonUser>>{

  final pageSize = 40;
  String? _regionCode;
  DiscoverType type;

  StreamSubscription<DiscoverEvent>? removeSubscription;
  StreamSubscription<DiscoverFilterEvent>? regionSubscription;

  DiscoverPageNotifier(BaseApiPageState<CommonUser> state,this.type) : super(state){
    _regionCode = SpHelper.getDiscoverFilterCode();
    if(Utils.isEmptyString(_regionCode)){
      _regionCode =  "";
    }

    removeSubscription = Application.eventBus.on<DiscoverEvent>().listen((event) {
      if(event.type == DiscoverEventType.remove&&event.user!=null){
        AuvChatLog.d("DiscoverEvent: remove");
        modifyData(removed: [event.user!]);
      }
    });

    regionSubscription = Application.eventBus.on<DiscoverFilterEvent>().listen((event) {
      _regionCode = event.regionCode;
      if(type==DiscoverType.POPULAR){
        refresh();
      }
    });

    refresh(firstLoad: true);
  }

  final DiscoverApi _discoverApi = DiscoverApi(DioHelper.getInstance());

  void refresh({bool firstLoad = false}){
    AuvChatLog.d("discover refresh,Application.commonUser?.regionCode:${Application.commonUser?.regionCode},regionCode:$_regionCode");
    var api;
    if (type==DiscoverType.FOLLOWING){
      api = _discoverApi.followingUsers(1, pageSize);
    } else{
      api = _discoverApi.discoversByRegion(1, pageSize, _regionCode!);
    }
    if(type==DiscoverType.POPULAR){
      List<CommonUser>? result = AppCache.instance.getList("${AppCacheKeys.DISCOVER_ANCHOR_LIST}_${_regionCode??""}",convert: (json)=>CommonUser.fromJson(json));
      AuvChatLog.d("discovers anchor,fromcCache:$result");
      if(result?.isNotEmpty==true){
        state.dataList = result;
        state.page = 1;
        state = state.copyWith(status: ReqStatus.loading);
      }
    }
    mapRspToNotifier(api).then((value) {
      if(!mounted){
        return;
      }
      if(type==DiscoverType.POPULAR){
        if(state.dataList?.isNotEmpty==true){
          AuvChatLog.d("discovers anchor,save 2 cache");
          AppCache.instance.put("${AppCacheKeys.DISCOVER_ANCHOR_LIST}_${_regionCode??""}", state.dataList,validTimeInMills: 24*60*60*1000);
        }
      }
    });

  }

  @override
  void dispose() {
    AuvChatLog.d("DiscoverPageNotifier dispose");
    removeSubscription?.cancel();
    regionSubscription?.cancel();
    super.dispose();
  }

  void loadMore(){
    AuvChatLog.d("discover loadMore,_regionCode=$_regionCode,page+1:${state.page+1}");
    if(state.hasMore){
      var api;
      if (type==DiscoverType.FOLLOWING){
        api = _discoverApi.followingUsers(state.page+1, pageSize);
      } else{
        api = _discoverApi.discoversByRegion(state.page+1, pageSize, _regionCode!);
      }
      mapRspToNotifier(api);
    }
  }

}

