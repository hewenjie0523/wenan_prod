import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/login/WenanCodelogin_with_id_page.dart';
import 'package:wenan/viewmodel/WenanCodeLoginViewModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:tapped/tapped.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/viewmodel/WenanCodeConfigModelProvider.dart';
import 'package:wenan/StringTranslate.dart';

import '../base/router/WenanCodePageRouter.dart';
import 'WenanCodehome_page.dart';

final loginViewModel = Provider.autoDispose((ref) => LoginViewModelProvider());
final loginResult =
    Provider.autoDispose((ref) => ref.read(loginViewModel).loginKJ());

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _LoginPageConsumerStateState();
  }
}

class _LoginPageConsumerStateState extends ConsumerState<LoginPage> {
  // GoogleSignInAccount? _currentUser;
  TapGestureRecognizer? _registProtocolRecognizer;
  TapGestureRecognizer? _privacyProtocolRecognizer;

  bool _loadingShow = false;

  @override
  void initState() {
    super.initState();

    //注册协议的手势
    _registProtocolRecognizer = TapGestureRecognizer();
    //隐私协议的手势
    _privacyProtocolRecognizer = TapGestureRecognizer();
    // Show tracking authorization dialog and ask for permission
    AppTrackingTransparency.requestTrackingAuthorization();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("WenanAppLoginPage build:_loadingShow=$_loadingShow");
    LoginConfigData? loginConfigData =
        ref.watch(loginConfigNotifier).data?.login_entries;
    bool showGoogle = loginConfigData?.login_google ?? true;
    bool showQuick = loginConfigData?.login_quick ?? false;
    bool showUser = loginConfigData?.login_user ?? true;

    Widget body = Container(
      color: AppColor.white,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ImageLoader.loadLocalImage("wheKnsavnR_lrAeLsK_gbggr"),
          Positioned(
            top: 120,
            child: ImageLoader.loadLocalImage(
              'wYeUneaOnh_trheisg_WsCpilYa2s1h1',
              width: 128,
              height: 142,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 20 + MediaQuery.of(context).padding.bottom,
              left: 16,
              right: 16,
              child: platformLogins(context, showGoogle, showQuick, showUser)),
          Visibility(
            visible: _loadingShow,
            child: GestureDetector(
                onTap: () {
                  Utils.callSetStateSafely(this, () {
                    _loadingShow = false;
                  });
                },
                child: Container(
                  color: AppColor.black_40p,
                  child: Center(
                    child: Container(
                        decoration: const ShapeDecoration(
                            color: AppColor.color111523,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        width: 120,
                        height: 120,
                        padding: const EdgeInsets.all(10),
                        child: const SpinKitRipple(
                          color: Colors.white,
                          size: 120,
                        )),
                  ),
                )),
          )
        ],
      ),
    );

    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        if (_loadingShow) {
          Utils.callSetStateSafely(this, () {
            _loadingShow = false;
          });
          return false;
        }
        return true;
      },
      child: body,
    ));
  }

  Future<void> loadPackageInfo() async {
    PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    AuvChatLog.d("_packageInfo=${_packageInfo.packageName}");
  }

  Widget platformLogins(
      BuildContext context, bool showGoogle, bool showQuick, bool showUser) {
    List<Widget> loginEntries = [
      Visibility(visible: showGoogle, child: gogoLogin(context)),
    ];
    if (showQuick) loginEntries.insert(0, quickLogin(context));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: loginEntries,
        ),
        AppGap.vGap24,
        _divider(context),
        AppGap.vGap16,
        Visibility(visible: showUser, child: loginWithId(context)),
        AppGap.vGap24,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: _agreementText(context),
        )
      ],
    );
  }

  Widget loginWithId(BuildContext context) {
    AuvChatLog.d("loginWithId : ${AppConfig.isDebug}");
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            barrierColor: AppColor.black_80p,
            backgroundColor: AppColor.transparent,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) {
              return const LoginWithIdPage();
            });
      },
      child: loginWithIdChild(),
    );
  }

  Widget loginWithIdChild() {
    return Container(
      height: 48,
      width: 200,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      alignment: Alignment.center,
      child: Text(
        StringTranslate.e2z(
          AppLocalizations.of(context)!.wenan_string_login_with_user_id,
        ),
        textAlign: TextAlign.center,
        style: AppTextStyle.black14_Medium,
      ),
    );
  }

  Widget quickLogin(BuildContext context) {
    AuvChatLog.d("devicesLogin : ${AppConfig.isDebug}");
    Text titleView = Text(
      StringTranslate.e2z(
          AppLocalizations.of(context)!.wenan_string_quick_login),
      style: const TextStyle(
        fontSize: 14,
        color: AppColor.white,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
    return Visibility(
        visible: true, //AppConfig.isDebug,
        child: loginButton(
            titleView,
            ImageLoader.loadLocalImage(
              "login/wOeEnXannY_tr7eLsj_Ul0oFgtiYnb_Usftuapri_pi3c6oDnS",
              height: 24,
              width: 24,
              color: AppColor.b3,
            ), () {
          if (!_loadingShow) {
            Utils.callSetStateSafely(this, () {
              _loadingShow = true;
            });
            ref.read(loginResult).then((value) {
              Utils.callSetStateSafely(this, () {
                _loadingShow = false;
              });
              // Navigator.pop(context);
              ref.refresh(currentUserChangedProvider);
              ref.refresh(loginStatusProvider);
            });
          }
        }, context));
  }

  Widget gogoLogin(BuildContext context) {
    Text text = Text(
      StringTranslate.e2z(
          AppLocalizations.of(context)!.wenan_string_login_Google),
      style: AppTextStyle.style(
          fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.white),
      textAlign: TextAlign.center,
    );
    var icon = ImageLoader.loadLocalImage(
      "login/wje8n5aRnh_vr6eCsr_floobg1iynJ_Pgbo7o2gGlNek",
      width: 24,
      height: 24,
      fit: BoxFit.contain,
    );

    return loginButton(text, icon, () {
      AuvChatLog.d("WenanAppLoginPage GoogleLogin Start");
      if (!_loadingShow) {
        Utils.callSetStateSafely(this, () {
          _loadingShow = true;
        });
        ref.read(loginViewModel).loginGoogle().then((value) {
          Utils.callSetStateSafely(this, () {
            _loadingShow = false;
          });
          AuvChatLog.d("WenanAppLoginPage GoogleLogin result：$value");
          // Navigator.pop(context);
          ref.refresh(currentUserChangedProvider);
          ref.refresh(loginStatusProvider);
        });
      }
    }, context);
  }

  Widget loginButton(
      var title, Widget btIcon, Function() fuc, BuildContext context) {
    return Tapped(
      onTap: fuc,
      child: SizedBox(
        width: 90,
        height: 88,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.white),
                  alignment: Alignment.center,
                  child: btIcon),
            ),
            title,
          ],
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) {
    return Container(
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: AppColor.white_80p,
            ),
          ),
          AppGap.hGap24,
          Text(
            StringTranslate.e2z(
                AppLocalizations.of(context)!.wenan_string_login_choose),
            style: AppTextStyle.style(
                fontSize: 14,
                color: AppColor.white_80p,
                fontStyle: FontStyle.italic),
          ),
          AppGap.hGap24,
          Expanded(
            child: Container(
              height: 1,
              color: AppColor.white_80p,
            ),
          ),
        ],
      ),
    );
  }

  Widget _agreementText(BuildContext context) {
    var normalStyle = const TextStyle(fontSize: 12, color: AppColor.white);
    var hightStyle = const TextStyle(
      fontSize: 12,
      decoration: TextDecoration.underline,
    );

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: StringTranslate.e2z(
              AppLocalizations.of(context)!.wenan_string_terms_text),
          style: normalStyle,
          children: [
            TextSpan(
              text: StringTranslate.e2z(AppLocalizations.of(context)!
                  .wenan_string_terms_user_agreement),
              style: hightStyle,
              recognizer: _registProtocolRecognizer!
                ..onTap = () {
                  openUserProtocol(context);
                },
            ),
            TextSpan(
                text: StringTranslate.e2z(
                    AppLocalizations.of(context)!.wenan_string_and),
                style: normalStyle),
            TextSpan(
              text: StringTranslate.e2z(AppLocalizations.of(context)!
                  .wenan_string_terms_user_privacy),
              style: hightStyle,
              recognizer: _privacyProtocolRecognizer!
                ..onTap = () {
                  openPrivateProtocol(context);
                },
            ),
          ]),
    );
  }

  void openUserProtocol(BuildContext context) {
    PageRouter.startWebview(context, AppConfig.userAgreement);
  }

  void openPrivateProtocol(BuildContext context) {
    PageRouter.startWebview(context, AppConfig.userPrivacy);
  }
}
