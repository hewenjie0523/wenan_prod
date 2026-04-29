import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:date_format/date_format.dart' as DataFormat;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;

import 'WenanCodelog.dart';

typedef NotNullBlock<T> = void Function(T obj);

class Utils {
  static void nullSafe<T>(T? obj, {VoidCallback? nullBlock, NotNullBlock<T>? notNullBlock}) {
    if (obj != null) {
      notNullBlock?.call(obj);
    } else {
      nullBlock?.call();
    }
  }

  static bool isEmpty(dynamic param) {
    if (param == null) return true;
    if (param is String) return param.isEmpty;
    if (param is List) return param.isEmpty;
    if (param is Map) return param.isEmpty;
    return false;
  }

  static bool isEmptyString(String? s) => s == null || s.isEmpty;

  static bool isEmptyList(List? l) => l == null || l.isEmpty;

  static bool isEmptySet(Set? s) => s == null || s.isEmpty;

  static bool isEmptyMap(Map? m) => m == null || m.isEmpty;

  ///Generate MD5 hash
  static String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static String getLang(BuildContext context) {
    Locale? ret;
    try {
      ret = Localizations.localeOf(context);
    } catch (e) {
      print('Utils - getLang error : $e');
      ret = window.locale;
    }
    return '${ret.countryCode}_${ret.languageCode}';
  }

  static String formatDay(int timeInMills) {
    return DataFormat.formatDate(DateTime.fromMillisecondsSinceEpoch(timeInMills), ['yyyy', '-', 'mm', '-', 'dd']);
  }

  static void setStatusBarStyle(bool light) {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style;
      if (light) {
        style = const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,

            ///这是设置状态栏的图标和字体的颜色
            ///Brightness.light  一般都是显示为白色
            statusBarIconBrightness: Brightness.light);
      } else {
        style = const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,

            ///Brightness.dark 一般都是显示为黑色
            statusBarIconBrightness: Brightness.dark);
      }
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }

  static int? stringToInt(String? number) => number == null ? null : int.tryParse(number);

  static String? stringFromInt(int? number) => number?.toString();

  static bool? parseBool(dynamic object) {
    if (object == null) {
      return null;
    } else if (object is bool) {
      return object;
    } else if (object is int) {
      return object != 0;
    } else {
      int? value = stringToInt(object);
      return value == null ? false : value != 0;
    }
  }

  static int? parseInt(dynamic object) {
    if (object == null) {
      return null;
    } else if (object is int) {
      return object;
    } else if (object is double) {
      return double.tryParse(object.toString())?.toInt();
    } else {
      return stringToInt(object as String);
    }
  }

  static int parseIntDef(dynamic object, int def) {
    int? val = parseInt(object);
    return val ?? def;
  }

  static double? parseDouble(dynamic object) {
    if (object == null) {
      return null;
    } else if (object is double) {
      return object;
    } else if (object is String) {
      return double.tryParse(object);
    } else if (object != null) {
      return object.toDouble();
    } else {
      return 0;
    }
  }

  static String parseString(dynamic object) {
    if (object is String) {
      return object;
    } else if (object != null) {
      return object.toString();
    } else {
      return '';
    }
  }

  static bool dynamicToBoolNotNull(dynamic number) => Utils.parseBool(number) ?? false;

  static int dynamicToIntNotNull(dynamic number, {int defaultValue = 0}) => Utils.parseInt(number) ?? defaultValue;

  static double dynamicToDoubleNotNull(dynamic number) => Utils.parseDouble(number) ?? 0;

  static Future<String> callPlatformMethodSafely(MethodChannel methodChannel, String methodName,
      [dynamic arguments]) async {
    try {
      AuvChatLog.d("callPlatformMethodSafely:$methodName");
      return await methodChannel.invokeMethod(methodName, arguments);
    } catch (e) {
      print(e);
    }
    return "";
  }

  static String rgba2argb(String colorStr) {
    try {
      AuvChatLog.d('colorStr:$colorStr');
      if (colorStr.startsWith("0x") || colorStr.startsWith("0X")) {
        colorStr = colorStr.substring(2);
      }
      if (colorStr.startsWith("#")) {
        colorStr = colorStr.substring(1);
      }
      if (colorStr.length == 8) {
        String result = '${colorStr.substring(6, 8)}${colorStr.substring(1, 6)}';
        AuvChatLog.d("argb:" + result);
        return result;
      }
    } catch (e) {
      print(e);
    }
    return colorStr;
  }

  static Color parseColor(String colorStr) {
    try {
      if (colorStr.startsWith("#")) {
        colorStr = colorStr.substring(1);
      }
      if (colorStr.length == 6) {
        colorStr = 'FF$colorStr';
      }
      int color = int.parse(colorStr, radix: 16);
      return Color(color);
    } catch (e) {
      print(e);
    }
    return Colors.transparent;
  }

  static Future<bool> openURL(String url) async {
    if (await Launcher.canLaunch(url)) {
      return await Launcher.launch(url);
    }
    return false;
  }

  static callSetStateSafely(State state, VoidCallback fn) {
    // ignore: invalid_use_of_protected_member
    if (state != null && state.mounted) state.setState(fn);
//    AuvChatLog.d('callSetStateSafely - ${StackTrace.current}');
  }

  static String convertStringToUri(String key) {
    return Uri.encodeComponent(key);
  }

  static String decodeStringToUri(String key) {
    return Uri.decodeComponent(key);
  }

  static Future<String> getTempFilePath(String fileName) async {
    Directory? saveDir =
        Platform.isIOS ? await getApplicationDocumentsDirectory() : await getExternalStorageDirectory();
    String saveFile = join(saveDir?.path ?? "", fileName);
    return saveFile;
  }

  static String join(String path, String s) {
    if (!path.endsWith('/')) {
      return '$path/$s';
    } else {
      return '$path$s';
    }
  }

  static Future<double> getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    //  File
    if (file is File && file.existsSync()) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory && file.existsSync()) {
      List children = file.listSync();
      double total = 0;
      if (children.isNotEmpty)
        for (FileSystemEntity child in children) {
          total += await getTotalSizeOfFilesInDir(child);
        }
      return total;
    }
    return 0;
  }

  static Future<Null> requestPermission(FileSystemEntity file) async {
    PermissionStatus status = await Permission.storage.status;
    await delDir(file);
  }

  static Future<Null> delDir(FileSystemEntity file) async {
    if (file is Directory && file.existsSync()) {
      print(file.path);
      final List<FileSystemEntity> children = file.listSync(recursive: true, followLinks: true);
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    try {
      if (file.existsSync()) {
        await file.delete(recursive: true);
      }
    } catch (err) {
      print(err);
    }
  }

  static String base64Encode(String data) {
    var bytes = utf8.encode(data);
    var base64Str = base64.encode(bytes);
    return base64Str;
  }

  static String base64Decode(String data) {
    var base64Str = base64.decode(data);
    return utf8.decode(base64Str);
  }

  static String base64UrlEncode(String data) {
    return base64Encode(data); //.replaceAll('-', '+').replaceAll('/', '_');
  }

  static String? getParamFromUrl(String url, String paramName) {
    try {
      return Uri.parse(url).queryParameters[paramName];
    } catch (e) {
      AuvChatLog.printE(e);
    }
    return null;
  }
}
