import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/data/Region.dart';
import 'package:wenan/data/call/AppChatCall.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/event/WenanCodeChatCallEvent.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/UserApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/proto/we_ps_bu_call.pb.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodecall_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/http/socket/WenanCodesocket_util.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/StringTranslate.dart';

final matchFilterSexProvider =
    StateProvider((ref) => SpHelper.getMatchFilterSex());
final matchFilterRegionProvider =
    StateProvider((ref) => SpHelper.getMatchFilterRegionCode());
final matchViewModel = Provider.autoDispose((ref) => MatchViewModel());

class MatchViewModel {
  CommonApi? _commonApi;
  ProfileApi? _profileApi;

  CommonApi _getCommonApi() {
    return _commonApi ??= CommonApi(DioHelper.getInstance());
  }

  ProfileApi _getProfileApi() {
    return _profileApi ??= ProfileApi(DioHelper.getInstance());
  }

  void setFilterSex(int value, WidgetRef ref) {
    SpHelper.setMatchFilterSex(value);
    ref.refresh(matchFilterSexProvider);
  }

  void setFilterRegionCode(String? regionCode, WidgetRef ref) {
    SpHelper.setMatchFilterRegionCode(regionCode ?? "");
    ref.refresh(matchFilterRegionProvider);
  }

