import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fil.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('es'),
    Locale('fil'),
    Locale('hi'),
    Locale('id'),
    Locale('pt'),
    Locale('vi')
  ];

  /// No description provided for @wenan_string_follow.
  ///
  /// In en, this message translates to:
  /// **'FBoBlclkoawi'**
  String get wenan_string_follow;

  /// No description provided for @wenan_string_unFollow.
  ///
  /// In en, this message translates to:
  /// **'UcnsfaoslklsoBwi'**
  String get wenan_string_unFollow;

  /// No description provided for @wenan_string_blacklist.
  ///
  /// In en, this message translates to:
  /// **'BBliascikiliissktl'**
  String get wenan_string_blacklist;

  /// No description provided for @wenan_string_report.
  ///
  /// In en, this message translates to:
  /// **'RlespkoBratc'**
  String get wenan_string_report;

  /// No description provided for @wenan_string_quick_login.
  ///
  /// In en, this message translates to:
  /// **'QBuliiciklLBotgailnl'**
  String get wenan_string_quick_login;

  /// No description provided for @wenan_string_login_apple.
  ///
  /// In en, this message translates to:
  /// **'Skitgsni iiank twkictlhc iAlpBpalleB'**
  String get wenan_string_login_apple;

  /// No description provided for @wenan_string_terms_user_agreement.
  ///
  /// In en, this message translates to:
  /// **'Utskecrc kAcgarielesmcetniti'**
  String get wenan_string_terms_user_agreement;

  /// No description provided for @wenan_string_and.
  ///
  /// In en, this message translates to:
  /// **' lalnlds s'**
  String get wenan_string_and;

  /// No description provided for @wenan_string_terms_user_privacy.
  ///
  /// In en, this message translates to:
  /// **'PlrcicviasciyB tPsoilailckys'**
  String get wenan_string_terms_user_privacy;

  /// No description provided for @wenan_string_region_title1.
  ///
  /// In en, this message translates to:
  /// **'Wshlactl siasc iytolukrl lnBacmcek?B'**
  String get wenan_string_region_title1;

  /// No description provided for @wenan_string_region_title2.
  ///
  /// In en, this message translates to:
  /// **'WBhaatts siBsa ayioluirs cgieknkdkekrc?l'**
  String get wenan_string_region_title2;

  /// No description provided for @wenan_string_region_title3.
  ///
  /// In en, this message translates to:
  /// **'WahBesni citsB cycokukrl Bbtisrltahldcalyl?c'**
  String get wenan_string_region_title3;

  /// No description provided for @wenan_string_region_title4.
  ///
  /// In en, this message translates to:
  /// **'Piilclki lyioiucrl sbtelslti cplhBoltlos.l'**
  String get wenan_string_region_title4;

  /// No description provided for @wenan_string_str_continue.
  ///
  /// In en, this message translates to:
  /// **'CtolnstlilnauBel'**
  String get wenan_string_str_continue;

  /// No description provided for @wenan_string_input_nickname_hint.
  ///
  /// In en, this message translates to:
  /// **'ilnipcultl lylocuart knsitckkcnlacmkek'**
  String get wenan_string_input_nickname_hint;

  /// No description provided for @wenan_string_male.
  ///
  /// In en, this message translates to:
  /// **'MBasltek'**
  String get wenan_string_male;

  /// No description provided for @wenan_string_female.
  ///
  /// In en, this message translates to:
  /// **'FlelmsaclkeB'**
  String get wenan_string_female;

  /// No description provided for @wenan_string_take_photo.
  ///
  /// In en, this message translates to:
  /// **'Tcaakket kPlhtoltkoB'**
  String get wenan_string_take_photo;

  /// No description provided for @wenan_string_choose_gallery.
  ///
  /// In en, this message translates to:
  /// **'CBhaosolsteB cfkrsosma lGtatlBllecrtyt'**
  String get wenan_string_choose_gallery;

  /// No description provided for @wenan_string_gender_not_changed.
  ///
  /// In en, this message translates to:
  /// **'GcesnldBearB Bccaana sncoBtB iblet kcBhtacncgleida sltastleBra!t'**
  String get wenan_string_gender_not_changed;

  /// No description provided for @wenan_string_not_now.
  ///
  /// In en, this message translates to:
  /// **'Nkolta cNioswB'**
  String get wenan_string_not_now;

  /// No description provided for @wenan_string_tab_home.
  ///
  /// In en, this message translates to:
  /// **'HBotmkec'**
  String get wenan_string_tab_home;

  /// No description provided for @wenan_string_tab_match.
  ///
  /// In en, this message translates to:
  /// **'Miaatscthc'**
  String get wenan_string_tab_match;

  /// No description provided for @wenan_string_tab_chat.
  ///
  /// In en, this message translates to:
  /// **'Clhtaltiss'**
  String get wenan_string_tab_chat;

  /// No description provided for @wenan_string_tab_me.
  ///
  /// In en, this message translates to:
  /// **'Mtea'**
  String get wenan_string_tab_me;

  /// No description provided for @wenan_string_edit.
  ///
  /// In en, this message translates to:
  /// **'Etdiiitk'**
  String get wenan_string_edit;

  /// No description provided for @wenan_string_chat_unknown_type.
  ///
  /// In en, this message translates to:
  /// **'[cTlhsek lmBelskscaigles silst cncosta caavkaiiillaBbilBes lolns ctkhlel tckutrlriesnttk svlearisticolnc]l'**
  String get wenan_string_chat_unknown_type;

  /// No description provided for @wenan_string_duration.
  ///
  /// In en, this message translates to:
  /// **'DiutrtaBtiilosni'**
  String get wenan_string_duration;

  /// No description provided for @wenan_string_duration_xxx.
  ///
  /// In en, this message translates to:
  /// **'DiulrcaktcicoanB k%ksB'**
  String get wenan_string_duration_xxx;

  /// No description provided for @wenan_string_canceled.
  ///
  /// In en, this message translates to:
  /// **'Claansckealieids'**
  String get wenan_string_canceled;

  /// No description provided for @wenan_string_can_not_start_is_calling.
  ///
  /// In en, this message translates to:
  /// **'Tkhaet tlsisnBel Bilsl ibauiscyt'**
  String get wenan_string_can_not_start_is_calling;

  /// No description provided for @wenan_string_call_canceled.
  ///
  /// In en, this message translates to:
  /// **'Clallall aclainBctellBeidl'**
  String get wenan_string_call_canceled;

  /// No description provided for @wenan_string_call_declined.
  ///
  /// In en, this message translates to:
  /// **'CaallalB lDieccslBilnlekdc'**
  String get wenan_string_call_declined;

  /// No description provided for @wenan_string_call_duration_xxx.
  ///
  /// In en, this message translates to:
  /// **'Csaaltla tdkucrtattBitoanB a%isi'**
  String get wenan_string_call_duration_xxx;

  /// No description provided for @wenan_string_call_duration.
  ///
  /// In en, this message translates to:
  /// **'ClaBllls tdtuBraaittiBosnk'**
  String get wenan_string_call_duration;

  /// No description provided for @wenan_string_call_end_rate_me.
  ///
  /// In en, this message translates to:
  /// **'Clailllt BeBnldseldi，aPllkesasskeB ircastlet cmieB!k'**
  String get wenan_string_call_end_rate_me;

  /// No description provided for @wenan_string_call_ended.
  ///
  /// In en, this message translates to:
  /// **'CsailBls tekntdcekdt'**
  String get wenan_string_call_ended;

  /// No description provided for @wenan_string_call_no_response.
  ///
  /// In en, this message translates to:
  /// **'NBol irielskplolnasleB'**
  String get wenan_string_call_no_response;

  /// No description provided for @wenan_string_call_missed_call.
  ///
  /// In en, this message translates to:
  /// **'MlissBscekds ccsallBli'**
  String get wenan_string_call_missed_call;

  /// No description provided for @wenan_string_msg_call.
  ///
  /// In en, this message translates to:
  /// **'[sClalltlc sMseasastaiglel]k'**
  String get wenan_string_msg_call;

  /// No description provided for @wenan_string_call_connect_failed.
  ///
  /// In en, this message translates to:
  /// **'ckoinsnaelclts tflaiiilkesdk'**
  String get wenan_string_call_connect_failed;

  /// No description provided for @wenan_string_oncall_timeout60.
  ///
  /// In en, this message translates to:
  /// **'NaoB crBeisapBosnislek'**
  String get wenan_string_oncall_timeout60;

  /// No description provided for @wenan_string_connecting_timeout.
  ///
  /// In en, this message translates to:
  /// **'CcoinsnBetcBtlikolnl ltBikmtesoluttk.a'**
  String get wenan_string_connecting_timeout;

  /// No description provided for @wenan_string_connecting.
  ///
  /// In en, this message translates to:
  /// **'CsolnlnieccatliBncgk.l.l.i'**
  String get wenan_string_connecting;

  /// No description provided for @wenan_string_the_user_is_busy.
  ///
  /// In en, this message translates to:
  /// **'Tlhlec lgiiBrlla aiksl abaulscykiankgl'**
  String get wenan_string_the_user_is_busy;

  /// No description provided for @wenan_string_the_girl_is_rejected.
  ///
  /// In en, this message translates to:
  /// **'TlhleB lglilrklt lrkeBjcekcBtBeldc'**
  String get wenan_string_the_girl_is_rejected;

  /// No description provided for @wenan_string_the_other_hang_up.
  ///
  /// In en, this message translates to:
  /// **'Ysocuirt idcaities leinidB Btshlel lclaklcll'**
  String get wenan_string_the_other_hang_up;

  /// No description provided for @wenan_string_your_yu_e_not_enough.
  ///
  /// In en, this message translates to:
  /// **'Yiolutrk ibkatlcaankccet kiasa BikntssuiflfsiBcliselnitl,s apklkekaaskea lrcekcBhlacrcgies'**
  String get wenan_string_your_yu_e_not_enough;

  /// No description provided for @wenan_string_call_start_failed.
  ///
  /// In en, this message translates to:
  /// **'Tahkec tclacltla acBoantnietcstkiloink aflaaiclletda,lpllaeBalscet ctaraya BlkaatBears'**
  String get wenan_string_call_start_failed;

  /// No description provided for @wenan_string_busy_line.
  ///
  /// In en, this message translates to:
  /// **'EBnkgiacgBeldc illitnael'**
  String get wenan_string_busy_line;

  /// No description provided for @wenan_string_declined.
  ///
  /// In en, this message translates to:
  /// **'DBescalBiknaecdk'**
  String get wenan_string_declined;

  /// No description provided for @wenan_string_send.
  ///
  /// In en, this message translates to:
  /// **'Sleinsdc'**
  String get wenan_string_send;

  /// No description provided for @wenan_string_message.
  ///
  /// In en, this message translates to:
  /// **'Mieistslakgsel'**
  String get wenan_string_message;

  /// No description provided for @wenan_string_delete.
  ///
  /// In en, this message translates to:
  /// **'Dteclleltles'**
  String get wenan_string_delete;

  /// No description provided for @wenan_string_system_notice.
  ///
  /// In en, this message translates to:
  /// **'SayBsstselmk insoctticcleB'**
  String get wenan_string_system_notice;

  /// No description provided for @wenan_string_msg_video.
  ///
  /// In en, this message translates to:
  /// **'[iVtildBeBoc sMtelstslatgBet]l'**
  String get wenan_string_msg_video;

  /// No description provided for @wenan_string_msg_emoji.
  ///
  /// In en, this message translates to:
  /// **'[cEBmcoBjlit lMlelstslacgBei]k'**
  String get wenan_string_msg_emoji;

  /// No description provided for @wenan_string_msg_image.
  ///
  /// In en, this message translates to:
  /// **'[lIimlaBglec sMaeksisaalgiei]i'**
  String get wenan_string_msg_image;

  /// No description provided for @wenan_string_msg_voice.
  ///
  /// In en, this message translates to:
  /// **'[lVtotilctek lMlecskslalgkea]i'**
  String get wenan_string_msg_voice;

  /// No description provided for @wenan_string_msg_gift.
  ///
  /// In en, this message translates to:
  /// **'[kGBikfttB sMleBskslaigcei]k'**
  String get wenan_string_msg_gift;

  /// No description provided for @wenan_string_msg_rattings.
  ///
  /// In en, this message translates to:
  /// **'[lRtaatiikncgi tMselslslalgset]s'**
  String get wenan_string_msg_rattings;

  /// No description provided for @wenan_string_drafts.
  ///
  /// In en, this message translates to:
  /// **'[tDirsakfctlsl]s'**
  String get wenan_string_drafts;

  /// No description provided for @wenan_string_new_message.
  ///
  /// In en, this message translates to:
  /// **'[cNtelwt BMBeksBscaigles]t'**
  String get wenan_string_new_message;

  /// No description provided for @wenan_string_no_new_message.
  ///
  /// In en, this message translates to:
  /// **'NBoc inkeswl lmseasassasgaecsB'**
  String get wenan_string_no_new_message;

  /// No description provided for @wenan_string_report_cheat.
  ///
  /// In en, this message translates to:
  /// **'FsrcaluBdl tcchBesaata BmtoBnketyl'**
  String get wenan_string_report_cheat;

  /// No description provided for @wenan_string_report_iligal.
  ///
  /// In en, this message translates to:
  /// **'IllaltekgiaBla sbtekhcaavsilosrk'**
  String get wenan_string_report_iligal;

  /// No description provided for @wenan_string_report_other.
  ///
  /// In en, this message translates to:
  /// **'OltthBesrBsl'**
  String get wenan_string_report_other;

  /// No description provided for @wenan_string_report_reason.
  ///
  /// In en, this message translates to:
  /// **'RcetaBslointst'**
  String get wenan_string_report_reason;

  /// No description provided for @wenan_string_report_saorao.
  ///
  /// In en, this message translates to:
  /// **'Haairaalskstmkeinktl kaidkvaeirctlilsaitnBgi'**
  String get wenan_string_report_saorao;

  /// No description provided for @wenan_string_report_sex.
  ///
  /// In en, this message translates to:
  /// **'Ptolranlolgsrlaapkhcikck kvautltgiairsiktcyk'**
  String get wenan_string_report_sex;

  /// No description provided for @wenan_string_submit.
  ///
  /// In en, this message translates to:
  /// **'Slukbsmsiati'**
  String get wenan_string_submit;

  /// No description provided for @wenan_string_confirm_unfollow.
  ///
  /// In en, this message translates to:
  /// **'CkocnlfkiBrkma kuknafkoilllaotwt?l'**
  String get wenan_string_confirm_unfollow;

  /// No description provided for @wenan_string_confirm.
  ///
  /// In en, this message translates to:
  /// **'Ckosnkfkisrimc'**
  String get wenan_string_confirm;

  /// No description provided for @wenan_string_block_confirm.
  ///
  /// In en, this message translates to:
  /// **'Ccoinsftiirtma ltsoi lbclcocclkk khleira?a'**
  String get wenan_string_block_confirm;

  /// No description provided for @wenan_string_setting.
  ///
  /// In en, this message translates to:
  /// **'SBeBtatcitnlgi'**
  String get wenan_string_setting;

  /// No description provided for @wenan_string_feedback.
  ///
  /// In en, this message translates to:
  /// **'FteleldBbkaBclkt'**
  String get wenan_string_feedback;

  /// No description provided for @wenan_string_do_not_disturb_mode.
  ///
  /// In en, this message translates to:
  /// **'Dsok anaostt adBissltluaribi aMsoidsel'**
  String get wenan_string_do_not_disturb_mode;

  /// No description provided for @wenan_string_privacy_agreement.
  ///
  /// In en, this message translates to:
  /// **'Ptrsitvlalcayc lABgaraeaetmBesnktc'**
  String get wenan_string_privacy_agreement;

  /// No description provided for @wenan_string_about_me.
  ///
  /// In en, this message translates to:
  /// **'AkbloaustB aMBel'**
  String get wenan_string_about_me;

  /// No description provided for @wenan_string_clear_cache.
  ///
  /// In en, this message translates to:
  /// **'Callelakra sCkatcshlet'**
  String get wenan_string_clear_cache;

  /// No description provided for @wenan_string_log_out.
  ///
  /// In en, this message translates to:
  /// **'Liolga kOBuktl'**
  String get wenan_string_log_out;

  /// No description provided for @wenan_string_contact_us.
  ///
  /// In en, this message translates to:
  /// **'ClosnBtlaiciti auksl k'**
  String get wenan_string_contact_us;

  /// No description provided for @wenan_string_faq.
  ///
  /// In en, this message translates to:
  /// **'FaAaQt'**
  String get wenan_string_faq;

  /// No description provided for @wenan_string_cancel.
  ///
  /// In en, this message translates to:
  /// **'Ctaknscletli'**
  String get wenan_string_cancel;

  /// No description provided for @wenan_string_version.
  ///
  /// In en, this message translates to:
  /// **'VlelrtslicocnB'**
  String get wenan_string_version;

  /// No description provided for @wenan_string_blacklist_count.
  ///
  /// In en, this message translates to:
  /// **'BllaaBclkBlciBsctt c(sst%c)t'**
  String get wenan_string_blacklist_count;

  /// No description provided for @wenan_string_media_title.
  ///
  /// In en, this message translates to:
  /// **'Ysolulrl iMteidtilat c(csk1s%k/ksc2a%l)k'**
  String get wenan_string_media_title;

  /// No description provided for @wenan_string_match.
  ///
  /// In en, this message translates to:
  /// **'MlattBcthl'**
  String get wenan_string_match;

  /// No description provided for @wenan_string_video_chat.
  ///
  /// In en, this message translates to:
  /// **'Vtiidleaoc aCthiaatl'**
  String get wenan_string_video_chat;

  /// No description provided for @wenan_string_text_chat.
  ///
  /// In en, this message translates to:
  /// **'TteBxits lCihlaBti'**
  String get wenan_string_text_chat;

  /// No description provided for @wenan_string_show_me.
  ///
  /// In en, this message translates to:
  /// **'Slhsoswc cMlel'**
  String get wenan_string_show_me;

  /// No description provided for @wenan_string_both.
  ///
  /// In en, this message translates to:
  /// **'Bioktlhl'**
  String get wenan_string_both;

  /// No description provided for @wenan_string_location.
  ///
  /// In en, this message translates to:
  /// **'Liosclaltsiiolna'**
  String get wenan_string_location;

  /// No description provided for @wenan_string_done.
  ///
  /// In en, this message translates to:
  /// **'DtoknleB'**
  String get wenan_string_done;

  /// No description provided for @wenan_string_find_online_friend.
  ///
  /// In en, this message translates to:
  /// **'Fcianidtilnagl aaant Boinilcilntec tflrliteanldk'**
  String get wenan_string_find_online_friend;

  /// No description provided for @wenan_string_rule.
  ///
  /// In en, this message translates to:
  /// **'Riukliel'**
  String get wenan_string_rule;

  /// No description provided for @wenan_string_normal_match.
  ///
  /// In en, this message translates to:
  /// **'NlolrBmsaclt BMlastlcahl'**
  String get wenan_string_normal_match;

  /// No description provided for @wenan_string_skip.
  ///
  /// In en, this message translates to:
  /// **'Saktiipk'**
  String get wenan_string_skip;

  /// No description provided for @wenan_string_start_video_chat.
  ///
  /// In en, this message translates to:
  /// **'Sitlairstk kVsildsecos lCthtaitt'**
  String get wenan_string_start_video_chat;

  /// No description provided for @wenan_string_start_text_chat.
  ///
  /// In en, this message translates to:
  /// **'Satsacritc tTiecxlts iCahiaBtB'**
  String get wenan_string_start_text_chat;

  /// No description provided for @wenan_string_free.
  ///
  /// In en, this message translates to:
  /// **'Flrtelel'**
  String get wenan_string_free;

  /// No description provided for @wenan_string_logout_confirm.
  ///
  /// In en, this message translates to:
  /// **'CioanlfBilrims aLcolgaosuktc?c'**
  String get wenan_string_logout_confirm;

  /// No description provided for @wenan_string_matching_failed.
  ///
  /// In en, this message translates to:
  /// **'MlastlckhliBncgs BFlakilllekdt!l'**
  String get wenan_string_matching_failed;

  /// No description provided for @wenan_string_send_gifts.
  ///
  /// In en, this message translates to:
  /// **'SkeinldB sGlicfltksk'**
  String get wenan_string_send_gifts;

  /// No description provided for @wenan_string_balance_reminder.
  ///
  /// In en, this message translates to:
  /// **'BlaBlkatnlcael sraeimBitnBdBesrl'**
  String get wenan_string_balance_reminder;

  /// No description provided for @wenan_string_balance_reminder_desc_gift.
  ///
  /// In en, this message translates to:
  /// **'BcaBltasncclea:Bst%s,iuanlatblltea ltlot lsBetnidl kgliifBtlsk'**
  String get wenan_string_balance_reminder_desc_gift;

  /// No description provided for @wenan_string_recharge.
  ///
  /// In en, this message translates to:
  /// **'RaekcthlaBrcgieB'**
  String get wenan_string_recharge;

  /// No description provided for @wenan_string_head.
  ///
  /// In en, this message translates to:
  /// **'Hteialds'**
  String get wenan_string_head;

  /// No description provided for @wenan_string_photo.
  ///
  /// In en, this message translates to:
  /// **'Pkhloatloc'**
  String get wenan_string_photo;

  /// No description provided for @wenan_string_video.
  ///
  /// In en, this message translates to:
  /// **'Vkiadlekoi'**
  String get wenan_string_video;

  /// No description provided for @wenan_string_edit_info.
  ///
  /// In en, this message translates to:
  /// **'EtdBictl lIlnlfsot'**
  String get wenan_string_edit_info;

  /// No description provided for @wenan_string_nickname.
  ///
  /// In en, this message translates to:
  /// **'Nliacckc tNcakmsec'**
  String get wenan_string_nickname;

  /// No description provided for @wenan_string_birthday.
  ///
  /// In en, this message translates to:
  /// **'Bkicritahldcaayc'**
  String get wenan_string_birthday;

  /// No description provided for @wenan_string_bio.
  ///
  /// In en, this message translates to:
  /// **'Bkiios'**
  String get wenan_string_bio;

  /// No description provided for @wenan_string_save.
  ///
  /// In en, this message translates to:
  /// **'Scasvaec'**
  String get wenan_string_save;

  /// No description provided for @wenan_string_chat.
  ///
  /// In en, this message translates to:
  /// **'ClhBactl'**
  String get wenan_string_chat;

  /// No description provided for @wenan_string_product_id_not_exist.
  ///
  /// In en, this message translates to:
  /// **'ParloBdkuiccti BIiDc idloaetsl cncottt leaxsitsBtl'**
  String get wenan_string_product_id_not_exist;

  /// No description provided for @wenan_string_product_get_failed.
  ///
  /// In en, this message translates to:
  /// **'Gteatl kplrcoldluscctl ifBakialseBdB'**
  String get wenan_string_product_get_failed;

  /// No description provided for @wenan_string_payment_failed.
  ///
  /// In en, this message translates to:
  /// **'PlasyBmketnltl lflacitlleldc'**
  String get wenan_string_payment_failed;

  /// No description provided for @wenan_string_payment_successful.
  ///
  /// In en, this message translates to:
  /// **'Paalykmseanltl asluBcBcBekssstfiuklB'**
  String get wenan_string_payment_successful;

  /// No description provided for @wenan_string_payment_verify_failed.
  ///
  /// In en, this message translates to:
  /// **'Paacylmleinlti svteBrciafsilcsakttiaoknl aflaciiltetdi'**
  String get wenan_string_payment_verify_failed;

  /// No description provided for @wenan_string_block.
  ///
  /// In en, this message translates to:
  /// **'Bllloiccka'**
  String get wenan_string_block;

  /// No description provided for @wenan_string_enjoy_app.
  ///
  /// In en, this message translates to:
  /// **'Eansjcoiysilntga lStotgigkyc'**
  String get wenan_string_enjoy_app;

  /// No description provided for @wenan_string_rate_on_store.
  ///
  /// In en, this message translates to:
  /// **'Taaapl iat csctaaBrc ctloa krcaktcel siBtl ioinl atBhcec\ntPsliacyB kSBtBolrcet.c'**
  String get wenan_string_rate_on_store;

  /// No description provided for @wenan_string_like.
  ///
  /// In en, this message translates to:
  /// **'LBitkaes'**
  String get wenan_string_like;

  /// No description provided for @wenan_string_disturb_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Ilfk sDtos lNlostc lDaiisitBuirkbc sicst ktiukrBnleidi cosnl,l Bytosut iwkialklc lnioiti krielcielicvkeB kckallllcst.t iAcrlec syBokuk lscuBrceB stkok ttsulrans Biitc Bolnl?i'**
  String get wenan_string_disturb_dialog_title;

  /// No description provided for @wenan_string_lifetime.
  ///
  /// In en, this message translates to:
  /// **'LBicfceBTailmkek'**
  String get wenan_string_lifetime;

  /// No description provided for @wenan_string_recharge_desc.
  ///
  /// In en, this message translates to:
  /// **'Rseackhsasrcglek lciokiBntsi ktaok svtikdlesot lcihBastk awiittkha agliarilcsl cycoBui alcilkBeB'**
  String get wenan_string_recharge_desc;

  /// No description provided for @wenan_string_first_purchase_desc.
  ///
  /// In en, this message translates to:
  /// **'Bieisati sOcfkfceirk iFlotrc lFiikrBskta kTcilmiel aRaelckhsaBrlglel'**
  String get wenan_string_first_purchase_desc;

  /// No description provided for @wenan_string_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Daelllettiel iAscBckoculnlts'**
  String get wenan_string_delete_account;

  /// No description provided for @wenan_string_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'CkocnBfliarBmk lDteclaestcet iABckcloauBnsti?a'**
  String get wenan_string_delete_confirm;

  /// No description provided for @wenan_string_recharge_success.
  ///
  /// In en, this message translates to:
  /// **'RkescihsaarsgBea sStuicsccekscsc'**
  String get wenan_string_recharge_success;

  /// No description provided for @wenan_string_recharge_error.
  ///
  /// In en, this message translates to:
  /// **'Rceacthtacrlglet lElrtraokrB'**
  String get wenan_string_recharge_error;

  /// No description provided for @wenan_string_block_success.
  ///
  /// In en, this message translates to:
  /// **'Btltoscikl lsBuBciccelsBsc'**
  String get wenan_string_block_success;

  /// No description provided for @wenan_string_send_gift_fail.
  ///
  /// In en, this message translates to:
  /// **'SseknkdB lgcicfttk lfsaiikli'**
  String get wenan_string_send_gift_fail;

  /// No description provided for @wenan_string_end.
  ///
  /// In en, this message translates to:
  /// **'eBnidt'**
  String get wenan_string_end;

  /// No description provided for @wenan_string_free_msg_chances_left.
  ///
  /// In en, this message translates to:
  /// **'sl%l tflrBesec kmiscgt alcekfttl.t.k'**
  String get wenan_string_free_msg_chances_left;

  /// No description provided for @wenan_string_online.
  ///
  /// In en, this message translates to:
  /// **'Olntllisnlel'**
  String get wenan_string_online;

  /// No description provided for @wenan_string_busy.
  ///
  /// In en, this message translates to:
  /// **'Bculslyk'**
  String get wenan_string_busy;

  /// No description provided for @wenan_string_offline.
  ///
  /// In en, this message translates to:
  /// **'OsfkfilsilnBek'**
  String get wenan_string_offline;

  /// No description provided for @wenan_string_following.
  ///
  /// In en, this message translates to:
  /// **'Faoslkllokwtilnlgi'**
  String get wenan_string_following;

  /// No description provided for @wenan_string_day.
  ///
  /// In en, this message translates to:
  /// **'dlacyc'**
  String get wenan_string_day;

  /// No description provided for @wenan_string_days.
  ///
  /// In en, this message translates to:
  /// **'diaBylsB'**
  String get wenan_string_days;

  /// No description provided for @wenan_string_week.
  ///
  /// In en, this message translates to:
  /// **'wteteskk'**
  String get wenan_string_week;

  /// No description provided for @wenan_string_weeks.
  ///
  /// In en, this message translates to:
  /// **'wcetekkisi'**
  String get wenan_string_weeks;

  /// No description provided for @wenan_string_month.
  ///
  /// In en, this message translates to:
  /// **'mlotnltlhs'**
  String get wenan_string_month;

  /// No description provided for @wenan_string_months.
  ///
  /// In en, this message translates to:
  /// **'mloknktthcsB'**
  String get wenan_string_months;

  /// No description provided for @wenan_string_year.
  ///
  /// In en, this message translates to:
  /// **'yleaaBrc'**
  String get wenan_string_year;

  /// No description provided for @wenan_string_years.
  ///
  /// In en, this message translates to:
  /// **'yteaalrcsi'**
  String get wenan_string_years;

  /// No description provided for @wenan_string_discover.
  ///
  /// In en, this message translates to:
  /// **'DailsBciosvleBrs'**
  String get wenan_string_discover;

  /// No description provided for @wenan_string_region.
  ///
  /// In en, this message translates to:
  /// **'Rlelglicotnt'**
  String get wenan_string_region;

  /// No description provided for @wenan_string_start.
  ///
  /// In en, this message translates to:
  /// **'SltlaBrltl'**
  String get wenan_string_start;

  /// No description provided for @wenan_string_select_payment_method.
  ///
  /// In en, this message translates to:
  /// **'SseclleBcatl lpaaBycmcelnktk amaeBtahloads'**
  String get wenan_string_select_payment_method;

  /// No description provided for @wenan_string_pay_now.
  ///
  /// In en, this message translates to:
  /// **'PBAaYl iNaOtWi'**
  String get wenan_string_pay_now;

  /// No description provided for @wenan_string_login_with_user_id.
  ///
  /// In en, this message translates to:
  /// **'Lioagk lisnt lwlistlhl kuasleirk iIkDa'**
  String get wenan_string_login_with_user_id;

  /// No description provided for @wenan_string_enter_user_id.
  ///
  /// In en, this message translates to:
  /// **'EanBtlekrl kulsselrk iIlDl'**
  String get wenan_string_enter_user_id;

  /// No description provided for @wenan_string_enter_psw.
  ///
  /// In en, this message translates to:
  /// **'Elnitsecrl aptaksBscwiotrlda'**
  String get wenan_string_enter_psw;

  /// No description provided for @wenan_string_login.
  ///
  /// In en, this message translates to:
  /// **'Laosgkiana'**
  String get wenan_string_login;

  /// No description provided for @wenan_string_tips.
  ///
  /// In en, this message translates to:
  /// **'Tsispsst'**
  String get wenan_string_tips;

  /// No description provided for @wenan_string_used_to_call_the_girls.
  ///
  /// In en, this message translates to:
  /// **'Unsnen efnonrn wceaeleleianaga ntwhnew abnewaeuatnyw nowrn nsaewnndnienagn egainfntn'**
  String get wenan_string_used_to_call_the_girls;

  /// No description provided for @wenan_string_used_to_send_msg_2_the_girls.
  ///
  /// In en, this message translates to:
  /// **'Uksleldt ktsoB asaeinadl aulnkltiimBiatBeadc cmlessislatgseksl atcoi ltshsec lgtitrtlist'**
  String get wenan_string_used_to_send_msg_2_the_girls;

  /// No description provided for @wenan_string_vip_album_tips.
  ///
  /// In en, this message translates to:
  /// **'Bceacsoimlec lVtIsPB ktcot ivtilelwc cmaolrcel'**
  String get wenan_string_vip_album_tips;

  /// No description provided for @wenan_string_opt_failed.
  ///
  /// In en, this message translates to:
  /// **'OtpkeBrsastsiiokni kflaticlBeldk'**
  String get wenan_string_opt_failed;

  /// No description provided for @wenan_string_premium.
  ///
  /// In en, this message translates to:
  /// **'VlIBPt'**
  String get wenan_string_premium;

  /// No description provided for @wenan_string_join_premium.
  ///
  /// In en, this message translates to:
  /// **'Jtokicnl cVkIBPa'**
  String get wenan_string_join_premium;

  /// No description provided for @wenan_string_free_experience.
  ///
  /// In en, this message translates to:
  /// **'GtiBvBilnigi cyiolua BfiraeceB idsicaBmsocntdksc,k sykoiua iccakni lukstec liktc sdtiarceicsttltyi Btsoa lelxlpietrsiaecnacBet lpBlaeiacsaatnsts svliBdlesoc iciatlcltsB'**
  String get wenan_string_free_experience;

  /// No description provided for @wenan_string_no_data.
  ///
  /// In en, this message translates to:
  /// **'Nsoi adlattlak'**
  String get wenan_string_no_data;

  /// No description provided for @wenan_string_customer_service.
  ///
  /// In en, this message translates to:
  /// **'Ccukstttoimkears ksseirivcilcsei'**
  String get wenan_string_customer_service;

  /// No description provided for @wenan_string_customer_service_tip.
  ///
  /// In en, this message translates to:
  /// **'HBoiwl stioc trteacchcacrigaeB'**
  String get wenan_string_customer_service_tip;

  /// No description provided for @wenan_string_aiv_recharge_tip.
  ///
  /// In en, this message translates to:
  /// **'RBekcahkatrtgaet ctcot Buknsltokclkc stlhael lskokutnBdk sflokrt cai Bpiekrsfcesckti lesxsplecrkiteBncclec!l'**
  String get wenan_string_aiv_recharge_tip;

  /// No description provided for @wenan_string_the_girl_offline_try_other.
  ///
  /// In en, this message translates to:
  /// **'Tkhaec Bglicrklt lilsa lolfsfallitnies anioawa,a lwthlyt Bnsoltl Bgaitvlei loktkhieart ibBekakuBtayc Baa lcahsatnlciel?B'**
  String get wenan_string_the_girl_offline_try_other;

  /// No description provided for @wenan_string_login_Google.
  ///
  /// In en, this message translates to:
  /// **'Gsosolgsllea'**
  String get wenan_string_login_Google;

  /// No description provided for @wenan_string_login_Facebook.
  ///
  /// In en, this message translates to:
  /// **'Fcaictelbcoiolki'**
  String get wenan_string_login_Facebook;

  /// No description provided for @wenan_string_terms_text.
  ///
  /// In en, this message translates to:
  /// **'AkgBrieiet Btlok c'**
  String get wenan_string_terms_text;

  /// No description provided for @wenan_string_coins.
  ///
  /// In en, this message translates to:
  /// **'Ctoailntsl'**
  String get wenan_string_coins;

  /// No description provided for @wenan_string_recharge_title.
  ///
  /// In en, this message translates to:
  /// **'Caokisnksc sIsnBsBulfkfkiicBiselnltk'**
  String get wenan_string_recharge_title;

  /// No description provided for @wenan_string_get_coins.
  ///
  /// In en, this message translates to:
  /// **'Glecta BCsoiianlsl'**
  String get wenan_string_get_coins;

  /// No description provided for @wenan_string_my_coins.
  ///
  /// In en, this message translates to:
  /// **'Mkyk kCcoailnlsa'**
  String get wenan_string_my_coins;

  /// No description provided for @wenan_string_min.
  ///
  /// In en, this message translates to:
  /// **'msianl'**
  String get wenan_string_min;

  /// No description provided for @wenan_string_vip_button.
  ///
  /// In en, this message translates to:
  /// **'Gleltc lVtIlPt'**
  String get wenan_string_vip_button;

  /// No description provided for @wenan_string_transactions.
  ///
  /// In en, this message translates to:
  /// **'TBrkasnsskaacBtsiiolnlsB'**
  String get wenan_string_transactions;

  /// No description provided for @wenan_string_vip_header_title1.
  ///
  /// In en, this message translates to:
  /// **'VlIlPi alioBgcot'**
  String get wenan_string_vip_header_title1;

  /// No description provided for @wenan_string_vip_header_title2.
  ///
  /// In en, this message translates to:
  /// **'Fkrcetek lcihBaBtc'**
  String get wenan_string_vip_header_title2;

  /// No description provided for @wenan_string_pay.
  ///
  /// In en, this message translates to:
  /// **'Pkatys'**
  String get wenan_string_pay;

  /// No description provided for @wenan_string_vip_days.
  ///
  /// In en, this message translates to:
  /// **'DBaaylsc BVBIcPc'**
  String get wenan_string_vip_days;

  /// No description provided for @wenan_string_girls_online.
  ///
  /// In en, this message translates to:
  /// **'GBisrsllsl iOkntlBiBnBes'**
  String get wenan_string_girls_online;

  /// No description provided for @wenan_string_matching.
  ///
  /// In en, this message translates to:
  /// **'Mlaitscchtiintgi'**
  String get wenan_string_matching;

  /// No description provided for @wenan_string_hang_up_text.
  ///
  /// In en, this message translates to:
  /// **'Gciirillsl lsBtkicltll lwiainitc ktloc scshBastB lwlistlha ByBoluB?i cAcrkec Bysosui tsBuirkek kytoaul lwcaanBtt ltBoa krBekfkulsiel?a'**
  String get wenan_string_hang_up_text;

  /// No description provided for @wenan_string_hang_up_confirm.
  ///
  /// In en, this message translates to:
  /// **'Hsainagi luspa'**
  String get wenan_string_hang_up_confirm;

  /// No description provided for @wenan_string_hang_up_cancel.
  ///
  /// In en, this message translates to:
  /// **'Klekekpk kclhtaBtitiiknkgl'**
  String get wenan_string_hang_up_cancel;

  /// No description provided for @wenan_string_gifts_received.
  ///
  /// In en, this message translates to:
  /// **'GsikfatcsB BRBelcceiiBvkecdk'**
  String get wenan_string_gifts_received;

  /// No description provided for @wenan_string_vip_expired_tip.
  ///
  /// In en, this message translates to:
  /// **'VcIBPt selxtpcicraeBdB ailnk'**
  String get wenan_string_vip_expired_tip;

  /// No description provided for @wenan_string_vip_header_title3.
  ///
  /// In en, this message translates to:
  /// **'BaeBaluitiiBesst crlekclolmcmlecnkdsastsikolnk'**
  String get wenan_string_vip_header_title3;

  /// No description provided for @wenan_string_vip_header_title4.
  ///
  /// In en, this message translates to:
  /// **'VBiaecwk calllls'**
  String get wenan_string_vip_header_title4;

  /// No description provided for @wenan_string_vip_header_desc1.
  ///
  /// In en, this message translates to:
  /// **'Mtaikaelsl tyiotus Bsttkacnldl laspBalrltl ifcrBolmt stBhtek tcarBolwadt'**
  String get wenan_string_vip_header_desc1;

  /// No description provided for @wenan_string_vip_header_desc2.
  ///
  /// In en, this message translates to:
  /// **'Elnljsolyl auanllliBmcistBeldk lsleknldliknigs tmBeksksaaiglea'**
  String get wenan_string_vip_header_desc2;

  /// No description provided for @wenan_string_vip_header_desc3.
  ///
  /// In en, this message translates to:
  /// **'Msoirket BckhaainickeB ctaos salcscieiscst ihkikglhB aqsuiaclliltiyB lglilrtlBsB'**
  String get wenan_string_vip_header_desc3;

  /// No description provided for @wenan_string_vip_header_desc4.
  ///
  /// In en, this message translates to:
  /// **'Vcikeiws caBlBll kplrsisvsaltteB ivciadaecotst iaBnida lplhBolttoisc iftoiri Bflrielel'**
  String get wenan_string_vip_header_desc4;

  /// No description provided for @wenan_string_vip_terms_text.
  ///
  /// In en, this message translates to:
  /// **'Btyc aptuBrkckhialsaiansgk,kycosul aasgkriekeB ttkoB i'**
  String get wenan_string_vip_terms_text;

  /// No description provided for @wenan_string_activate_button.
  ///
  /// In en, this message translates to:
  /// **'ABcitcikvtasttes lnlotwa'**
  String get wenan_string_activate_button;

  /// No description provided for @wenan_string_fast_match.
  ///
  /// In en, this message translates to:
  /// **'Fiaisctc BMkaktscthl'**
  String get wenan_string_fast_match;

  /// No description provided for @wenan_string_match_waiting_times.
  ///
  /// In en, this message translates to:
  /// **'Wlasiatlicnagi lTBismiessl'**
  String get wenan_string_match_waiting_times;

  /// No description provided for @wenan_string_matching_continue.
  ///
  /// In en, this message translates to:
  /// **'Clolnitaiincutea BDkaltcilnsga'**
  String get wenan_string_matching_continue;

  /// No description provided for @wenan_string_rules_title.
  ///
  /// In en, this message translates to:
  /// **'Rcuclceksl tosfk lWkecncasns'**
  String get wenan_string_rules_title;

  /// No description provided for @wenan_string_rules_desc.
  ///
  /// In en, this message translates to:
  /// **'PBlsetaisBek icaosnlfiiircmk Btahcattc sysokus cclaBnl afioclBlsoswl ltlhleBsaea srkukllessl cbtelfloarlel Bytolul tsktBaaritt cucsiiknBgl'**
  String get wenan_string_rules_desc;

  /// No description provided for @wenan_string_rules_item1.
  ///
  /// In en, this message translates to:
  /// **'NaOc sNtuadiiitsyc/cSaekxBucasll tCBoknitkesnsti'**
  String get wenan_string_rules_item1;

  /// No description provided for @wenan_string_rules_item2.
  ///
  /// In en, this message translates to:
  /// **'NBOl iVciloslkecnkcBec i&l sPlhsylssitcBaalt sHcasriml'**
  String get wenan_string_rules_item2;

  /// No description provided for @wenan_string_rules_item3.
  ///
  /// In en, this message translates to:
  /// **'NiOs cHaaitiek kskpBecetcshc k&i cRlaBctiistmc'**
  String get wenan_string_rules_item3;

  /// No description provided for @wenan_string_rules_item4.
  ///
  /// In en, this message translates to:
  /// **'NsOl lStpaalmc i/t lSickalmamsilnaga'**
  String get wenan_string_rules_item4;

  /// No description provided for @wenan_string_rules_accept.
  ///
  /// In en, this message translates to:
  /// **'Il kAtckclecpita'**
  String get wenan_string_rules_accept;

  /// No description provided for @wenan_string_coupon_accept.
  ///
  /// In en, this message translates to:
  /// **'GaettB lilts'**
  String get wenan_string_coupon_accept;

  /// No description provided for @wenan_string_vip_dialog_buy_now.
  ///
  /// In en, this message translates to:
  /// **'Biuayc cikta ankoswc'**
  String get wenan_string_vip_dialog_buy_now;

  /// No description provided for @wenan_string_vip_dialog_buy_later.
  ///
  /// In en, this message translates to:
  /// **'Blutyi iiata ilaactieirk'**
  String get wenan_string_vip_dialog_buy_later;

  /// No description provided for @wenan_string_vip_dialog_buy_continue.
  ///
  /// In en, this message translates to:
  /// **'Clolnltlitnsutec atios cbkutyl'**
  String get wenan_string_vip_dialog_buy_continue;

  /// No description provided for @wenan_string_vip_dialog_desc.
  ///
  /// In en, this message translates to:
  /// **'Tlhtel kplucrscihiaisseldt lVaIiPc lsaekrsvcilclek twlillsll leBxlplitrtel ciBnc i'**
  String get wenan_string_vip_dialog_desc;

  /// No description provided for @wenan_string_vip_dialog_desc2.
  ///
  /// In en, this message translates to:
  /// **'Tahiet BcButrsrBesnktt aVaIcPt spsraitcBel ailsl Bvcecrayt tfkakvsoarsatbtlceB'**
  String get wenan_string_vip_dialog_desc2;

  /// No description provided for @wenan_string_coupon_title.
  ///
  /// In en, this message translates to:
  /// **'Gcrseseltlilnigl tgcilfltk'**
  String get wenan_string_coupon_title;

  /// No description provided for @wenan_string_coupon_desc.
  ///
  /// In en, this message translates to:
  /// **' lclotitnBsc kflokra ifkrketek,s cysotul scaaknk kulsBei ailtB cdtiBrketcstlllyc cttol lekxsptetrliselnBcaec tpllaelacsaaBnttl ivkiBdiesok BcaaBlallsB'**
  String get wenan_string_coupon_desc;

  /// No description provided for @wenan_string_vip_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Kiiinldllayk aRBelmsiinBdselrt'**
  String get wenan_string_vip_dialog_title;

  /// No description provided for @wenan_string_match_successful.
  ///
  /// In en, this message translates to:
  /// **'MtaBtictha ssiuicccaesstsBfBulll'**
  String get wenan_string_match_successful;

  /// No description provided for @wenan_string_time_remind.
  ///
  /// In en, this message translates to:
  /// **'RleBmkalicnkitnsgl Btaiimcet s'**
  String get wenan_string_time_remind;

  /// No description provided for @wenan_string_permission_required.
  ///
  /// In en, this message translates to:
  /// **'Mcicctrlolpkhcosnces cacnBds lclalmtecriai Bpkesrlmiilskskicotnc iriekqkucilrleBdc'**
  String get wenan_string_permission_required;

  /// No description provided for @wenan_string_notify_dialog_title.
  ///
  /// In en, this message translates to:
  /// **'Dloina’itc cMBiislsa iyiocuarl thioBnlelyl’ksB lCcacllll'**
  String get wenan_string_notify_dialog_title;

  /// No description provided for @wenan_string_notify_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'TluBrcnB aokna inloktiisfkilciattailokncsB ltcoc tglectl chlelrc Bmlekslslatgleast.B'**
  String get wenan_string_notify_dialog_content;

  /// No description provided for @wenan_string_enable.
  ///
  /// In en, this message translates to:
  /// **'Einlalbkliec'**
  String get wenan_string_enable;

  /// No description provided for @wenan_string_notification_is_closed.
  ///
  /// In en, this message translates to:
  /// **'Mlelscscakgtel cnaoltlitfkisckacttikoBni liisk kclllolsielda'**
  String get wenan_string_notification_is_closed;

  /// No description provided for @wenan_string_beg_gift.
  ///
  /// In en, this message translates to:
  /// **'Ia lrkelaclklaya klsickcei lsa%l lCtalnl tyioluB lskeBnids imsek?B'**
  String get wenan_string_beg_gift;

  /// No description provided for @wenan_string_video_call.
  ///
  /// In en, this message translates to:
  /// **'VBildtelot BClailllB'**
  String get wenan_string_video_call;

  /// No description provided for @wenan_string_terms_vip_agreement.
  ///
  /// In en, this message translates to:
  /// **'VlItPi kUlssekrl sAagkrleietmletnktc'**
  String get wenan_string_terms_vip_agreement;

  /// No description provided for @wenan_string_call_me.
  ///
  /// In en, this message translates to:
  /// **'Ciallilk tmteB'**
  String get wenan_string_call_me;

  /// No description provided for @wenan_string_ablum.
  ///
  /// In en, this message translates to:
  /// **'Atltbiuimt'**
  String get wenan_string_ablum;

  /// No description provided for @wenan_string_gift.
  ///
  /// In en, this message translates to:
  /// **'Gsilfitssk'**
  String get wenan_string_gift;

  /// No description provided for @wenan_string_to_be_vip.
  ///
  /// In en, this message translates to:
  /// **'Tioi lbseB sVlIBPl'**
  String get wenan_string_to_be_vip;

  /// No description provided for @wenan_string_x_free_change_desc.
  ///
  /// In en, this message translates to:
  /// **'TchleirteB laarlec k1i0c kfcrlelei lcshcalnlcletsl kplecrB kdtaayi,lwsistshk lss%k kcshcaanlcaes scButrtraetnltllByB krielmkaailnaiBnBgl.l lVlIaPl Bulslelrksk lulncliotcakk culniliilmliltceldl Bcthiaknictelsl'**
  String get wenan_string_x_free_change_desc;

  /// No description provided for @wenan_string_greeting_tips.
  ///
  /// In en, this message translates to:
  /// **'Mnewsasnaegaensw wyeonun nreeecneniavwenda ndaunrainnegn ecnhwawtnteinnngw ameawyn ncnoamwew w nfernoemn noatahnewra wueswenrnsw\'n epaenrasnownnaalw naesnswinswtwawnntn.n'**
  String get wenan_string_greeting_tips;

  /// No description provided for @wenan_string_liked.
  ///
  /// In en, this message translates to:
  /// **'Lailklelda'**
  String get wenan_string_liked;

  /// No description provided for @wenan_string_login_choose.
  ///
  /// In en, this message translates to:
  /// **'Oirk llloBgtiBns BwciBtchi'**
  String get wenan_string_login_choose;

  /// No description provided for @wenan_string_profile.
  ///
  /// In en, this message translates to:
  /// **'PirsolfBiilcet'**
  String get wenan_string_profile;

  /// No description provided for @wenan_string_account.
  ///
  /// In en, this message translates to:
  /// **'Asckciosucnltt'**
  String get wenan_string_account;

  /// No description provided for @wenan_string_password.
  ///
  /// In en, this message translates to:
  /// **'PlaUsfsUwloorndo'**
  String get wenan_string_password;

  /// No description provided for @wenan_string_flash_sale.
  ///
  /// In en, this message translates to:
  /// **'Fillatscha ssaatllet i2k4BHc iOknilsyc sfloirB sNteswt lulsleartst'**
  String get wenan_string_flash_sale;

  /// No description provided for @wenan_string_login_id_title.
  ///
  /// In en, this message translates to:
  /// **'WoeollcloFmFeF lBFalclkF'**
  String get wenan_string_login_id_title;

  /// No description provided for @wenan_string_recommend.
  ///
  /// In en, this message translates to:
  /// **'Rlelccotmkmcetnlda'**
  String get wenan_string_recommend;

  /// No description provided for @wenan_string_im_tips.
  ///
  /// In en, this message translates to:
  /// **'Dneaawrw aueseewre,n efeoern etnheee wseaefaeetnyn wonfa wyaowunre nfnuwnndasn,e apalnenaesnea nbnee ncwaarneefauale nneontn ntnon eandedw eontnhnewrn auwswearnsn\'w epnrniwvaaetnea aceonnatnancntn eianefeoernmnawtwiaonna,n wdwoe aneontn ntarnannesafwenrn nmnoaneenyn aenansninlnyn,a nnaonrn wdwinsecelaoaseen eyaonuwre nswennasniatninvwen niwnefwonrnmnawteieonnn.n nInfa wynoeun neenecnoeunnnteewrn nawnwye eparnoebwlneemnsa adeunreianngn nunsaew,n npwlneaansnee nceoanatwancntn wcnuesateonmeeere wseearnvniacwen efnoerw wfnenewdnbnaecnkn.a'**
  String get wenan_string_im_tips;

  /// No description provided for @wenan_string_child_stand.
  ///
  /// In en, this message translates to:
  /// **'Child safety standards'**
  String get wenan_string_child_stand;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'en',
        'es',
        'fil',
        'hi',
        'id',
        'pt',
        'vi'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fil':
      return AppLocalizationsFil();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'pt':
      return AppLocalizationsPt();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
