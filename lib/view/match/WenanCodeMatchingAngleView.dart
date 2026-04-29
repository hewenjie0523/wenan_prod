import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/data/user/CommonUser.dart';

import '../../base/WenanCodeApplication.dart';
import '../../res/WenanCodecolors.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodeutils.dart';

abstract class MatchingAngleViewListener {
  void onMatchingAngleViewAnimationFinsh(bool succcess);
}

class MatchingAngleView extends StatefulWidget {
  const MatchingAngleView({super.key, required this.matchUser, required this.listener});

  final CommonUser matchUser;
  final MatchingAngleViewListener listener;

  @override
  State<MatchingAngleView> createState() => _MatchingAngleViewState();
}

class _MatchingAngleViewState extends State<MatchingAngleView> {
  late Timer _timer;
  double value = 1.0;

  bool leftSuccess = false;
  bool rightSuccess = false;

  @override
  void initState() {
    // TODO: implement initState

    var leftValue = Random().nextDouble();

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      value = value - 0.005;
      if (leftValue >= value) {
        leftSuccess = true;
        checkMatchStatus();
      }
      if (value < 0) {
        widget.listener.onMatchingAngleViewAnimationFinsh(false);
      } else {
        Utils.callSetStateSafely(this, () {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CommonUser? user = Application.commonUser;

    bool isAr = Application.isARLanguage();

    String heartPath = 'match/wZeen4agnY_srLeWsJ_YmkadtrcWhWibnfgd_ihwezaMrAt9';
    if (leftSuccess && rightSuccess) {
      heartPath = 'match/w4eQnsaInT_srMefsf_hmXaYtdcLhSiEnTgX_ehXeTaMr0tO2U';
    } else if (leftSuccess || rightSuccess) {
      heartPath = 'match/wZe3nLaSnC_lr4e5sp_Im1aBt5cFhTi1nbgj_thSeaasrCtE1j';
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(
              height: 142,
            ),
            Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: AppColor.white, width: 6)),
                child: Center(
                  child: ImageLoader.loadRoundCornerImage(
                      widget.matchUser.avatar_url ?? "",
                      const BorderRadius.all(Radius.circular(54)),
                      width: 108,
                      height: 108,
                      fit: BoxFit.cover,
                      type: ImageClipType.IMAGE_L),
                )),
            Positioned(
                top: 90,
                child: leftSuccess
                    ? ImageLoader.loadLocalImage(
                    isAr ? 'match/wKexnka4nm_Trmersw_LmEaqtbcuhziJn9gr_nainDgheGlW_vrziignhIta_jwoh1iGtVeY' : 'match/wweVnBatnq_br2e7st_mmaaFt9cKhBiJn1gz_LaynYgge2lV_ClBeofPtq_1w8hXictxeB',
                        width: 52,
                        height: 52)
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(26)),
                          ),
                          SizedBox(
                            height: 52,
                            width: 52,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey[200],
                              valueColor: const AlwaysStoppedAnimation(
                                  Color(0xFF4FFFAF)),
                              value: value,
                            ),
                          ),
                          ImageLoader.loadLocalImage(
                              isAr ? 'match/wseOn1awnK_Fr5e0sf_cmCaCtRcmhIi7nIgv_ya6nAgKe8lG_RrSigg3hatF_WbClna3cpk5' : 'match/wQeinaadnm_frzeNs4_umWaTtqc1hziznmgL_Raznug1euli_hlReufdt7_rb4lVaNcBki',
                              width: 39,
                              height: 35),
                        ],
                      )),
          ],
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            const SizedBox(
              height: 110,
            ),
            Positioned(
              top: 50,
              child:
                  ImageLoader.loadLocalImage(heartPath, width: 62, height: 62),
            ),
            ImageLoader.loadLocalImage(
                'match/wxeinUa6nJ_9rFeQsh_nmGaot3c9hJinnWgD_ZaNnziEmjaHihtuotnp_LhpeKaVr7td',
                width: 70,
                height: 71)
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              height: 142,
            ),
            Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(color: AppColor.white, width: 6)),
                child: Center(
                  child: ImageLoader.loadRoundCornerImage(
                      user!.avatar_url ?? "",
                      const BorderRadius.all(Radius.circular(54)),
                      width: 108,
                      height: 108,
                      fit: BoxFit.cover,
                      type: ImageClipType.IMAGE_S),
                )),
            Positioned(
                top: 90,
                child: rightSuccess
                    ? ImageLoader.loadLocalImage(
                    isAr ? 'match/wweVnBatnq_br2e7st_mmaaFt9cKhBiJn1gz_LaynYgge2lV_ClBeofPtq_1w8hXictxeB' : 'match/wKexnka4nm_Trmersw_LmEaqtbcuhziJn9gr_nainDgheGlW_vrziignhIta_jwoh1iGtVeY',
                        width: 52,
                        height: 52)
                    : GestureDetector(
                  onTap: (){
                    rightSuccess = true;
                    Utils.callSetStateSafely(this, () {

                    });
                    checkMatchStatus();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(26)),
                      ),
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey[200],
                          valueColor: const AlwaysStoppedAnimation(
                              Color(0xFF4FFFAF)),
                          value: value,
                        ),
                      ),
                      ImageLoader.loadLocalImage(
                          isAr ? 'match/wQeinaadnm_frzeNs4_umWaTtqc1hziznmgL_Raznug1euli_hlReufdt7_rb4lVaNcBki' : 'match/wseOn1awnK_Fr5e0sf_cmCaCtRcmhIi7nIgv_ya6nAgKe8lG_RrSigg3hatF_WbClna3cpk5',
                          width: 39,
                          height: 35),
                    ],
                  ),
                )),
          ],
        ),
      ],
    );
  }

  checkMatchStatus(){
    if(leftSuccess && rightSuccess){
      _timer?.cancel();
      Future.delayed(const Duration(seconds: 1), () {
        widget.listener.onMatchingAngleViewAnimationFinsh(true);
      });
    }else{

    }
  }

}
