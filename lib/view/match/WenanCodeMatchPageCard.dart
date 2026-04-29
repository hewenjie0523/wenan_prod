import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pag/pag.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/data/MatchVideoFindItem.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/view/match/WenanMatchVideoView.dart';
import 'package:wenan/StringTranslate.dart';
import '../../base/WenanCodeApplication.dart';
import '../../res/WenanCodestyles.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../call/chat/detail/WenanCodeChatPageStartup.dart';
import '../call/chat/mediaViewer/WenanCodeMediaVideoViewer.dart';
import '../profile/WenanCodepay_handler.dart';

class MatchPageCard extends StatefulWidget {
  final MatchVideoFindItem item;

  const MatchPageCard({super.key, required this.item});

  @override
  State<MatchPageCard> createState() => _MatchPageCardState();
}

class _MatchPageCardState extends State<MatchPageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: AppColor.white),
      child: Stack(
        children: [
          ImageLoader.loadRoundCornerImage(
              widget.item.user!.avatar_url ?? "", const BorderRadius.all(Radius.circular(40)),
              fit: BoxFit.cover, type: ImageClipType.IMAGE_L),
          Positioned(
              top: 16,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      UIUtils.onlineStatusWidget(context, widget.item.user!.uid ?? 0),
                      AppGap.vGap12,
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 210,
                        child: Text(
                          widget.item.user!.nick_name ?? "",
                          style: AppTextStyle.style(color: AppColor.white, fontSize: 24, fontWeight: FontWeight.w600),
                          maxLines: 4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      AppGap.vGap4,
                      AppConfig.showUserChatPrice(widget.item.user!.chatPrice())
                          ? SizedBox(
                              height: 28,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.item.user!.chatPrice()}',
                                    style: AppTextStyle.TextWhite_14,
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  ImageLoader.loadLocalImage(
                                      "discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM",
                                      width: 18,
                                      height: 18,
                                      fit: BoxFit.contain),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '/${StringTranslate.e2z(Application.appLocalizations!.wenan_string_min)}',
                                    style: AppTextStyle.TextWhite_14,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                  widget.item!.video == null
                      ? const SizedBox()
                      : Stack(
                          children: [
                            Container(
                              width: 112,
                              height: 170,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColor.white,
                                  border: Border.all(color: AppColor.white, width: 4)),
                              clipBehavior: Clip.antiAlias,
                              child: Center(
                                child: MatchBgVideoView(
                                  netPath: widget.item!.video!.video_url!,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 12,
                                right: 12,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  child: ImageLoader.loadLocalImage(
                                      'match/woe7n1a4nz_srEeesg_gdMizsFceoGvTeJrt_sckasrcdm_Bm6uJtXe7'),
                                ))
                          ],
                        )
                ],
              )),
          Positioned(
              bottom: 20,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        ChatPageStartup.open(context, uid: widget.item.user!.uid);
                      },
                      child: ImageLoader.loadLocalImage(
                          'match/wGe6nUaFnc_drjeRsP_8dFiRs4cboQvreErQ_LctazrHdH_0mrejsPsFa3gTeU',
                          width: 56,
                          height: 56)),
                  GestureDetector(
                    onTap: () {
                      PageRouter.startChatCall(context, widget.item.user!, PayFromType.FROM_PROFILE_VIDEO_CALL);
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF6DAAFF), Color(0xFF3933DF)]),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColor.black_10p, width: 1)),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: SVGASimpleImage(assetsName: "assets/animes/w6eMnFafnG_dcDaIlqlR_VbmuvtLtRo9nP.svga"),
                          ),
                          Text(
                            StringTranslate.e2z(Application.appLocalizations!.wenan_string_call_me),
                            style: AppTextStyle.style(color: AppColor.white, fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
