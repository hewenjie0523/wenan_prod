import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

import 'WenanCodeApplication.dart';

class SpHelper {
  static late SharedPreferences _spf;

  static Future<void> init() async {
    _spf = await SharedPreferences.getInstance();
  }

  // 判断是否存在数据
  static bool hasKey(String key) {
    Set keys = getKeys();
    return keys.contains(key) == true;
  }

  static Set<String> getKeys() {
    return _spf.getKeys();
  }

  static get(String key) {
    return _spf.get(key);
  }

  static String? getString(String key) {
    return _spf.getString(key);
  }

  static Future<bool> putString(String key, String value) {
    return _spf.setString(key, value);
  }

  static bool? getBool(String key) {
    return _spf.getBool(key);
  }

  static Future<bool> putBool(String key, bool value) {
    return _spf.setBool(key, value);
  }

  static int? getInt(String key, {int? defaultValue}) {
    return _spf.getInt(key) ?? (defaultValue);
  }

  static Future<bool> putInt(String key, int value) {
    return _spf.setInt(key, value);
  }

  static double? getDouble(String key, {double? defaultValue}) {
    return _spf.getDouble(key) ?? (defaultValue);
  }

  static Future<bool> putDouble(String key, double value) {
    return _spf.setDouble(key, value);
  }

  static List<String>? getStringList(String key) {
    return _spf.getStringList(key);
  }

  static Future<bool> putStringList(String key, List<String> value) {
    return _spf.setStringList(key, value);
  }

  static dynamic getDynamic(String key) {
    return _spf.get(key);
  }

  static Future<bool> remove(String key) {
    return _spf.remove(key);
  }

  static Future<bool> clear() {
    return _spf.clear();
  }

  //user method

  static String getUserKey(String key) {
    return key + "_u_" + Application.currUserId().toString();
  }

  // 判断是否存在数据
  static bool hasKeyCurrUser(String key) {
    Set keys = getKeys();
    return keys.contains(getUserKey(key));
  }

  static getMCurrUser(String key) {
    return _spf.get(getUserKey(key));
  }

  static String? getCurrUserString(String key) {
    return _spf.getString(getUserKey(key));
  }

  static Future<bool> putCurrUserString(String key, String value) {
    return _spf.setString(getUserKey(key), value);
  }

  static bool? getCurrUserBool(String key) {
    return _spf.getBool(getUserKey(key));
  }

  static Future<bool> putCurrUserBool(String key, bool value) {
    return _spf.setBool(getUserKey(key), value);
  }

  static int? getCurrUserInt(String key, {int? defaultValue}) {
    return _spf.getInt(getUserKey(key)) ?? (defaultValue);
  }

  static Future<bool> putCurrUserInt(String key, int value) {
    return _spf.setInt(getUserKey(key), value);
  }

  static double? getCurrUserDouble(String key, {double? defaultValue}) {
    return _spf.getDouble(getUserKey(key)) ?? defaultValue;
  }

  static Future<bool> putCurrUserDouble(String key, double value) {
    return _spf.setDouble(getUserKey(key), value);
  }

  static List<String>? getCurrUserStringList(String key) {
    return _spf.getStringList(getUserKey(key));
  }

  static Future<bool> putCurrUserStringList(String key, List<String> value) {
    return _spf.setStringList(getUserKey(key), value);
  }

  static dynamic getCurrUserDynamic(String key) {
    return _spf.get(getUserKey(key));
  }

  static Future<bool> removeCurrUser(String key) {
    return _spf.remove(getUserKey(key));
  }

  static String getAppSession() {
    return getString("wen_nan_app_nanew_session") ?? "";
  }

  static void setAppSession(String session) {
    putString("wen_nan_app_nanew_session", session);
  }

  static String getAppSecret() {
    return getString("wen_nan_app_nanew_secret") ?? AppConfig.defaultSecretKey;
  }

  static void setAppSecret(String session) {
    putString("wen_nan_app_nanew_secret", session);
  }

