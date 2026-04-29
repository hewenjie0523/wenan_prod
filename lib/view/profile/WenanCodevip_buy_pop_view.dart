import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';

import '../../base/WenanCodeApplication.dart';
import '../../res/WenanCodestyles.dart';

class WenanAppVipBuyView extends ConsumerWidget {
  final VoidCallback cancelCallBack;
  final VoidCallback confirmCallBack;
  final int expireDay;

  const WenanAppVipBuyView(
      this.cancelCallBack, this.confirmCallBack, this.expireDay,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF1D002A),
            border: Border.all(color: AppColor.white, width: 4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _backgroundView(context),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: _nameWidget(),
            ),
            AppGap.vGap12,
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: _tipWidget(),
            ),
            AppGap.vGap16,
            Tapped(
              onTap: () {
                cancelCallBack();
              },
              child: _laterButton(),
            ),
            AppGap.vGap12,
            Tapped(
              onTap: () {
                confirmCallBack();
              },
              child: _continueButton(),
            ),
            AppGap.vGap16,
          ],
        ),
      ),
    );
  }

  Widget _backgroundView(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: ImageLoader.loadLocalImage(
        "me/wIeCntaDnS_1rfeosW_ivLiOpW_alCesaAv5e8_DtrodpbpdisnPgk",
        height: 170,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _tipWidget() {
    return expireDay > 0
        ? RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_vip_dialog_desc),
        style: AppTextStyle.white16Bold,
        children: [
          TextSpan(
            text: StringUtils.getFormatDate(expireDay,
                formats: StringUtils.FORMAT_DATE5),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    )
        : Text(
      StringTranslate.e2z(
          Application.appLocalizations!.wenan_string_vip_dialog_desc2),
      textAlign: TextAlign.center,
      style: AppTextStyle.white16Bold,
    );
  }


  Widget _nameWidget() {
    return Text(
      StringTranslate.e2z(
          Application.appLocalizations!.wenan_string_vip_dialog_title),
      style: AppTextStyle.style(
          color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 32),
      textAlign: TextAlign.center,
    );
  }


  Widget _laterButton() {
    return Container(
      width: 220,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
      ),
      alignment: Alignment.center,
      child: Text(StringTranslate.e2z(Application
          .appLocalizations!.wenan_string_vip_dialog_buy_later),
        style: AppTextStyle.style(
            color: const Color(0xFF666666),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }


  Widget _continueButton() {
    return Container(
      width: 220,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: UIUtils.mainGradient()),
      alignment: Alignment.center,
      child: Text(
        expireDay > 0
            ? StringTranslate.e2z(Application
                .appLocalizations!.wenan_string_vip_dialog_buy_continue)
            : StringTranslate.e2z(
                Application.appLocalizations!.wenan_string_vip_dialog_buy_now),
        style: AppTextStyle.white16Bold,
      ),
    );
  }

}
