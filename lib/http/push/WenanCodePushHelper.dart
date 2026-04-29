

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wenan/StringTranslate.dart';

class PushHelper{
  static const int TYPE_MAIN = 0;
  static const int  TYPE_CHAT_LIST = 1;
  static const int  TYPE_CHAT_DETAIL = 2;
  static const int  TYPE_ANCHOR_ONLINE = 3;
  static const int  TYPE_SYS_MSG = 4;
  static const int  TYPE_FREE_CARD = 5;

  static void initOneSignal(){
    //Remove this method to stop OneSignal Debugging
    if(!AppConfig.inProduction){
      OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
      OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    }

    OneSignal.initialize(AppConfig.oneSignalAppId);

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      try {
        // Default behavior will display the notification; we also record it
        saveNotification(event.notification);
      } catch (e) {
        AuvChatLog.printE(e);
      }
    });

    OneSignal.Notifications.addClickListener((OSNotificationClickEvent clickEvent) {
      try {
        AuvChatLog.d("notificationOpened,${clickEvent.notification}");
        if (clickEvent.notification.additionalData != null) {
          AuvChatLog.d("notificationOpened,getAdditionalData=${clickEvent.notification.additionalData}");
          String? url = clickEvent.notification.additionalData?["url"];
          if(!Utils.isEmptyString(url)){
            route(url!, clickEvent.notification.title);
          }
        }
      } catch (e) {
        AuvChatLog.printE(e);
      }
    });

    OneSignal.Notifications.addPermissionObserver((bool permission) {
      // Will be called whenever the permission changes
      // (ie. user taps Allow on the permission prompt in iOS)
    });

    OneSignal.User.pushSubscription.addObserver((OSPushSubscriptionChangedState changes) {
      // Will be called whenever the subscription changes
      // if (changes.current.optedIn) {
      //   Flurry.userProperties.setValue("push_subscribe_status", "1");
      // } else {
      //   Flurry.userProperties.setValue("push_subscribe_status", "0");
      // }
    });


// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
//       print("Accepted permission: $accepted");
//     });
  }

  static void updatePushAlias(){
    if(Application.isLogin()){
      if(Application.commonUser?.regionCode != null){
        OneSignal.User.addTagWithKey("region", Application.commonUser?.regionCode);
      }
      OneSignal.login("${Application.currUserId()}");
    } else {
      OneSignal.User.removeTag("region");
      OneSignal.logout();
    }
  }

  static void route(String url,String? title){
    var chatId = Utils.getParamFromUrl(url, "c");
    var speechId = Utils.getParamFromUrl(url, "s");
    Map<String,String> data = {};
    data["url"] = url;
    data["title"] = title??"";
    if(!Utils.isEmptyString(chatId)){
      data["chatboxId"] = chatId!;
    }
    if(!Utils.isEmptyString(speechId)){
      data["speechId"] = speechId!;
    }
    DataReporter.sendTrackEvent(DataReporter.PUSH_MSG_CLICKED, data);
    Future.delayed(const Duration(seconds: 1),(){
      Application.eventBus.fire(PushOpenEvent(url,chatId));
    });

  }

  static void saveNotification(OSNotification notification) {
    
    Utils.nullSafe<String>(notification.additionalData?["url"],notNullBlock: (url){
      var chatId = Utils.getParamFromUrl(url, "c");
      var speechId = Utils.getParamFromUrl(url, "s");
      Map<String,String> data = {};
      data["url"] = url;
      data["title"] = notification.title??"";
      if(!Utils.isEmptyString(chatId)){
        data["chatboxId"] = chatId!;
      }
      if(!Utils.isEmptyString(speechId)){
        data["speechId"] = speechId!;
      }
      DataReporter.sendTrackEvent(DataReporter.PUSH_MSG_RECEIVED, data);
      if(notification.androidNotificationId!=null){
        int notificationId = notification.androidNotificationId!;
        if(url.startsWith(AppConfig.h5ChatUrl)){
          if(Utils.isEmptyString(chatId)){
            SpHelper.addPushNotificationId(notificationId, TYPE_CHAT_LIST.toString());
          } else {
            SpHelper.addPushNotificationId(notificationId, "${TYPE_CHAT_DETAIL.toString()}_$chatId");
          }
        } else if(url.startsWith(AppConfig.h5AnchorOnlineUrl)){
          SpHelper.addPushNotificationId(notificationId, TYPE_ANCHOR_ONLINE.toString());
        } else if(url.startsWith(AppConfig.h5SysMsgUrl)){
          SpHelper.addPushNotificationId(notificationId, TYPE_SYS_MSG.toString());
        } else {
          SpHelper.addPushNotificationId(notificationId, TYPE_MAIN.toString());
        }
      }

    });
    

  }

  static void cleanNotifications(int pushType,{int? chatBoxId}){
    var ids = SpHelper.getPushNotificationIds(pushType==TYPE_CHAT_DETAIL?"${TYPE_CHAT_DETAIL.toString()}_$chatBoxId":pushType.toString());
    if(!Utils.isEmptyString(ids)){
      ids!.split(",").forEach((element) {
        try {
          OneSignal.Notifications.removeNotification(Utils.parseInt(element)??0);
        } catch (e) {
          AuvChatLog.printE(e);
        }
      });
      SpHelper.clearPushNotificationIds(pushType==TYPE_CHAT_DETAIL?"${TYPE_CHAT_DETAIL.toString()}_$chatBoxId":pushType.toString());
    }
  }


  static void showNotifyPermissionDialog(BuildContext context,String tag) async{
    // AuvChatLog.d("showFirstChargeDialog:width=${data.text_img_info?.width?.toDouble()}");
    // AuvChatLog.d("showFirstChargeDialog:height=${data.text_img_info?.height?.toDouble()}");
    // AuvChatLog.d("showFirstChargeDialog:video_url=${data.text_img_info?.toJson()}");
    var isOpen = await Permission.notification.isGranted;
    if(isOpen){
      return;
    }
    if(!SpHelper.firstTimeCheckNotificationEnabledToday(tag)){
      return;
    }
    double width = MediaQuery.of(context).size.width-22*2;
    double height = 450;
    // ignore: use_build_context_synchronously
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        isScrollControlled: true,
        // anchorPoint: const Offset(50, 200),
        // useRootNavigator: true,
        routeSettings: const RouteSettings(name: "NotifyPermissionDialog"),
        builder: (context) {
          Widget childWidget = Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(
                  color: AppColor.color_3f3f4b,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64,),
                  ImageLoader.loadLocalImage('chat/wwecnuaMnE_KryeysK_Xi3cs_zl9iisAt4_qnToTtNiufJyn',width: 84,height: 84),
                  const SizedBox(height: 55,),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [AppColor.color_ffd43b, AppColor.color_ff558b],
                      tileMode: TileMode.clamp,
                    ).createShader(bounds),
                    child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_notify_dialog_title),style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.color_884dff,
                      fontWeight: FontWeight.bold,
                      // fontFamily: AppText.fontFamily,
                      // decoration: TextDecoration.none,
                    ),),
                  ),
                  const SizedBox(height: 12,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_notify_dialog_content),style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.b2,
                    ),),
                  ),
                  const SizedBox(height: 24,),
                  GestureDetector(
                    onTap: () async{
                      PageRouter.popCurrPage();
                      var status = await Permission.notification.request();
                      if(!status.isGranted){
                        openAppSettings();
                      }
                    },
                    child: Container(
                      width: 280,
                      height: 48,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColor.color_4fffaf,
                              AppColor.color_a1ff68,
                              AppColor.color_e9ff29
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(28))),
                      child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_enable),style: const TextStyle(
                        fontSize: 16,
                        color: AppColor.b1,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: (){
                      PageRouter.popCurrPage();
                    },
                    child: Container(
                      width: 280,
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_not_now),style: const TextStyle(
                        fontSize: 14,
                        color: AppColor.b3,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  )
                ],
              )
          );
          return Padding(
              padding: EdgeInsets.only(
                // 下面这一行是重点
                bottom: MediaQuery.of(context).viewInsets.bottom+(MediaQuery.of(context).size.height-height)/2,
                left: 22,
                right: 22,
              ),
              // duration: const Duration(milliseconds: 200),
              child:ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: childWidget,
              ));
        });
  }
}