  static String? getAppleUserID() {
    return getString('wen_nan_app_nanew_bind_apple_id');
  }

  static void setAppleUserID(String appleID) {
    putString('wen_nan_app_nanew_bind_apple_id', appleID);
  }

  static String? getCurrUserJson() {
    return getString("wen_nan_curr_nanew_user");
  }

  static void setCurrUserJson(String info) {
    putString("wen_nan_curr_nanew_user", info);
  }

  static String? getCurrAppConfigJson() {
    return getString("wen_nan_curr_nanew_app_nanew_config");
  }

  static void setCurrAppConfigJson(String info) {
    putString("wen_nan_curr_nanew_app_nanew_config", info);
  }

  static String? getQiniuTokenInfo() {
    return getCurrUserString('wen_nan_app_nanew_qiniu_token');
  }

  static void setQiniuTokenInfo(String info) {
    putCurrUserString('wen_nan_app_nanew_qiniu_token', info);
  }

  static int getUploadTokenExpireTime() {
    return getCurrUserInt("wen_nan_upload_nanew_token_expire_time", defaultValue: 0)!;
  }

  static void setUploadTokenExpireTime(int token) {
    putCurrUserInt("wen_nan_upload_nanew_token_expire_time", token);
  }

  static String? getUploadImageToken() {
    return getCurrUserString("wen_nan_upload_nanew_img_token");
  }

  static void setUploadImageToken(String token) {
    putCurrUserString("wen_nan_upload_nanew_img_token", token);
  }

  static String? getUploadVideoToken() {
    return getCurrUserString("wen_nan_upload_nanew_video_token");
  }

  static void setUploadVideoToken(String token) {
    putCurrUserString("wen_nan_upload_nanew_video_token", token);
  }

  static String? getUploadVoiceToken() {
    return getCurrUserString("wen_nan_upload_nanew_voice_token");
  }

  static void setUploadVoiceToken(String token) {
    putCurrUserString("wen_nan_upload_nanew_voice_token", token);
  }

  static int getMatchFilterSex() {
    return getCurrUserInt("wen_nan_match_nanew_filter_sex", defaultValue: 0)!;
  }

  static void setMatchFilterSex(int token) {
    putCurrUserInt("wen_nan_match_nanew_filter_sex", token);
  }

  static String? getMatchFilterRegionCode() {
    return getCurrUserString("wen_nan_match_nanew_filter_region_code");
  }

  static void setMatchFilterRegionCode(String token) {
    putCurrUserString("wen_nan_match_nanew_filter_region_code", token);
  }

  static String? getDiscoverFilterCode() {
    return getCurrUserString("wen_nan_discover_filter_region_code");
  }

  static void setDiscoverFilterRegionCode(String regionCode) {
    putCurrUserString("wen_nan_discover_filter_region_code", regionCode);
  }

  static String? getDiscoverFilterRegionName() {
    return getCurrUserString("wen_nan_discover_filter_region_name");
  }

  static void setDiscoverFilterRegionName(String regionCode) {
    putCurrUserString("wen_nan_discover_filter_region_name", regionCode);
  }

  static bool getDiscoverFilterRegionVipOnly() {
    return getCurrUserBool("wen_nan_discover_filter_region_vip_only") ?? false;
  }

  static void setDiscoverFilterRegionVipOnly(bool done) {
    putCurrUserBool("wen_nan_discover_filter_region_vip_only", done);
  }

  static bool getImMessageCountDone() {
    return getCurrUserBool("wen_nan_im_message_count_done") ?? false;
  }

  static void setImMessageCountDone(bool done) {
    putCurrUserBool("wen_nan_im_message_count_done", done);
  }

  static int getImMsgFreeCountRemain() {
    return getCurrUserInt("wen_nan_im_msg_free_count_remain", defaultValue: 5)!;
  }

  static void setImMsgFreeCountRemain(int token) {
    putCurrUserInt("wen_nan_im_msg_free_count_remain", token);
  }

