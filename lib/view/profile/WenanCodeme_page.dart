import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/profile/WenanCodesetting_page.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../state/WenanCodeBaseApiState.dart';
import '../../utils/WenanCodestring_format.dart';
import '../../utils/WenanCodeutils.dart';
import '../WenanCodeSharedViewLogic.dart';
import '../match/discover/gift/WenanCodeGiftPage.dart';
import '../WenanCodehome_page.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

class MePage extends ConsumerStatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  createState() {
    return _MePageState();
  }
}

class _MePageState extends ConsumerState<MePage> with AutomaticKeepAliveClientMixin {
  final int PHOTO_SIZE = 6;
  final bool isAr = Application.isARLanguage();

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    AuvChatLog.d("MePageState initState ");
    // ref.refresh(currUserCoins);
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("MePage build  refresh");
    var user = (ref.watch(commonUserNotify) as BaseApiState<CommonUser>).data ?? Application.commonUser;
    var coins = ref.watch(currUserCoins).value;
    return Stack(
      children: [
        Container(
          color: const Color(0xFF1D002A),
        ),
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _userInfoLayout(user, coins),
            ),
            SliverToBoxAdapter(
              child: _functionLayout(user),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 106),
            ),
          ],
        )
      ],
    );
  }

  Widget _userInfoLayout(CommonUser? user, var coins) {
    AuvChatLog.d("MePage _headLayout  refresh");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        image: DecorationImage(image: ImageLoader.assetImage("me/wFeSnTajnt_qrJexs1_1mEee_KbVgQ"), fit: BoxFit.fill),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: _userInfoCard(user),
          ),
          _balanceCard(),
        ],
      ),
    );
  }

  _userInfoCard(CommonUser? user) {
    bool isVip = user?.isVip() ?? false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ImageLoader.loadOvalImage(user?.avatar_url ?? "", width: 100, height: 100, type: ImageClipType.IMAGE_S),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: isVip,
                      child: ImageLoader.loadLocalImage("me/w5exnwacnC_YrfeLsL_imJef_evwiUpX_3spmvajlylo", width: 48, height: 20),
                    ),
                  ),
                ],
              ),
            ),
            AppGap.hGap16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.nick_name ?? "",
                  style: const TextStyle(
                    fontSize: 24,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppGap.vGap2,
                Text(
                  "ID ${user?.ucode ?? ""}",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.white_80p,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppGap.vGap6,
                GestureDetector(
                  onTap: () {
                    PageRouter.pushPage(context, PageRouter.EditUserInfoPage);
                  },
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageLoader.loadLocalImage(
                          "profile/wUejn3aUnA_ergeqsc_Tekd2iNtA_Ppie2ne_3iEcIo4nW",
                          width: 14,
                          height: 14,
                          color: AppColor.white,
                        ),
                        AppGap.hGap2,
                        Text(
                          StringTranslate.e2z(Application.appLocalizations!.wenan_string_edit_info),
                          style: AppTextStyle.white14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _balanceCard() {
    var coins = ref.watch(currUserCoins).value;
    return GestureDetector(
      onTap: () {
        DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_ME_COINS, 1);
        PageRouter.pushPage(context, PageRouter.BalancePage);
      },
      child: Container(
        height: 80,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: UIUtils.subGradient()),
        padding: const EdgeInsetsDirectional.only(start: 24, end: 16),
        child: Row(
          children: [
            ImageLoader.loadLocalImage(
              "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
              width: 44,
              height: 44,
            ),
            AppGap.hGap12,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Utils.parseDouble(coins)?.toInt() ?? "--"}",
                    style: AppTextStyle.style(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColor.b1,
                    ),
                  ),
                  Text(
                    StringTranslate.e2z(Application.appLocalizations!.wenan_string_my_coins),
                    style: AppTextStyle.style(
                      fontSize: 12,
                      color: AppColor.black_60p,
                      height: 1.1,
                    ),
                  )
                ],
              ),
            ),
            AppGap.hGap12,
            ImageLoader.loadLocalImage(
              isAr ? "wBe7niaknw_TrPersA_midcA_ca5rvrkomwQ_mbhlOaQcckN_DmjeQ" : "w3evnJaInc_CrIeBsl_RikcW_pa2rOrboBwv_Cb8lfaVc1ke",
              width: 12,
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _functionLayout(CommonUser? user) {
    return Container(
      height: 408,
      padding: const EdgeInsets.all(16),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.all(0),
        children: [
          _funcCard(
            user,
            iconPath: "me/wRejnHa8nA_Lrceksg_lmled_lvKifpK_GipcxoMno",
            titleText: StringTranslate.e2z(Application.appLocalizations!.wenan_string_premium),
            onTap: () {
              DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_ME_VIP, 1);
              PageRouter.pushPage(context, PageRouter.VipPage);
            },
            vip: true,
            infoText: StringTranslate.e2z(Application.appLocalizations!.wenan_string_join_premium),
          ),
          _funcCard(
            user,
            iconPath: "me/wOe6nWaonG_WrkeysW_EmreL_HsQejryvRicc7er",
            titleText: StringTranslate.e2z(Application.appLocalizations!.wenan_string_feedback),
            onTap: () {
              SharedViewLogic.showFeedbackDialog(context);
            },
          ),
          _disturbCard(user),
          _funcCard(
            user,
            iconPath: "me/w5eenKafnM_cr0e8st_AmIeB_tsheUtFt0iXnmgp",
            titleText: StringTranslate.e2z(Application.appLocalizations!.wenan_string_setting),
            onTap: () {
              PageRouter.pushPage(context, PageRouter.SettingPage);
            },
          ),
        ],
      ),
    );
  }

  Widget _funcCard(CommonUser? user, {String iconPath = "", String titleText = "", VoidCallback? onTap, bool vip = false, String infoText = ""}) {
    var vipTitle = "";
    if (vip && user != null && user.isVip()) {
      var vipExpireTime = user.getVipExpireTime();
      vipTitle = StringUtils.getFormatDate(vipExpireTime, formats: StringUtils.FORMAT_DATE5);
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: (MediaQuery.of(context).size.width - 48) / 2,
                padding: EdgeInsets.fromLTRB(16, 16, 16, vip ? 0 : 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColor.white_20p),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageLoader.loadLocalImage(
                      iconPath,
                      width: 44,
                      height: 44,
                    ),
                    Text(
                      titleText,
                      style: vip
                          ? AppTextStyle.style(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: AppColor.white)
                          : AppTextStyle.TextWhite_16_Medium,
                    ),
                    Visibility(
                      visible: vip,
                      child: Text(
                        vipTitle,
                        textAlign: TextAlign.start,
                        style: AppTextStyle.style(fontSize: 12, fontWeight: FontWeight.w500, color: AppColor.white_40p),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 48,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: AppColor.white_30p),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      infoText,
                      style: AppTextStyle.white12_60p,
                    ),
                  ),
                  AppGap.hGap8,
                  ImageLoader.loadLocalImage(
                      isAr ? "me/wxern6a6nV_BrSeisI_kmceu_GimtIePmL_UlWeRfAt2_XamrIrQoNwi" : "me/wPelnha5nf_4rTe2sa_nmcef_XimtGeBm6_ArJimghhMti_bafrBrwo1wb",
                      width: 12,
                      height: 12,
                      color: AppColor.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _disturbCard(CommonUser? user) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.white_20p),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageLoader.loadLocalImage(
            "me/w7ewnfaonR_TrUefss_mmXed_OnVo4_wduiasqtGuqb8",
            width: 44,
            height: 44,
          ),
          Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_do_not_disturb_mode),
            style: AppTextStyle.TextWhite_16_Medium,
          ),
          SizedBox(
            width: 56,
            child: _disturbSwitch(user),
          ),
        ],
      ),
    );
  }

  Widget _disturbSwitch(CommonUser? user) {
    bool isOpen = user?.isDisturb() ?? false;
    return FlutterSwitch(
      value: isOpen,
      width: 56,
      height: 32,
      toggleSize: 32,
      padding: 0,
      activeColor: const Color(0xFF0DCC85),
      toggleBorder: isOpen
          ? Border.all(
              width: 2,
              color: const Color(0xFF0DCC85),
            )
          : null,
      onToggle: (val) {
        _reportDisturb(context, ref, val);
      },
    );
  }

  void _readDisturb(WidgetRef ref, bool disturb) async {
    ref.read(profileVM).disturb(disturb).then((rsp) {
      if (rsp.code == 0) {
        Application.commonUser?.setDisturb(disturb ? 1 : 0);
        ref.read(commonUserNotify.notifier).updateUserInfoDisturb(disturb ? 1 : 0);
      }
    });
  }

  void _reportDisturb(BuildContext context, WidgetRef ref, bool disturb) {
    DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_DISTURB_SWITCH, 1);
    if (disturb) {
      DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_DISTURB_SWITCH_ON, 1);
      SharedViewLogic.showDisturbConfirmDlg(context, okCallBack: () async {
        _readDisturb(ref, disturb);
      });
    } else {
      DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_DISTURB_SWITCH_OFF, 1);
      _readDisturb(ref, disturb);
    }
  }
}
