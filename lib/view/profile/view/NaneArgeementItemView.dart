
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/WenanCodeAppConfiguration.dart';
import '../../../base/WenanCodeApplication.dart';
import '../../../res/WenanCodestyles.dart';
import '../../../base/router/WenanCodePageRouter.dart';
import '../../../utils/WenanCodeimage_loader.dart';
import '../../../utils/WenanCodeui_utils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

class NaneAgreementView extends ConsumerWidget {
  const NaneAgreementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    return UIUtils.settingItemWidget(
        _ellipsisText(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_privacy_agreement),
            context),
        endIcon: _commonArrowIcon(), onPressed: () {
      PageRouter.startWebview(context, AppConfig.userPrivacy);
    });
  }

  Widget _commonArrowIcon() {
    return ImageLoader.loadLocalImage(
        Application.isARLanguage()
            ? "profile/w1eDnGatn0_irneVsd_3asr7rzo1wM_xeUnbdV_RmaeY_4iRc8oGnB"
            : "profile/w7eVnKaXnV_4r0e3sw_VaIr4rroYwd_ZeEnNd0_gi6cmopn0",
        width: 12,
        height: 12);
  }

  Widget _ellipsisText(String text, BuildContext context,
      {TextStyle style = AppTextStyle.white16}) {
    return Container(
      constraints:
      BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 80),
      child: Text(
        text,
        style: style,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
