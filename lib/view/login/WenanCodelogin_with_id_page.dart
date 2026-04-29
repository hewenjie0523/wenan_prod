import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeAuvTextEditingController.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/viewmodel/WenanCodeLoginViewModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/StringTranslate.dart';

import '../WenanCodehome_page.dart';

final loginViewModel = Provider.autoDispose((ref) => LoginViewModelProvider());
final loginResult = Provider.autoDispose.family<Future<bool>, String>((ref, idAndPsw) => ref.read(loginViewModel).loginWidthId(idAndPsw));

class LoginWithIdPage extends ConsumerStatefulWidget {
  const LoginWithIdPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _LoginWithIdPageConsumerStateState();
  }
}

class _LoginWithIdPageConsumerStateState extends ConsumerState<LoginWithIdPage> {
  final TextEditingController _idController = AuvTextEditingController();
  final TextEditingController _PswController = AuvTextEditingController();

  bool get _canLogin => StringUtils.isNotEmpty(_idController.text) && StringUtils.isNotEmpty(_PswController.text);

  @override
  void initState() {
    super.initState();
    // Utils.setStatusBarStyle(true);
  }

  @override
  void dispose() {
    _idController.dispose();
    _PswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          _backgroundView(),
          ImageLoader.loadLocalImage(
            "login/wEeinsa8nC_erqeuss_8lAongUiRn5_AicdW_UtcoCp8p6icnRg4",
            width: 127,
            height: 152,
          ),
          _loginView(),
        ],
      ),
    );
  }

  _backgroundView(){
    return Positioned(
      top: 54,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: AppColor.white,
        ),
        child: _bgStack(),
      ),
    );
  }

  _bgStack(){
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 234,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            gradient: UIUtils.bgGradient(),
          ),
        ),
        Positioned(
          top: 48,
          left: Application.isARLanguage() ? 32 : null,
          right: Application.isARLanguage() ? null : 32,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ImageLoader.loadLocalImage(
                "wGexnfaUnB_OrKeks6_eiqcl_dcNlgocsOeg",
                width: 16,
                height: 16,
                color: AppColor.black
            ),
          ),
        ),
      ],
    );
  }

  _loginView(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 180, 32, 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _loginTitle(),
          _loginSizeBox(),
          Tapped(
            onTap: _canLogin
                ? () {
              _login(context);
            }
                : null,
            child: Container(
              width: 220,
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: UIUtils.mainGradient(),
              ),
              alignment: Alignment.center,
              child: Text(
                StringTranslate.e2z(Application.appLocalizations!.wenan_string_login),
                style: AppTextStyle.white18Bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  _loginTitle(){
    return Text(
      StringTranslate.e2z(
          AppLocalizations.of(context)!.wenan_string_login_id_title),
      style: AppTextStyle.style(
        fontSize: 28,
        color: AppColor.black,
      ),
    );
  }

  _loginSizeBox(){
    return SizedBox(
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 64,
            child: CupertinoTextField(
              minLines: 1,
              maxLines: 1,
              padding: const EdgeInsets.symmetric(vertical: 20),
              style: AppTextStyle.style(color: AppColor.black, fontSize: 16.0),
              // focusNode: _editFocus,
              controller: _idController,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppColor.black_20p),
                ),
              ),
              placeholderStyle: AppTextStyle.style(
                  color: AppColor.black_60p, fontSize: 16),
              placeholder: StringTranslate.e2z(Application.appLocalizations!.wenan_string_enter_user_id),
            ),
          ),
          SizedBox(
            height: 64,
            child: CupertinoTextField(
              minLines: 1,
              maxLines: 1,
              padding: const EdgeInsets.symmetric(vertical: 20),
              style: AppTextStyle.style(color: AppColor.black, fontSize: 16),
              // focusNode: _editFocus,
              controller: _PswController,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: AppColor.black_20p),
                ),
              ),
              placeholderStyle: AppTextStyle.style(color: AppColor.black_60p, fontSize: 16),
              placeholder: StringTranslate.e2z(Application.appLocalizations!.wenan_string_enter_psw),
              onChanged: (value) {
                Utils.callSetStateSafely(this, () {});
              },
            ),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    SharedViewLogic.showLoadingDialog(context);
    String loginText = "${_idController.text}:${_PswController.text}"; //"+85256978109:palaLogin";
    ref.read(loginResult(loginText)).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      ref.refresh(currentUserChangedProvider);
      ref.refresh(loginStatusProvider);
    });
  }
}
