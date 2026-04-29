
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import '../data/user/CommonUser.dart';

class BlackModelProvider{

  final ProfileApi _profileApi = ProfileApi(DioHelper.getInstance());

  Future<UserListRsp> refresh (){
    return _profileApi.blackList(1, 20);
  }
  Future<UserListRsp> loadMore (int page){
    return _profileApi.blackList(page, 20);
  }
}

class BlackListNotifier extends BasePageStateNotifier<BaseApiPageState<CommonUser>>{

  BlackListNotifier(BaseApiPageState<CommonUser> state) : super(state){
    refresh();
  }
  final ProfileApi _profileApi = ProfileApi(DioHelper.getInstance());

  void loadMore(){
    if(state.hasMore){
      mapRspToNotifier(_profileApi.blackList(state.page+1, 20));
    }
  }

  void refresh(){
    mapRspToNotifier(_profileApi.blackList(1, 20));
  }

}