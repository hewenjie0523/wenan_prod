import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodePayManager.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/wenan_user_online_status_manager.dart';
import 'package:wenan/utils/wenan_user_online_status_refresher.dart';
import 'package:wenan/view/WenanCodeErrorPage.dart';

import 'view/WenanCodehome_page.dart';

void main() async {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.verbose;
  runZonedGuarded(() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      AuvChatLog.d("runZonedGuarded:onError:$details");
    };
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(const ProviderScope(
      child: MyApp(),
    ));
    Utils.setStatusBarStyle(false);
  }, (Object error, StackTrace stack) {
    AuvChatLog.printE("runZonedGuarded:onError,async:$error", error: stack);
  });
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

final RouteObserver<Route> routeObserver = RouteObserver();

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  List<Locale> supportedLocales = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    PayManager.instance.register();
    supportedLocales.addAll(AppLocalizations.supportedLocales);
    supportedLocales.sort((a, b) {
      if (a.languageCode == "en") {
        return -1;
      }
      if (b.languageCode == "en") {
        return 1;
      }
      return a.languageCode.compareTo(b.languageCode);
    });
    AuvChatLog.d("AppLocalizations.supportedLocales=${supportedLocales}");
  }

  @override
  void dispose() {
    PayManager.instance.unregister();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    Application.appContext = null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      //进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
      case AppLifecycleState.resumed:
        AuvChatLog.d("应用进入前台======");
        Application.onAppForegroundChange(true);
        if (Application.isLogin()) {
          WenanUserOnlineStatusRefresher.instance.onAppForegroundChange(true);
          ref.read(commonUserNotify.notifier).updateUserInfo();
        }
        break;
      //应用状态处于闲置状态，并且没有用户的输入事件，
      // 注意：这个状态切换到 前后台 会触发，所以流程应该是先冻结窗口，然后停止UI
      case AppLifecycleState.inactive:
        AuvChatLog.d("应用处于闲置状态，这种状态的应用应该假设他们可能在任何时候暂停 切换到后台会触发======");
        break;
      //当前页面即将退出
      case AppLifecycleState.detached:
        AuvChatLog.d("当前页面即将退出======");
        break;
      // 应用程序处于不可见状态
      case AppLifecycleState.paused:
        AuvChatLog.d("应用处于不可见状态 后台======");
        if (Application.isLogin()) {
          WenanUserOnlineStatusRefresher.instance.onAppForegroundChange(false);
        }

        Application.onAppForegroundChange(false);
        break;
      case AppLifecycleState.hidden:
        // New in Flutter 3.13+: app UI not visible but not paused. Treat like paused for our use-case.
        if (Application.isLogin()) {
          WenanUserOnlineStatusRefresher.instance.onAppForegroundChange(false);
        }
        Application.onAppForegroundChange(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorObservers: [routeObserver, PalaNavigatorObserver()],
      navigatorKey: PageRouter.navigatorKey,
      onGenerateRoute: PageRouter.instance.router.generator,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: supportedLocales,
      // theme: CupertinoThemeData(
      //   primaryColor:AppColor.black,
      // ),
      builder: (BuildContext context, Widget? widget) {
        AuvChatLog.d("CupertinoApp:build:$widget");
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          // AuvChatLog.d("ErrorWidget.builder:${errorDetails.exceptionAsString()}");
          // AuvChatLog.d("ErrorWidget.builder:${errorDetails.stack?.toString()??""}");
          return Center(
              child: CupertinoButton(
            child: const Text("Something bad happen!",
                style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                )),
            onPressed: () {
              if (PageRouter.canCurrPagePop()) {
                PageRouter.popCurrPage();
              }
            },
          ));
        };
        return widget ?? const ErrorPage();
      },
      // checkerboardOffscreenLayers:true,
      //   checkerboardRasterCacheImages:true
    );
  }
}

class PalaNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    AuvChatLog.d('New route pushed: ${route.settings.name}');
    PageRouter.instance.onTopPageChange(route.settings.name);
    if (Application.isLogin() &&
        route.settings.name != null &&
        !route.settings.name!.startsWith("/btm_dlg")) {
      PayManager.instance.batchCheckThirdPayCachedOrders();
      Application.getIds(force: false);
    }

    Application.callPlatformMethod(
        "${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
      '${Application.channelName}.status': isPreventScreenshotOffPage(route.settings.name) ? 1 : 0,
    });
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    AuvChatLog.d('New route piped: ${route.settings.name}');
    PageRouter.instance.onTopPageChange(previousRoute?.settings.name);

    String? routeName = previousRoute?.settings.name;
    if(!Utils.isEmpty(routeName) && routeName!.contains(PageRouter.PageRoot) && Application.tabIndex == 4){
      Application.callPlatformMethod(
          "${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
        '${Application.channelName}.status': 1,
      });
    }else{
      if (isPreventScreenshotOffPage(route.settings.name)) {
        Application.callPlatformMethod(
            "${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
          '${Application.channelName}.status': 0,
        });
      }
    }

    super.didPop(route, previousRoute);
  }

  ///允许录屏页面
  bool isPreventScreenshotOffPage(String? routeName) {
    if (Utils.isEmpty(routeName)) {
      return false;
    }
    if (routeName!.contains(PageRouter.LoginPage) ||
        routeName.contains(PageRouter.EditUserInfoPage) ||
        routeName.contains(PageRouter.FirstChargePopupPage) ||
        routeName.contains(PageRouter.BalancePage) ||
        routeName.contains(PageRouter.VipPage) ||
        routeName.contains(PageRouter.VipChargePopupPage) ||
        routeName.contains(PageRouter.PayHandlerPage)) {
      return true;
    }
    return false;
  }

}