  static int getImTipShowCount() {
    return getCurrUserInt("wen_nan_im_tip_count", defaultValue: 0)!;
  }
  static void setImTipShowCount(int count) {
    putCurrUserInt("wen_nan_im_tip_count", count);
  }

  static String? getThirdPayOrdersString() {
    return getCurrUserString('wen_nan_third_pay_orders');
  }

  static void setThirdPayOrdersString(String info) {
    putCurrUserString('wen_nan_third_pay_orders', info);
  }

  static int getFirstChargeEndTime() {
    return getCurrUserInt("wen_nan_first_charge_end_time", defaultValue: 0)!;
  }

  static void setFirstChargeEndTime(int token) {
    putCurrUserInt("wen_nan_first_charge_end_time", token);
  }

  static int getEnterAppTimes() {
    return getCurrUserInt("wen_nan_enter_app_nanew_times", defaultValue: 0)!;
  }

  static void setEnterAppTimes(int token) {
    putCurrUserInt("wen_nan_enter_app_nanew_times", token);
  }

  static String? getPushNotificationIds(String type) {
    return getCurrUserString("wen_nan_push_notification_ids_$type");
  }

  static void addPushNotificationId(int notificationId, String type) {
    if (Utils.isEmpty(getPushNotificationIds(type))) {
      putCurrUserString("wen_nan_push_notification_ids_$type", "$notificationId");
    } else {
      putCurrUserString("wen_nan_push_notification_ids_$type", "${getPushNotificationIds(type)},$notificationId");
    }
  }

  static void clearPushNotificationIds(String type) {
    putCurrUserString("wen_nan_push_notification_ids_$type", "");
  }

  static bool firstTimeCheckNotificationEnabledToday(String tag) {
    int dayOfYear = int.parse(DateFormat('D').format(DateTime.now()));
    int lastCheckDay = getCurrUserInt("wen_nan_notify_check_day_$tag", defaultValue: -1) ?? -1;
    putCurrUserInt("wen_nan_notify_check_day_$tag", dayOfYear);
    return dayOfYear != lastCheckDay;
  }

  static String? getAIHelpDomain() {
    return getString('wen_nan_ai_nanew_help_domain');
  }

  static void setAIHelpDomain(String info) {
    putString('wen_nan_ai_nanew_help_domain', info);
  }

  static String? getAgoraAppId() {
    return getString('wen_nan_agora_app_nanew_id');
  }

  static void setAgoraAppId(String info) {
    putString('wen_nan_agora_app_nanew_id', info);
  }

  static String? getAIHelpAppKey() {
    return getString('wen_nan_ai_nanew_help_app_nanew_key');
  }

  static void setAIHelpAppKey(String info) {
    putString('wen_nan_ai_nanew_help_app_nanew_key', info);
  }

  static String? getAIHelpAppId() {
    return getString('wen_nan_ai_nanew_help_app_nanew_id');
  }

  static void setAIHelpAppId(String info) {
    putString('wen_nan_ai_nanew_help_app_nanew_id', info);
  }

  static String? getAppVersionUpgraded() {
    return getString('wen_nan_app_nanew_version_upgraded');
  }

  static void setAppVersionUpgraded(String info) {
    putString('wen_nan_app_nanew_version_upgraded', info);
  }

  static int? getAppStartupId() {
    return getInt('wen_nan_app_nanew_startup_id', defaultValue: 0);
  }

  static void setAppStartupId(int info) {
    putInt('wen_nan_app_nanew_startup_id', info);
  }

  static String getMatchTime() {
    return getString('wen_nan_match_nanew_date_count') ?? "";
  }

  static void setMatchTime(String info) {
    putString('wen_nan_match_nanew_date_count', info);
  }

  static void incrPayCount(num totalPrice) {
    int val = getPayCount();
    putInt("wen_nan_pay_order_count", val + 1);
  }

  static int getPayCount() {
    return getInt("wen_nan_pay_order_count", defaultValue: 0)!;
  }
}
