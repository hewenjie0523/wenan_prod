import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_url_utils.dart';

enum ImageClipType {
  IMAGE_CUSTOM,
  IMAGE_S,
  IMAGE_M,
  IMAGE_L,
  IMAGE_NONE,
}

class ImageLoader {
  static CachedNetworkImage loadDefault(String url,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity,
      ImageClipType type = ImageClipType.IMAGE_NONE,
      int length = 0,
      ImageWidgetBuilder? imageBuilder,
      PlaceholderWidgetBuilder? placeholder,
      LoadingErrorWidgetBuilder? errorWidget}) {
    // AuvChatLog.d("ImageLoader.loadDefault:$url");
    String cover = url;
    switch (type) {
      case ImageClipType.IMAGE_CUSTOM:
        if (length > 0) {
          cover = ImageURLUtils.imageURLWithLen(url, length);
        } else {
          cover = ImageURLUtils.imageSmallURL(url);
        }
        break;
      case ImageClipType.IMAGE_S:
        cover = ImageURLUtils.imageSmallURL(url);
        break;
      case ImageClipType.IMAGE_M:
        cover = ImageURLUtils.imageMiddleURL(url);
        break;
      case ImageClipType.IMAGE_L:
        cover = ImageURLUtils.imageLargeURL(url);
        break;
      default:
        cover = ImageURLUtils.imageURLOrigin(url);
      // case ImageClipType.IMAGE_NONE:
      //   if (length > 0) {
      //     cover = ImageURLUtils.imageURLWithLen(url, length);
      //   } else {
      //     cover = ImageURLUtils.imageSmallURL(url);
      //   }
      //   break;
    }
    // AuvChatLog.d("loadDefault:$cover",tag:"imageLoader");
    // AuvChatLog.d("ImageLoader.loadDefault,cover:$cover");
    return CachedNetworkImage(
      imageUrl: cover,
      height: height,
      width: width,
      fit: fit,
      imageBuilder: imageBuilder,
      placeholder: placeholder ??
          (context, url) => Container(
                color: AppColor.color_cccccc,
              ),
      errorWidget: errorWidget ??
          (context, url, error) => Container(
                color: AppColor.color_cccccc,
              ),
    );
  }

  static Image loadLocalImage(String fileName,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity,
      Color? color}) {
    return Image(
      image: AssetImage("assets/images/$fileName.png"),
      fit: fit,
      width: width,
      height: height,
      color: color,
    );
  }

  static AssetImage assetImage(String fileName) {
    return AssetImage("assets/images/$fileName.png");
  }

  static Image loadFileImage(String fileName,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity}) {
    return Image(
      image: FileImage(File(fileName)),
      fit: fit,
      width: width,
      height: height,
    );
  }

  static Widget loadOvalImage(String filePath,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity,
      ImageClipType type = ImageClipType.IMAGE_NONE,
      int length = 0}) {
    return ImageLoader.loadDefault(
      filePath,
      width: width,
      height: height,
      type: type,
      length: length,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(50)),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: AppColor.color_cccccc,
          shape: BoxShape.circle,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: AppColor.color_cccccc,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  static Widget loadRoundCornerImage(
      String filePath, BorderRadiusGeometry borderRadius,
      {BoxFit fit = BoxFit.cover,
      double height = double.infinity,
      double width = double.infinity,
      ImageClipType type = ImageClipType.IMAGE_NONE,
      int length = 0}) {
    return ImageLoader.loadDefault(
      filePath,
      width: width,
      height: height,
      type: type,
      length: length,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: BoxShape.rectangle,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }

  static CachedNetworkImage loadNoPlaceHolder(String url,
      {BoxFit fit = BoxFit.fill,
      double height = double.infinity,
      double width = double.infinity}) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
    );
  }

  static String getImagePath(String imageName) {
    return "assets/images/$imageName.png";
  }
}
