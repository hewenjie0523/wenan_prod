


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/ClientInfo.dart';

import '../http/LoginApi.dart';
import '../utils/WenanCodelog.dart';
import 'package:wenan/StringTranslate.dart';

class LoginGoogleVMProvider{

  LoginApi loginApi = LoginApi(DioHelper.getInstance());

  GoogleSignInAccount? _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );


  LoginGoogleVMProvider(){
    init();
  }

  void init(){
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      _currentUser = account;
      // if (_currentUser != null) {
      //   _currentUser!.authentication.then((value) => _handleGetContact(value.accessToken));
      //
      // }
    });
  }

  void doGGLogin(){
    _googleSignIn.signInSilently();
  }


  Future<bool> loginGG() async {
    AuvChatLog.d("loginKJ");
    String clientInfo = json.encode(ClientInfo().toJson());
    try {
      var result = await loginApi.loginDevice(clientInfo);
      if (result.code == "0") {
        //saveUser(result);
        return true;
      } else {
        Fluttertoast.showToast(msg: result.msg??StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
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

  _handleGetContact(String accessToken) {}

}