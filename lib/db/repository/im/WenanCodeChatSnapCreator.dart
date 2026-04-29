import 'dart:convert';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/utils/WenanCodeImagePickerUtils.dart';
import 'package:wenan/utils/WenanCodePathUtils.dart';



class ChatSnapCreator {
  static int generateLocalId() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static ChatSnap generateLocalSnap(int cid) {
    final snap = ChatSnap();
    snap.chatBoxId = cid;
    snap.localId = generateLocalId();
    snap.owner = Application.currUserId();
    snap.ownerName = Application.commonUser?.nick_name;
    snap.ownerHead = Application.commonUser?.avatar_url;
    snap.createTime = DateTime.now().millisecondsSinceEpoch;
    return snap;
  }

  static void updateSnapCreateTime(ChatSnap snap) {
    snap.createTime = DateTime.now().millisecondsSinceEpoch;
  }

  static ChatSnap createTextSnap(int cid, String text) {
    final snap = generateLocalSnap(cid);
    snap.type = Snap_SnapType.TXT_SNAP.value;
    snap.textContent = text;
    return snap;
  }

  static Future<ChatSnap> createImageSnap(int cid, String filePath) {
    return ImagePickerUtils.getThumbnailAllInfo(imagePath: filePath)
        .then((info) {
      final snap = generateLocalSnap(cid);
      snap.type = Snap_SnapType.IMG_SNAP.value;
      snap.image = AppImage();
      snap.image!.relativePath = PathUtils.relativePathFromAbsolute(filePath);
      snap.image!.width = info.width;
      snap.image!.height = info.height;
      return snap;
    });
  }

  static Future<ChatSnap> createImagesSnap(int cid, List<String> filePaths) {
    return Future.wait(filePaths
            .map((f) => ImagePickerUtils.getThumbnailAllInfo(imagePath: f))
            .toList())
        .then((infos) {
      final snap = generateLocalSnap(cid);
      snap.type = Snap_SnapType.MULTI_IMG_SNAP.value;
      snap.images = <AppImage>[];
      for (int index = 0; index < filePaths.length; ++index) {
        final f = filePaths[index];
        final info = infos[index];
        final img = AppImage()
          ..width = info.width
          ..height = info.height
          ..relativePath = PathUtils.relativePathFromAbsolute(f);
        snap.images!.add(img);
      }
      return snap;
    });
  }

  static Future<ChatSnap> createVideoSnap(int cid, String filePath) {
    return ImagePickerUtils.getThumbnailAllInfo(videoPath: filePath)
        .then((info) {
      final snap = generateLocalSnap(cid);
      snap.type = Snap_SnapType.VIDEO_SNAP.value;
      snap.video = AppVideo();
      snap.video!.relativePath = PathUtils.relativePathFromAbsolute(filePath);
      snap.video!.width = info.width;
      snap.video!.height = info.height;
      return snap;
    });
  }

  static ChatSnap createVoiceSnap(int cid, String filePath) {
    final snap = generateLocalSnap(cid);
    snap.type = Snap_SnapType.VOICE_SNAP.value;
    snap.voice = AppVoice();
    snap.voice!.relativePath = PathUtils.relativePathFromAbsolute(filePath);
    return snap;
  }

  static ChatSnap createStickerSnap(int cid, AppImage sticker) {
    final snap = generateLocalSnap(cid);
    snap.type = Snap_SnapType.STICKER_SNAP.value;
    snap.image = sticker;
    return snap;
  }

  // static ChatSnap createLocationSnap(int cid, AppLocation location) {
  //   final snap = generateLocalSnap(cid);
  //   snap.type = Snap_SnapType.LOCATION_SNAP.value;
  //   snap.location = location;
  //   return snap;
  // }

  static ChatSnap createRedPacketSnap(
      int cid, int type, String message, double amount, int count) {
    final snap = generateLocalSnap(cid);
    snap.type = Snap_SnapType.RED_PACKET_SNAP.value;
    snap.redPacketType = type;
    snap.redPacketMessage = message;
    snap.redPacketAmount = amount;
    snap.redPacketTotalCount = count;
    return snap;
  }

  static ChatSnap createJsonSnap(int cid, String jsonContent) {
    final snap = generateLocalSnap(cid);
    snap.type = Snap_SnapType.JSON_SNAP.value;
    snap.jsonContent = jsonContent;
    return snap;
  }

  static ChatSnap createUserCardJsonSnap(int cid, CommonUser user) {
    Map<String, dynamic> params = {};
    params['category'] = 4;
    params['user_id'] = user.uid;
    params['user_head'] = user.avatar_url;
    params['user_name'] = user.nick_name;
    // params['user_level'] = user.extend?.profile?.level_num;
    params['constellation'] = user.constellation;
    params['age'] = user.extend?.profile?.age;
    params['area'] = user.extend?.profile?.area;
    return createJsonSnap(cid, json.encode(params));
  }

  // static ChatSnap createFeedCardSnap(Feed feed) {
  //   Map<String, dynamic> params = {};
  //   params['category'] = 3;
  //   params['feed_id'] = feed.id;
  //   params['type'] = feed.type;
  //   params['title'] = feed.title ?? feed.text;
  //   params['user_name'] = feed.user.nick_name;
  //   params['count'] = feed.isImageFeed() ? feed.images.length : 0;
  //   String cover = feed.getFeedShowCover(false);
  //   if (cover != null && cover.length > 0)params['cover'] = cover;
  //   return createJsonSnap(0, json.encode(params));
  // }
  //
  // static ChatSnap createSkillCardSnap(UserSkill skill) {
  //   Map<String, dynamic> params = {};
  //   params['category'] = 5;
  //   params['user_id'] = skill.user.uid;
  //   params['user_head'] = skill.user.avatar_url;
  //   params['user_name'] = skill.user.nick_name;
  //   params['user_level'] = skill.user.extend.profile.level_num;
  //   params['skill_id'] = skill.id;
  //   params['skill_desc'] = skill.jsonSkillCardString;
  //   params['skill_unit_price'] = skill.unitPriceString;
  //   return createJsonSnap(0, json.encode(params));
  // }
}
