
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:wenan/StringTranslate.dart';
import '../../../res/WenanCodecolors.dart';
import '../../../res/WenanCodegaps.dart';
import '../../../res/WenanCodestyles.dart';
import '../../../utils/WenanCodeimage_loader.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

class VipFuctionHeaderView extends StatelessWidget {
  final double height;
  VipFuctionHeaderView({Key? key, this.height = 200}) : super(key: key);
  List<String> images = [
    "me/wGerniaSnj_grDecsW_1v6itp2_XhEeMaEdjeOrL_9imcaoQnn1x",
    "me/wxeQnJaQnV_Arye1sb_dvCihpC_ehFe5a0dCeVrw_SiLcvoZn22Q",
    "me/wWeyngafnS_jrJensk_CvQiapH_jhveoakdSetrq_pivcRoanA3f",
    "me/waeKn0afn4_lrhessF_BvuiBpq_KhgeqaLdCexrN_ki7c8ounG4O",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                    child: ImageLoader.loadLocalImage(
                  images[index],
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                )),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: _textView(context, index),
                )
              ],
            ),
          );
        },
        autoplay: true,
        itemCount: 4,
        duration: 300,
        scrollDirection: Axis.horizontal,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            activeColor: Color(0xFFCA87FF),
            color: Color(0x33CA87FF),
          ),
        ),
      ),
    );
  }

  _textView(BuildContext context, int index) {
    List<String> title = [
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title1),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title2),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title3),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title4)
    ];
    List<String> desc = [
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_desc1),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_desc2),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_desc3),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_desc4)
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title[index],
          style: AppTextStyle.style(
            color: AppColor.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
        AppGap.vGap4,
        Text(
          desc[index],
          style: AppTextStyle.TextWhite_12,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}


class VipPopFuctionHeaderView extends StatelessWidget {
  final int page;
  VipPopFuctionHeaderView({Key? key, required this.page}) : super(key: key);
  List<String> images = [
    "me/wGerniaSnj_grDecsW_1v6itp2_XhEeMaEdjeOrL_9imcaoQnn1x",
    "me/wxeQnJaQnV_Arye1sb_dvCihpC_ehFe5a0dCeVrw_SiLcvoZn22Q",
    "me/wWeyngafnS_jrJensk_CvQiapH_jhveoakdSetrq_pivcRoanA3f",
    "me/waeKn0afn4_lrhessF_BvuiBpq_KhgeqaLdCexrN_ki7c8ounG4O",
  ];

  @override
  Widget build(BuildContext context) {
    double height = 92;

    List<String> title = [
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title1),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title2),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title3),
      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_vip_header_title4)
    ];

    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width/2 - 48,
          padding: const EdgeInsets.only(left: 8, right: 8),
          height: height - 8,
          decoration: const BoxDecoration(
              color: AppColor.white_20p,
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppGap.hGap12,
              ImageLoader.loadLocalImage(images[page],width: 40,height: 40),
              AppGap.hGap5,
              Text(title[page],style: AppTextStyle.white12, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

}
