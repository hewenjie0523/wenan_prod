import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/utils/WenanCodeutils.dart';


class ImageURLUtils {
  static const int _SMALL_LEN = 60;
  static const int _MIDDLE_LEN = 150;
  static const int LARGE_LEN = 600;

  // qiniu处理图片命令默认质量95
  static const int _quality = 95;

  static bool _shouldThumbnail(String url) {
    return url.contains('http');
  }

  static Size _sizeWithScreenScale(Size size) {
    return size * 2; // 使用 2 代替 window.devicePixelRatio;
  }

  static Size _aspectFillSizeWithOriginSize(Size originSize, Size containSize) {
    containSize = _sizeWithScreenScale(containSize);

    if (originSize.width == 0 || originSize.height == 0) return Size.zero;
    if (containSize.width == 0 || containSize.height == 0) return Size.zero;
    if (containSize.width > originSize.width ||
        containSize.height > originSize.height) return Size.zero;

    Size ret;
    final originalRatio = originSize.width / originSize.height;
    final containRatio = containSize.width / containSize.height;
    if (containRatio < originalRatio) {
      ret = Size(containSize.height * originalRatio, containSize.height);
    } else {
      ret = Size(containSize.width, containSize.width / originalRatio);
    }
    return ret;
  }

  static String imageSmallURL(String url) {
    return imageURLWithLen(url, _SMALL_LEN);
  }

  static String imageMiddleURL(String url) {
    return imageURLWithLen(url, _MIDDLE_LEN);
  }

  static String imageLargeURL(String url) {
    return imageURLWithLen(url, LARGE_LEN);
  }

  static String imageURLWithLen(String url, [int len = 0]) {
    return _imageURL(url, Size(len.toDouble(), len.toDouble()));
  }

  /// 不指定分辨率，原图打水印
  static String imageURLOrigin(String url) {
    //%7C ==> |
    return "$url${url.contains('?') ? '%7C' : '?%7C'}watermark/2/text/${Utils.base64Encode(AppConfig.appName)}/fontsize/200/fill/d2hpdGU=/dissolve/20";
  }

  /// 七牛处理图片url命令
  static String _imageURL(String url, Size size) {
    if (!_shouldThumbnail(url)) return url;

    String ret;
    size = _sizeWithScreenScale(size);
    //%7C ==> |
    ret = '$url${url.contains('?') ? '%7C' : '?'}imageView2/3';
    if (size.width > 0) ret += '/w/${size.width.toInt()}';
    if (size.height > 0) ret += '/h/${size.height.toInt()}';
    ret += '/quality/$_quality/ignore-error/1';
    ret +=
    '%7Cwatermark/2/text/${Utils.base64Encode(AppConfig.appName)}/fontsize/200/fill/d2hpdGU=/dissolve/20';
    ret += '%7CimageMogr2/auto-orient';
    // 如原图是gif格式，直接转webp会出错，需将imageMogr2/format/webp的命令用管道重新拼在后面才可用
    if (Platform.isAndroid) ret += '/format/webp';

    return ret;
  }



  static String videoSmallURL(
      String url, [
        int originWidth = 0,
        int originHeight = 0,
      ]) {
    return videoURLWithLen(url, _SMALL_LEN, originWidth, originHeight);
  }

  static String videoMiddleURL(
      String url, [
        int originWidth = 0,
        int originHeight = 0,
      ]) {
    return videoURLWithLen(url, _MIDDLE_LEN, originWidth, originHeight);
  }

  static String videoLargeURL(
      String url, [
        int originWidth = 0,
        int originHeight = 0,
      ]) {
    return videoURLWithLen(url, LARGE_LEN, originWidth, originHeight);
  }

  static String videoURLWithLen(
      String url, [
        int len = 0,
        int originWidth = 0,
        int originHeight = 0,
      ]) {
    final originSize = Size(originWidth.toDouble(), originHeight.toDouble());
    final containSize = Size(len.toDouble(), len.toDouble());
    return _videoURL(url, originSize, containSize);
  }

  static String _videoURL(
      String url, [
        Size originSize = Size.zero,
        Size containSize = Size.zero,
      ]) {
    if (!_shouldThumbnail(url)) return url;
    String ret;
    final size = _aspectFillSizeWithOriginSize(originSize, containSize);
    if (size == Size.zero ||
        min(size.width, size.height) > 2160 ||
        max(size.width, size.height) > 3840 ||
        !url.contains('?')) {
      ret = url;
    } else {
      ret = '$url${url.endsWith('/') ? '' : '/'}w/${size.width.toInt()}/h/${size.height.toInt()}';
    }

//    AuvChatLog.d('ImageURLUtils - _videoURL : $ret');
//    AuvChatLog.d('ImageURLUtils - _videoURL - Stack Trace: \n\t${StackTrace.current}');
    return ret;
  }

  static String videoGifURL(
      String videoURL, {
        double minWidth = 0,
        double minHeight = 0,
        int quality = 95,
      }) {
    final size = _sizeWithScreenScale(Size(minWidth, minHeight));
    final format = Platform.isIOS ? 'gif' : 'webp';
    String ret = '$videoURL?imageView2/3';
    if (size.width > 0) ret += '/w/${size.width.toInt()}';
    if (size.height > 0) ret += '/h/${size.height.toInt()}';
    ret += '/ignore-error/1';
    ret += '|imageMogr2/format/$format/quality/$quality/ignore-error/1';

//    AuvChatLog.d('ImageURLUtils - videoGifURL : $ret');
//    AuvChatLog.d('ImageURLUtils - videoGifURL - Stack Trace: \n\t${StackTrace.current}');
    return ret;
  }
}
