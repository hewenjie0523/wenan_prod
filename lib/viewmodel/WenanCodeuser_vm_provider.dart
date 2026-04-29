
import 'dart:convert';

import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/http/UserApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodelog.dart';

import '../base/WenanCodeApplication.dart';
import '../base/WenanCodeSpHelper.dart';

class UserModelProvider{

  final UserApi _userApi = UserApi(DioHelper.getInstance());

  Future<UserInfoRsp> fillUserInfo (String nickName,int gender,String birthday,int headImageId){
    return _userApi.fillUserInfo(nickName, gender, birthday, headImageId);
  }

  Future<UserInfoRsp> updateUserInfo (){
    return _userApi.updateUserInfo();
  }

  Future<RawDataRsp> editUserBirthday (String birthday){
    return _userApi.editUserBirthday(birthday);
  }

  Future<RawDataRsp> editUserNickName (String nickName){
    return _userApi.editUserNickName(nickName);
  }

  Future<RawDataRsp> editUserInfo (int imageId,String nickName){
    return _userApi.editUserInfo(imageId,nickName);
  }

  Future<RawDataRsp> editUserSignature (String signature){
    return _userApi.editUserSignature(signature);
  }

  Future<RawDataRsp> editUserHead (int imageId){
    return _userApi.editUserHead(imageId);
  }
}

class UserNotifier extends BaseStateNotifier<BaseApiState<CommonUser>>{

  UserNotifier(BaseApiState<CommonUser> state) : super(state){
    updateUserInfo();
  }
  final UserApi _userApi = UserApi(DioHelper.getInstance());

  void updateUserInfo(){
    var updateReq = _userApi.updateUserInfo();
    mapRspToNotifier(updateReq).then((result){
      if(result.status == ReqStatus.success && result.data != null){
        Application.updateCommonUser(result.data);
        SpHelper.setCurrUserJson(jsonEncode(Application.commonUser));
        AuvChatLog.d("UserNotifier updateUserInfo updateUser:${result.data}");
      }
    });

  }

  void updateUserInfoDisturb(int noDisturb){
    //本地先修改
    state.data?.setDisturb(noDisturb);
    state = state.copyWith(rsp: state.data);
    //再云端更新
    updateUserInfo();
  }

  void fillUserInfo (String nickName,int gender,String birthday,int headImageId){
    mapRspToNotifier(_userApi.fillUserInfo(nickName, gender, birthday, headImageId));
  }

}

class UserInfoNotifier extends BaseStateNotifier<BaseApiState<CommonUser>>{

  int uid;
  UserInfoNotifier(BaseApiState<CommonUser> state,this.uid) : super(state){
    fetchUserInfo();
  }
  final UserApi _userApi = UserApi(DioHelper.getInstance());

  void fetchUserInfo(){
    mapRspToNotifier(_userApi.userInfo(uid));
  }

}