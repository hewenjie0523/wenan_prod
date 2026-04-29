
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../res/WenanCodecolors.dart';
import '../../../res/WenanCodegaps.dart';
import '../../../res/WenanCodestyles.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

import '../../../utils/WenanCodeimage_loader.dart';

class NaneBalanceHeadCoinsView extends ConsumerWidget {
  const NaneBalanceHeadCoinsView(this.coins, {super.key});

  final String coins;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: ImageLoader.loadLocalImage('me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0'),
            ),
            AppGap.hGap4,
            Text(
              coins,
              style: AppTextStyle.style(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
          ],
        ),
        AppGap.vGap4,
        Text(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_my_coins),
          style: AppTextStyle.style(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        )
      ],
    );
  }

}
