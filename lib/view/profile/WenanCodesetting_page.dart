import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/view/profile/view/NaneArgeementItemView.dart';
import 'package:wenan/view/profile/view/NaneBlockListItemView.dart';
import 'package:wenan/view/profile/view/NaneClearCacheItemView.dart';
import 'package:wenan/view/profile/view/NaneFeedbackItemView.dart';
import 'package:wenan/view/profile/view/NaneVersionNumberItemView.dart';
import 'package:wenan/viewmodel/WenanCodeprofile_vm_provider.dart';
import '../../base/WenanCodeApplication.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../res/WenanCodecolors.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../../utils/WenanCodeutils.dart';
import '../../viewmodel/WenanCodeLoginViewModelProvider.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

import '../WenanCodeSharedViewLogic.dart';
import '../WenanCodehome_page.dart';
import 'package:wenan/StringTranslate.dart';

final loginViewModel = Provider.autoDispose((ref) => LoginViewModelProvider());

final profileVM = Provider.autoDispose((ref) => ProfileModelProvider());

final cachePro = FutureProvider.autoDispose<double>((ref) => ref.read(profileVM).getCacheSize());

class SettingPage extends ConsumerWidget {
  bool isOpen = false;

  SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D002A),
      appBar: AuvCupertinoNavigationBar(
        padding: const EdgeInsetsDirectional.only(top: 10),
        backgroundColor: const Color(0xFF1D002A),
        middle: Text(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_setting),
          style: AppTextStyle.TextWhite_18,
        ),
        leading: UIUtils.navigationCommonBackButton(
          () => FluroRouter.appRouter.pop(context),
          color: AppColor.white,
        ),
      ),
      body: Column(
        children: [
          const NaneCustomerServiceItemView(),
          const NaneBlockItemWidget(),
          const NaneAgreementView(),
          _safetyStandardsWidget(context),
          const NaneClearCacheView(),
          const NaneAppVersionView(),
          _logoutWidget(context, ref),
          _deleteWidget(context, ref)
        ],
      ),
    );
  }

  Widget _safetyStandardsWidget(BuildContext context) {
    return UIUtils.settingItemWidget(_commonHeadText(AppLocalizations.of(context)!.wenan_string_child_stand, context), onPressed: () {
      PageRouter.startWebview(context, "https://h5.ucmetas.com/sf_stans.html");
    },
        endIcon: ImageLoader.loadLocalImage(
            Application.isARLanguage()
                ? "profile/w1eDnGatn0_irneVsd_3asr7rzo1wM_xeUnbdV_RmaeY_4iRc8oGnB"
                : "profile/w7eVnKaXnV_4r0e3sw_VaIr4rroYwd_ZeEnNd0_gi6cmopn0",
            width: 12,
            height: 12));
  }

  Widget _logoutWidget(BuildContext context, WidgetRef ref) {
    return UIUtils.settingItemWidget(_commonHeadText(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_log_out), context), onPressed: () {
      SharedViewLogic.showLogoutConfirmDlg(context, okCallBack: () async {
        ref.read(loginViewModel).logout().then((out) {
          if (out) {
            ref.refresh(loginStatusProvider);
            FluroRouter.appRouter.pop(context);
          }
        });
      });
    });
  }

  Widget _deleteWidget(BuildContext context, WidgetRef ref) {
    return Visibility(
        visible: !AppConfig.inProduction,
        child: UIUtils.settingItemWidget(
            _commonHeadText(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_delete_account), context, style: AppTextStyle.ff4e4e_16),
            onPressed: () {
          SharedViewLogic.showDeleteAccountConfirmDlg(context, okCallBack: () async {
            ref.read(loginViewModel).deleteAccount().then((out) {
              if (out) {
                ref.refresh(loginStatusProvider);
                FluroRouter.appRouter.pop(context);
              }
            });
          });
        }));
  }

  Widget _commonHeadText(String text, BuildContext context, {TextStyle style = AppTextStyle.white16}) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80),
      child: Text(
        text,
        style: style,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
