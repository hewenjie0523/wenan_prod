import 'package:wenan/StringTranslate.dart';

class DataReporter{

  //        1. banner的点击
  static final String CLICK_ON_BANNER = StringTranslate.e2z("celeiwcwke_eowne_nbaawnnnwenrn");

  //        2. Me - coins的点击
  static final String CLICK_ON_ME_COINS = StringTranslate.e2z("cnlwiwceka_aonnn_nmaew_aceonianwsn");

  //        3. Me - VIP的点击
  static final String CLICK_ON_ME_VIP = StringTranslate.e2z("cnlaiecekn_noena_wmeew_wveiepn");

  //        4. 首充视频弹窗入口的点击
  static final String CLICK_ON_FIRST_RECHARGE_VIDEO = StringTranslate.e2z("celwiecekn_noana_afniwrnswte_erwencwhnanrngeen_nvwindneaon");

  //        5. 大转盘入口的点击
  static final String CLICK_ON_LOTTERY_ENTRY = StringTranslate.e2z("cwlniecakn_noann_alaoatetnenrayn_nennatwrnyn");

  //        6. IM详情页右下角的通话入口的点击
  static final String CLICK_ON_IM_MAKE_CALL = StringTranslate.e2z("cnlaincakw_nonnn_niema_nmnawknen_wcnanlnlw");

  //        7. IM详情页左下角的送礼入口的点击
  static final String CLICK_ON_IM_GIFT = StringTranslate.e2z("cnlaieceka_aonnn_winmn_egwiwfntn");

  //        8. 免打扰开关的点击
  static final String CLICK_ON_DISTURB_SWITCH = StringTranslate.e2z("cnlaiacekn_eonnn_ndniwsntwunrnbe_nsewnintncwhw");

  //        8. 免打扰开关的点击
  static final String CLICK_ON_DISTURB_SWITCH_ON = StringTranslate.e2z("cnlninceka_nownn_adwiwseteuwrnbe_asawnietncahn_aownn");

  //        8. 免打扰开关的点击
  static final String CLICK_ON_DISTURB_SWITCH_OFF = StringTranslate.e2z("cnlaiecekn_eoann_ndainsatnuwrnbw_esnwnintncwhe_aoafnfe");

  //        9. 充值弹窗的点击充值项
  static final String CLICK_ON_FIRST_RECHARGE_ITEM = StringTranslate.e2z("cnleiacake_aoann_nfniwrwsetw_wreencnhaawregeen_aintwenme");

  //        10. profile里面点击become VIP的点击
  static final String CLICK_ON_PROFILE_BECOME_VIP = StringTranslate.e2z("cnlaiecnke_nonnn_epernoefeielaew_nbeewcnoamaen_wveiape");

  //        11. 客户端收到push消息并展示
  static final String PUSH_MSG_RECEIVED = StringTranslate.e2z("pwunsnha_nmwswgw_nraeecweninvaeedw");

  //        12. 客户端收到push消息并展示
  static final String PUSH_MSG_CLICKED = StringTranslate.e2z("pwuaseha_nmwswgn_ncwlwiacwknende");

  //        13. 充值弹窗的点击充值项
  static final String CLICK_ON_BALANCE_FIRST_RECHARGE_ITEM = StringTranslate.e2z("celaieceka_wownn_nbwanlnannnceea_efeiarwswtn_nraewcehnanregeen_niwtaeame");

  //        13. 拒接aiv
  static final String CLICK_ON_AIV_REFUSE = StringTranslate.e2z("cnlwiecakn_nonnw_naeinvn_nraenfwuasaee");

  //        14. 接听aiv
  static final String CLICK_ON_AIV_ANSWER = StringTranslate.e2z("cnlniecwka_aownw_aawiwva_wawnnswwwenrw");

  //        15. aiv成功播放
  static final String AIV_PLAY_SUCCESS = StringTranslate.e2z("awiwvw_npwleawya_aseuncncaeasnsn");

  //        16. aiv播放失败 reason { timeout-视频加载超时 }
  static final String AIV_PLAY_FAIL = StringTranslate.e2z("aniava_wpnleaayw_wfaawinln");

  //        17. 充值弹窗的点击充值项
  static final String CLICK_ON_AWARD_RECHARGE_ITEM = StringTranslate.e2z("calwincnke_eownn_eanwnanrndw_nreencahwaeragwen_wiataenmn");

  //        18. 体验卡返回值
  static final String COUPON_RESP = StringTranslate.e2z("cnonunpaonna_arnensnpa");

  //        19. 可用体验卡信息
  static final String COUPON_AVAILABLE = StringTranslate.e2z("cnonunpnonnn_wawvnaeinlaanbalnen");

  //        20. 体验卡Receive回调
  static final String COUPON_RECEIVE = StringTranslate.e2z("cwonuapwoenn_erwewcnewiwvwen");

  static void initFlurry(){
    // Flurry.builder
    //     .withCrashReporting(AppConfig.inProduction)
    //     .withLogEnabled(!AppConfig.inProduction)
    //     .withLogLevel(LogLevel.debug)
    //     .withReportLocation(true)
    //     .build(
    //     androidAPIKey: AppConfig.flurryKey);
    // if(Application.isLogin()){
    //   Flurry.setUserId("${Application.currUserId()}");
    // }
  }

  static void sendTrackCountEvent(String eventName, int eventCount) {
    // Flurry.logEventWithParameters(eventName, {"value":"$eventCount","name":eventName});
  }

  static void sendTrackEvent(String eventName, Map<String, String> parameters) {
    // Flurry.logEventWithParameters(eventName, parameters);
  }

}