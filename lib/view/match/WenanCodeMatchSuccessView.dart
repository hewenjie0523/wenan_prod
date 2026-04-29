import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/StringTranslate.dart';
import '../../base/WenanCodeApplication.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../res/WenanCodestyles.dart';

class MatchingSusccessView extends StatefulWidget {
  final CommonUser matchUser;

  const MatchingSusccessView({super.key, required this.matchUser});

  @override
  State<MatchingSusccessView> createState() => _MatchingSusccessViewState();
}

class _MatchingSusccessViewState extends State<MatchingSusccessView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFF1D002A),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: SizedBox(
                height: 400,
                child: ImageLoader.loadLocalImage('match/wje0nsaUn7_oree7sF_Im4adtocFhi_7sIumckcletsusB_WtmoRpr',
                    fit: BoxFit.fill),
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Text(
                StringTranslate.e2z(Application.appLocalizations!.wenan_string_match_successful),
                style: AppTextStyle.style(
                    color: AppColor.white, fontSize: 48, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),
                maxLines: 4,
                textAlign: TextAlign.center,
              )),
          Positioned(
              top: 295,
              child: Column(
                children: [
                  Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(color: AppColor.white, width: 6)),
                      child: Center(
                        child: ImageLoader.loadRoundCornerImage(
                            widget.matchUser.avatar_url ?? "", const BorderRadius.all(Radius.circular(54)),
                            width: 108, height: 108, fit: BoxFit.cover, type: ImageClipType.IMAGE_L),
                      )),
                  AppGap.vGap8,
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Text(
                      widget.matchUser.nick_name ?? "",
                      style: AppTextStyle.style(color: AppColor.white, fontSize: 24, fontWeight: FontWeight.w600),
                      maxLines: 4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppGap.vGap2,
                  Row(
                    children: [
                      ImageLoader.loadOvalImage(widget.matchUser.getCountry()?.icon ?? '',
                          type: ImageClipType.IMAGE_S, width: 12, height: 12),
                      AppGap.hGap5,
                      AppConfig.showUserChatPrice(widget.matchUser.chatPrice())
                          ? SizedBox(
                              height: 14,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.matchUser.chatPrice()}',
                                    style: AppTextStyle.TextWhite_11,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  ImageLoader.loadLocalImage(
                                    "discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM",
                                    width: 12,
                                    height: 12,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '/${StringTranslate.e2z(Application.appLocalizations!.wenan_string_min)}',
                                    style: AppTextStyle.TextWhite_11,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
