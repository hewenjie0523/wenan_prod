import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ClientInfo.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../utils/WenanCodelog.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import 'package:wenan/StringTranslate.dart';

class WebviewPage extends ConsumerStatefulWidget {
  final String webUrl;

  const WebviewPage(this.webUrl, {Key? key}) : super(key: key);

  @override
  createState() {
    return _WebviewPageState();
  }
}

class _WebviewPageState extends ConsumerState<WebviewPage> {
  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        userAgent: ClientInfo().payUserAgent,
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  String title = "";

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );

    // webViewController?.loadUrl(
    //     urlRequest: URLRequest(url: Uri.parse(widget.webUrl)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          var canback = await webViewController?.canGoBack();
          if (canback == true) {
            webViewController?.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
        backgroundColor: AppColor.color111523,
        appBar: AuvCupertinoNavigationBar(
          middle: Text(
            title,
            style: AppTextStyle.white18,
          ),
          leading: UIUtils.navigationCommonBackButton(() async {
            FluroRouter.appRouter.pop(context);
          }, color: AppColor.white, leftPadding: 0),
          backgroundColor: AppColor.color111523,
          padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
          // trailing: UIUtils.navigationCommonBackButton(() async {
          //   webViewController?.evaluateJavascript(source: "window.location.href='google.navigation:q=latitude,longitude';");
          // }, color: AppColor.white, leftPadding: 0),
        ),
        body: Stack(children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.webUrl)),
            initialOptions: options,
            pullToRefreshController: pullToRefreshController,
            onWebViewCreated: (controller) {
              webViewController = controller;
            },
            onLoadStart: (controller, url) {
              Utils.callSetStateSafely(this, () {
                this.url = url.toString();
              });
            },
            androidOnPermissionRequest: (controller, origin, resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url;
              AuvChatLog.d("Webview shouldOverrideUrlLoading url:$uri,scheme:${uri?.scheme}");
              if(uri==null){
                return NavigationActionPolicy.ALLOW;
              }
              if (![
                "http",
                "https",
                "file",
                "chrome",
                "data",
                "javascript",
                "about"
              ].contains(uri.scheme)) {
                AuvChatLog.d("scheme not contains:${uri.scheme},just throw it to the system");
                // Launch the App
                try {
                  await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication
                                  );
                } catch (e) {
                  AuvChatLog.d("launchUrl error:$e");
                  // Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
                }
                return NavigationActionPolicy.CANCEL;
              }

              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (controller, url) async {
              AuvChatLog.d("Webview onLoadStop url:$url");
              pullToRefreshController.endRefreshing();
              Utils.callSetStateSafely(this, () {
                webViewController
                    ?.getTitle()
                    .then((value) => title = value ?? "");
              });
            },
            onLoadError: (controller, url, code, message) {
              AuvChatLog.d(
                  "Webview onLoadError message:$message  code:$code url:$url");
              pullToRefreshController.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              AuvChatLog.d("Webview onProgressChanged progress:$progress");
              if (progress == 100) {
                pullToRefreshController.endRefreshing();
              }
              Utils.callSetStateSafely(this, () {
                this.progress = progress / 100;
                webViewController
                    ?.getTitle()
                    .then((value) => title = value ?? "");
              });
            },
            onUpdateVisitedHistory: (controller, url, androidIsReload) {
              AuvChatLog.d("Webview onUpdateVisitedHistory");
            },
            onConsoleMessage: (controller, consoleMessage) {
              AuvChatLog.d("Webview onConsoleMessage ");
              print(consoleMessage);
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container(),
        ])));
  }
}