  Future<List<Region>?> getListRegions() async {
    try {
      List<Region>? result = AppCache.instance.getList(AppCacheKeys.REGION_LIST,
          convert: (json) => Region.fromJson(json));
      AuvChatLog.d("getListRegions,fromcCache:$result");
      if (result == null || result.isEmpty) {
        var rsp = await _getCommonApi().listRegions();
        result = rsp.data?["regions"];
        if (rsp.code == 0) {
          AppCache.instance.put(AppCacheKeys.REGION_LIST, result,
              validTimeInMills: 5 * 60 * 1000);
        }
      }
      AuvChatLog.d("getListRegions:$result");
      return result;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return null;
  }

  Future<List<RandomAvatar>?> getRandomAvatars() async {
    try {
      List<RandomAvatar>? result = AppCache.instance.getList(
          AppCacheKeys.RANDOM_AVATA_LIST,
          convert: (json) => RandomAvatar.fromJson(json));
      AuvChatLog.d("getRandomAvatars,fromcCache:$result");
      if (result == null || result.isEmpty) {
        var rsp = await _getProfileApi().randomAvatars();
        result = rsp.data?.users;
        if (rsp.code == 0) {
          AppCache.instance.put(AppCacheKeys.RANDOM_AVATA_LIST, result,
              validTimeInMills: 24 * 60 * 60 * 1000);
        }
      }
      AuvChatLog.d("getRandomAvatars:$result");
      return result;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return null;
  }
}

enum WenanAppMatchingPageState {
  IDLE,
  REQUEST,
  REQUEST_FAILED,
  MATCHING,
  MATCHING_TIMEOUT,
  MATCHED,
  // MATCHED_USER_CANCELED,
  // CONFIRMING,
  // CONFIRMED
}

class WenanAppMatchingPageStates {
  WenanAppMatchingPageState state = WenanAppMatchingPageState.IDLE;
  List<String>? matchingHeads;
  String? errorMsg;
  ChatCallMatchPSH? matchPSH;
  CommonUser? matchedUser;
  bool? matchedUserProfileGot;
  int matchType;
  String? remainCountStr;

  WenanAppMatchingPageStates(this.matchType);

  bool hasMeConfirmed() {
    return getMineMatchStatus(matchPSH?.status) == 1;
  }

  static int? getMineMatchStatus(int? status) {
    if (status != null) {
      return (status & 3);
    }
    return null;
  }

  static int? getMatchedUserMatchStatus(int? status) {
    if (status != null) {
      return (status & 12) >> 2;
    }
    return null;
  }

  WenanAppMatchingPageStates copyWith(
      {WenanAppMatchingPageState? state,
      List<String>? matchingHeads,
      ChatCallMatchPSH? matchPSH,
      CommonUser? matchedUser,
      bool? matchedUserProfileGot,
      String? remainCountStr,
      String? errorMsg}) {
    WenanAppMatchingPageStates copyWith = WenanAppMatchingPageStates(matchType);
    copyWith.state = state ?? this.state;
    copyWith.matchingHeads = matchingHeads ?? this.matchingHeads;
    copyWith.matchPSH = matchPSH ?? this.matchPSH;
    copyWith.matchedUser = matchedUser ?? this.matchedUser;
    copyWith.matchedUserProfileGot =
        matchedUserProfileGot ?? this.matchedUserProfileGot;
    copyWith.remainCountStr = remainCountStr ?? this.remainCountStr;
    copyWith.errorMsg = errorMsg ?? this.errorMsg;
    return copyWith;
  }
}

class MatchingPageStatesNotifier extends StateNotifier<WenanAppMatchingPageStates> {
  StreamSubscription? _chatEventSubscription;
  StreamSubscription? _chatCallEventSubscription;
  bool pageQuited = false;

  MatchingPageStatesNotifier(WenanAppMatchingPageStates state) : super(state) {
    _chatEventSubscription =
        Application.eventBus.on<ChatCallMatchPSH>().listen((event) {
      AuvChatLog.d("onReceiveMatchPush:$event");
      onReceiveMatchPush(event);
    });
    _chatCallEventSubscription =
        Application.eventBus.on<ChatCallEvent>().listen((event) {
      AuvChatLog.d("_chatCallEventSubscription:${event.chatCall.status}");
      //来电并且不是aiv
      if (!event.chatCall.isMeCalling()&&!(event.chatCall.aivCall())) {
        AuvChatLog.d("cancelRequestMatchAndQuit for chatcall ringing");
        cancelRequestMatchAndQuit();
      }
    });
    requestMatch();
  }

  requestMatch() async {
    try {
      if(state.state == WenanAppMatchingPageState.REQUEST){
        return;
      }
      state = state.copyWith(
          state: WenanAppMatchingPageState.REQUEST,
      );

      var rsp = await CallApi.sendChatCallMatchReq(SpHelper.getMatchFilterSex(),
              state.matchType, Application.commonUser?.regionCode)
          .first;
      AuvChatLog.d("SpHelper.getMatchFilterSex():${SpHelper.getMatchFilterSex()}");
      AuvChatLog.d("state.matchType:${state.matchType}");
      AuvChatLog.d("Application.commonUser?.regionCode:${Application.commonUser?.regionCode}");
      //有时候psh的下发比rsp返回还快
      if (state.state == WenanAppMatchingPageState.REQUEST) {
        state = state.copyWith(
            state: WenanAppMatchingPageState.MATCHING,
            matchingHeads: rsp?.randomAvatars,
            remainCountStr: "${rsp?.remainCount}/${rsp?.limitCount}");
        _checkMatchTime();
      }
    } catch (e, stack) {
      AuvChatLog.printE("error e", error: stack);
      String errorMsg = e.toString();
      if (e is SocketRspError) {
        errorMsg = e.errorMsg ?? errorMsg;
      }
      // state = state.copyWith(
      //     state: MatchingPageState.REQUEST_FAILED, errorMsg: errorMsg);
      _quit(errorMsg: errorMsg);
      return;
    }
  }

  Timer? _matchTimeoutTimer;

  _checkMatchTime() {
    _matchTimeoutTimer = Timer(const Duration(seconds: 30), () {
      if (state.state == WenanAppMatchingPageState.MATCHING) {
        //匹配超时
        // state = state.copyWith(
        //     state: MatchingPageState.MATCHING_TIMEOUT,
        //     errorMsg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_connecting_timeout));
        cancelRequestMatch();
        _quit(errorMsg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_connecting_timeout));
        return;
      }
    });
    // and later, before the timer goes off...
  }


  cancelRequestMatchAndQuit() async {
    AuvChatLog.d("cancelRequestMatchAndQuit,pageQuited:$pageQuited");
    if (pageQuited) {
      if(PageRouter.instance.topPage==PageRouter.MatchingPage){
        //something wrong here,we should not pop page directly
        AuvChatLog.d("something wrong here,we should not pop page directly");
        if (Application.appContext != null) {
          FluroRouter.appRouter.pop(Application.appContext!);
        }
      }
      return;
    }
    cancelRequestMatch();
    _quit();
  }

  cancelRequestMatch() async {
    try {
      await CallApi.sendCancelChatCallMatchReq(state.matchType,
              matchId: state.matchPSH?.matchId.toInt())
          .first;
    } catch (e, stack) {
      AuvChatLog.printE("error e", error: stack);
    }
  }


  // confirmRequestMatch() async {
  //   try {
  //     await CallApi.sendConfirmChatCallMatchReq(matchId:state.matchPSH?.matchId.toInt()).first;
  //   } catch (e, stack) {
  //     AuvChatLog.printE("error e", error: stack);
  //   }
  // }

  skipRequest() async {
    await cancelRequestMatch();
    state = WenanAppMatchingPageStates(state.matchType);
    requestMatch();
  }

  onReceiveMatchPush(ChatCallMatchPSH matchPSH) {
    _matchTimeoutTimer?.cancel();
    var copyMatchedUser = state.matchedUser == null
        ? SocketUtil.convertUserProto(matchPSH.matchUser)
        : null;
    //// 匹配状态 4位二进制,高位两位表示对方,低位两位表示自己,0:等待确认 1:已确认 2:取消
    var mineStatus = WenanAppMatchingPageStates.getMineMatchStatus(matchPSH.status);
    var matchedUserStatus =
        WenanAppMatchingPageStates.getMatchedUserMatchStatus(matchPSH.status);
    AuvChatLog.d(
        "onReceiveMatchPush:matchPSH,mineStatus=${mineStatus},matchedUserStatus=${matchedUserStatus},autocall=${matchPSH.autoCall},${matchPSH.call.id}");
    var newState = WenanAppMatchingPageState.MATCHED;
    // String? errorMsg;
    // if(mineStatus==1&&matchedUserStatus==1){
    //   newState = MatchingPageState.CONFIRMED;
    //   state = state.copyWith(
    //       state: newState,
    //       matchedUser: copyMatchedUser,
    //       errorMsg: errorMsg,
    //       matchPSH: matchPSH);
    //   quitAndStartChatCall();
    //   return;
    // } else if(mineStatus==2||matchedUserStatus==2){
    //   // newState = MatchingPageState.MATCHED_USER_CANCELED;
    //   errorMsg = StringTranslate.e2z(Application.appLocalizations!.wenan_string_matching_failed);
    //   _quit(errorMsg:errorMsg);
    //   return;
    // } else if(mineStatus==1||matchedUserStatus==1){
    //   newState = MatchingPageState.CONFIRMING;
    // }
    state = state.copyWith(
        state: newState,
        matchedUser: copyMatchedUser,
        // errorMsg: errorMsg,
        matchPSH: matchPSH);
    _loadMatchedUserInfo();
  }

  UserApi? _userApi;
  _loadMatchedUserInfo() async {
    if (state.matchedUserProfileGot == true) {
      return;
    }
    _userApi ??= UserApi(DioHelper.getInstance());
    try {
      var user =
          (await _userApi!.userInfo(state.matchedUser?.uid ?? 0)).data?.user;
      state = state.copyWith(matchedUser: user, matchedUserProfileGot: true);
    } catch (e, obj) {
      AuvChatLog.printE(e, error: obj);
    }
  }

  @override
  void dispose() {
    AuvChatLog.d("notifier dispose");
    _matchTimeoutTimer?.cancel();
    _chatEventSubscription?.cancel();
    _chatCallEventSubscription?.cancel();
    super.dispose();
  }
  _quit({String? errorMsg, VoidCallback? routeCallBack}) {
    if (pageQuited) {
      return;
    }
    pageQuited = true;
    if (errorMsg != null) {
      Fluttertoast.showToast(msg: errorMsg);
    }
    if (mounted && Application.appContext != null) {
      FluroRouter.appRouter.pop(Application.appContext!);
    }
    routeCallBack?.call();
  }

  quitAndStartChatCall() {
    _quit(routeCallBack: () {
      //跳转通话界面
      final matchUser = state.matchedUser;
      if (Application.appContext != null && matchUser != null) {
        var chatCall = state.matchPSH?.call.id == 0
            ? null
            : SocketUtil.convertChatCallProto(state.matchPSH!.call);
        AuvChatLog.d(
            "quitAndStartChatCall:chatCall=$chatCall,autocall=${state.matchPSH?.autoCall},${state.matchPSH?.call.id == 0}");
        PageRouter.startChatCall(Application.appContext!, matchUser,
            PayFromType.FROM_MATCHING,
            chatCall: AppChatCall.callInvite(matchUser.uid!,sourceType: ChatCallSourceType.match.index));
      }
    });
  }


}

final matchingStateNotifier = StateNotifierProvider.autoDispose
    .family<MatchingPageStatesNotifier, WenanAppMatchingPageStates, int>(
        (ref, matchType) =>
            MatchingPageStatesNotifier(WenanAppMatchingPageStates(matchType)));
