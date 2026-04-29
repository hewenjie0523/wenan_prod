
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/ClientInfo.dart';

import '../../../base/WenanCodeApplication.dart';
import '../../../res/WenanCodestyles.dart';
import '../../../utils/WenanCodeimage_loader.dart';
import '../../../utils/WenanCodeui_utils.dart';
import '../../WenanCodeSharedViewLogic.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

class NaneAppVersionView extends ConsumerWidget {
  const NaneAppVersionView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    var appVersion = ClientInfo().version;
    return UIUtils.settingItemWidget(
        _ellipsisText(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_version), context),
        descWidget: Text(
          "V ${appVersion ?? "1.0.0"}",
          style: AppTextStyle.white14_60p,
        ),
        onPressed: () {});
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
