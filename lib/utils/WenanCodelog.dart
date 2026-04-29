import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:logging/logging.dart';

import 'WenanCodeutils.dart';

class AuvChatLog {
  static const String TAG = "Wenan";
  static bool DEBUG = true; // !AppConfig.inProduction;

  static void init(bool debug) {
    DEBUG = debug;
  }

  static void _innerLog(String msg, String tag, int levelValue, {Object? error, StackTrace? stackTrace}) {
    if (DEBUG) {
      if (Utils.isEmpty(tag)) {
        tag = TAG;
      }
      // log(msg,time:DateTime.now(),name: tag,level: levelValue,error:error,stackTrace: stackTrace);
      debugPrint("$tag: $msg");
    }
  }

  static void d(String msg, {String tag = TAG}) {
    _innerLog(msg, tag, Level.FINE.value);
  }

  static void i(String msg, {String tag = TAG}) {
    _innerLog(msg, tag, Level.INFO.value);
  }

  static void w(String msg, {String tag = TAG}) {
    _innerLog(msg, tag, Level.WARNING.value);
  }

  static void e(String msg, {String tag = TAG, Object? error, StackTrace? stackTrace}) {
    _innerLog(msg, tag, Level.SEVERE.value, error: error);
  }

  static void printE(Object e, {Object? error, StackTrace? stackTrace}) {
    AuvChatLog.e(e.toString(), error: error ?? e, stackTrace: stackTrace ?? ((error is StackTrace) ? error : null));
  }

  static void printStackTrace() {
    var stackTrace = StackTrace.current;
    var frames = stackTrace.toString().split("\n");
    for (var i = 1; i < frames.length; i++) {
      debugPrint(frames[i]);
    }
  }
}
