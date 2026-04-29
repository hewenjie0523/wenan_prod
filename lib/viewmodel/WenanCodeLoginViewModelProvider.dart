import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wenan/base/WenanCodeApiResult.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/http/WenanCodeHttpReqHelper.dart';
import 'package:wenan/http/LoginApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/ClientInfo.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../base/WenanCodeAppConfiguration.dart';
import 'package:wenan/StringTranslate.dart';

//rivipod/provider 模式
class LoginViewModelProvider {
  LoginApi loginApi = LoginApi(DioHelper.getInstance());

  LoginViewModelProvider();

  final int facebookLoginType = 6;
  final int googleLoginType = 5;
  final int appleLoginType = 4;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: '479882132969-9i9aqik3jfjd7qhci1nqf0bm2g71rm1u.apps.googleusercontent.com',
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<bool> loginKJ() async {
    AuvChatLog.d("loginKJ");
    String clientInfo = json.encode(ClientInfo().toJson());
    try {
      var result = await loginApi.loginDevice(clientInfo);
      if (result.code == 0) {
        saveUser(result);
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg ?? "");
      }
    } catch (obj, stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode ?? -1;
          msg = res?.statusMessage ?? "";
          break;
        default:
          break;
      }
      AuvChatLog.e(
          "http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
    }
    return false;
  }

  Future<bool> loginWidthId(String idAndPsw) async {
    AuvChatLog.d("loginWidthId:$idAndPsw");
    String clientInfo = json.encode(ClientInfo().toJson());
    try {
      List<String> idAndPswArr = idAndPsw.split(":");
      var result = await loginApi.loginWithId(idAndPswArr[0],idAndPswArr[1],clientInfo);
      if (result.code == 0) {
        saveUser(result);
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg ?? "");
      }
    } catch (obj, stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode ?? -1;
          msg = res?.statusMessage ?? "";
          break;
        default:
          break;
      }
      AuvChatLog.e(
          "http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
    }
    return false;
  }

  Future<bool> logout() async {
    AuvChatLog.d("logout");
    try {
      var result = await loginApi.logout();
      if (result.code == 0) {
        Application.quit();
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg ?? "");
      }
    } catch (obj, stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode ?? -1;
          msg = res?.statusMessage ?? "";
          break;
        default:
          break;
      }
      AuvChatLog.e(
          "http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
    }
    return false;
  }

  Future<bool> deleteAccount() async {
    AuvChatLog.d("logout");
    try {
      var result = await loginApi.deleteAccount();
      if (result.code == 0) {
        Application.quit();
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg ?? "");
      }
    } catch (obj, stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode ?? -1;
          msg = res?.statusMessage ?? "";
          break;
        default:
          break;
      }
      AuvChatLog.e(
          "http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
    }
    return false;
  }

  Future loginGoogle() async {
    try {
      var result = _googleSignIn.signIn().then((account) {
        AuvChatLog.d("loginGoogle _googleSignIn :$account");
        if (account == null) {
          AuvChatLog.d("Google Login token is empty");
          Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
          return false;
        }
        return account.authentication.then((auth) {
          var idToken = auth.idToken;
          _googleSignIn.signOut();
          if (Utils.isEmpty(idToken)) {
            AuvChatLog.d("google token is empty");
            Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
            return false;
          } else {
            return _commonPlatformLogin(googleLoginType, idToken!);
          }
        });
      });
      AuvChatLog.d("loginGoogle _googleSignIn result:$result");
      return result;
    }catch(e){
      AuvChatLog.e(
          "googleLogin request Got error : e");
    }
    return null;
  }

  Future<bool> _commonPlatformLogin(int mode, String token) async {
    String clientInfo = json.encode(ClientInfo().toJson());
    var appType = 1; //native
    try {
      var result = await (mode == appleLoginType
          ? loginApi.loginApple(appType, mode, token, clientInfo)
          : loginApi.loginPlatform(appType, mode, token, clientInfo));
      if (result.code == 0) {
        saveUser(result);
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg ?? "");
      }
    } catch (obj, stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode ?? -1;
          msg = res?.statusMessage ?? "";
          break;
        default:
          break;
      }
      // AuvChatLog.e(
      //     "http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
    }
    return false;
  }

  //适合StreamBuilder
  Stream<ApiResult<LoginDeviceRsp>> loginKJStream() {
    AuvChatLog.d("loginKJ");
    String clientInfo = json.encode(ClientInfo().toJson());
    return HttpReqHelper.mapApiResult(loginApi.loginDevice(clientInfo));
  }

  void saveUser(LoginDeviceRsp loginDeviceRsp) {
    AuvChatLog.d("saveUser ------> ${loginDeviceRsp.data}");
    if (loginDeviceRsp.data != null) {
      // Application.secretKey = loginDeviceRsp.data!.secret!;
      // Application.session = loginDeviceRsp.data!.session!;
      // Application.commonUser = loginDeviceRsp.data!.user!;

      AuvChatLog.d("saveUser ------> ${loginDeviceRsp.data!.user}");
      SpHelper.setAppSecret(loginDeviceRsp.data!.secret!);
      SpHelper.setAppSession(loginDeviceRsp.data!.session!);
      SpHelper.setCurrUserJson(jsonEncode(loginDeviceRsp.data!.user!));
      Application.onUserLogin();
      sendAdjustLogin();
    }
  }


  //适合StreamBuilder
  Stream<LoginDeviceRsp> loginKJStream2() async* {
    AuvChatLog.d("loginKJ");
    String clientInfo = json.encode(ClientInfo().toJson());
    var rsp = await loginApi.loginDevice(clientInfo);
    AuvChatLog.d("done");
    yield rsp;
  }

  Future<bool> loginApple() async {
    try{
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      // ignore: avoid_print
      print(credential);
      AuvChatLog.d(
          "Login Apple credential:$credential ${credential.identityToken}");

      if (!Utils.isEmpty(credential.identityToken)) {
        return await _commonPlatformLogin(
            appleLoginType, credential.identityToken ?? "");
      }
    }catch(e){
      AuvChatLog.d(
          "Login Apple error:$e");
    }
    return false;
  }

  Future<bool> loginFB() async {
    return false;
  }

  void sendAdjustLogin() {
    AuvChatLog.d("SendAdjustLogin Event", tag: "Adjust");
    AdjustEvent event = AdjustEvent(AppConfig.adjustLoginEvent);
    event.addCallbackParameter("user_id", "${Application.commonUser?.uid}");
    Adjust.trackEvent(event);
  }
}
