import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

import '../utils/WenanCodePathUtils.dart';

part 'AppMedia.g.dart';


class AppMedia {
  AppMedia();
  AppMedia.header({this.type = -1});

  AppMedia.image(this.image, {this.type = 1}) {
    String path = image?.img_url ?? "";
    localPath = PathUtils.relativePathFromAbsolute(path);
    AuvChatLog.d("AppMedia AppMedia.image localPath:$localPath");
  }

  AppMedia.imageUrl(String url, {this.type = 1, int imageId = 0}) {
    AppImage appImage = AppImage();
    id = imageId;
    appImage.img_url = url;
    appImage.id = imageId;
    image = appImage;
    if (!StringUtils.isNotEmpty(localPath)) {
      localPath = url;
    }
  }

  AppMedia.localImageUrl(String localUrl) {
    type = 1;
    id = 0;
    AppImage appImage = AppImage();
    appImage.id = 0;
    appImage.img_url = "";
    image = appImage;
    localPath = localUrl;
  }

  AppMedia.video(this.video, {this.type = 2}) {
    String path = video?.video_url ?? "";
    localPath = PathUtils.absolutePathFromRelative(path);
    video!.relativePath = PathUtils.relativePathFromAbsolute(localPath!);
  }

  AppMedia.videoUrl(String url,
      {this.type = 2, int videoId = 0, int videoDur = 0, String? localPath}) {
    AppVideo appVideo = AppVideo();
    appVideo.video_url = url;
    appVideo.id = videoId;
    id = videoId;
    appVideo.duration = videoDur;
    video = appVideo;
    if (!StringUtils.isNotEmpty(localPath)) {
      this.localPath = url;
    } else {
      this.localPath = localPath;
    }
  }

  
  int? id;
  
  int? type;
  AppImage? image;
  AppVideo? video;
  String? localPath;
  
  int? vip;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppMedia.fromJson(Map<String, dynamic> json) =>
      _$AppMediaFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppMediaToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  bool isVideo() {
    return type == 2;
  }

  bool isImage() {
    return type == 1;
  }

  bool isHeader() {
    return type == -1;
  }

  int? getAppMediaShowId() {
    if (id == null || id == 0) {
      if (isImage()) {
        return image?.id;
      } else if (isVideo()) {
        return video?.id;
      } else {
        return 0;
      }
    } else {
      return id;
    }
  }

  String? getAppMediaUrl() {
    if (isImage()) {
      return image?.img_url;
    } else if (isVideo()) {
      return video?.cover_url;
    }
    return "";
  }

  int getAppMediaReallyId() {
    if (isImage()) {
      return image?.id ?? 0;
    } else if (isVideo()) {
      return video?.id ?? 0;
    } else {
      return 0;
    }
  }

  String? getAppMediaLocalUrl() {
    return localPath;
  }

  bool isSameLocalPath(AppMedia data) {
    if (!StringUtils.isNotEmpty(localPath) ||
        !StringUtils.isNotEmpty(data.localPath)) {
      return false;
    }
    return localPath == data.localPath;
  }

  bool isVip() {
    return vip == 1;
  }

  @override
  String toString() {
    return 'AppMedia{id: $id, type: $type, image: $image, video: $video, localPath: $localPath}';
  }
}
