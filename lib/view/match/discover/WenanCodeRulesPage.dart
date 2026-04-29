import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:tapped/tapped.dart';

import '../../../base/WenanCodeApplication.dart';
import '../../../res/WenanCodestyles.dart';
import 'package:wenan/StringTranslate.dart';

class WenanRulesPage extends ConsumerWidget {
  const WenanRulesPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 590,
                          // constraints: const BoxConstraints(minHeight: 475),
                          margin: const EdgeInsets.only(top: 150),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          decoration:  BoxDecoration(
                            gradient: UIUtils.mainGradient(),
                            borderRadius: const BorderRadius.all(Radius.circular(16)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 40,),
                              _rulesTitleText(context),
                              AppGap.vGap6,
                              Text(
                                StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_desc),
                                textAlign: TextAlign.center,
                                style: AppTextStyle.white12Bold,
                              ),
                              AppGap.vGap10,
                              Expanded(
                                child: _rulesListView(context),
                              ),
                              AppGap.vGap5,
                              // _rulesTipText(),
                              AppGap.vGap5,
                              Center(
                                child: Tapped(
                                  onTap: () => FluroRouter.appRouter.pop(context),
                                  child: _rulesAcceptWidget(),
                                ),
                              )
                            ],
                          ),
                        ),
                        _rulesImage()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _rulesListView(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _itemForIndex(context, 0),
          AppGap.hGap4,
          _itemForIndex(context, 1),
          AppGap.hGap4,
          _itemForIndex(context, 2),
          AppGap.hGap4,
          _itemForIndex(context, 3),
        ],
      ),
    );
  }

  _rulesTipText(){
    return Text(
      StringTranslate.e2z(Application.appLocalizations!.wenan_string_greeting_tips),
      textAlign: TextAlign.center,
      style: AppTextStyle.white12,
    );
  }

  _rulesTitleText(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      height: 38,
      child:Align(
        alignment: Alignment.center,
        child: Text(
          StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_title),
          style: const TextStyle(
            fontSize: 22,
            color: AppColor.white,
            fontWeight: FontWeight.bold,
            fontFamily: AppText.fontFamily,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }


  _rulesAcceptWidget(){
    return Container(
        width: 210,
        height: 48,
        decoration: const BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(16)),
            color: AppColor.white
        ),
        child: Center(
          child: Text(
            StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_accept),
            style: AppTextStyle.style(
              color: const Color(0xFF3D3DE1),
              fontSize: 16,
            ),
          ),
        ));
  }

  _rulesImage(){
    return Positioned(
      child: ImageLoader.loadLocalImage('home/wOemnTaInE_Errews5_QrjuFl5eusk_BdLlpgm_ltgo0pO',width: 179,height: 260),);
  }

  _itemForIndex(BuildContext context ,int index){
    var itemTitles = [
      StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_item1),
      StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_item2),
      StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_item3),
      StringTranslate.e2z(Application.appLocalizations!.wenan_string_rules_item4)
    ];

    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 56,
      decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppGap.hGap12,
          ImageLoader.loadLocalImage('home/w4eonEagn7_vrBe8ss_SrZuqlNemsJ_1dflKgg_Ui3cIo0no',width: 16 ,height: 16),
          AppGap.hGap8,
          SizedBox(
            width: MediaQuery.of(context).size.width - 88 - 60,
            child: _itemForIndexText(itemTitles[index])
          )
        ],
      ),
    );

  }

  _itemForIndexText(String text){
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: AppColor.black,
        fontFamily: AppText.fontFamily,
        decoration: TextDecoration.none,
      ),
      maxLines: 2,
    );
  }

}
