import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/data/AppMedia.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/view/WenanCodehome_page.dart';
import 'package:wenan/view/profile/view/WenanCodecustom_drag_sort_view.dart';
import '../../base/WenanCodeUploadManager.dart';
import '../../data/AppImage.dart';
import '../../data/AppVideo.dart';
import '../../data/UploadMediaData.dart';
import '../../http/ProfileApi.dart';
import '../../http/WenanCodedio_helper.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../res/WenanCodestyles.dart';
import '../../utils/WenanCodeCameraPickerUtils.dart';
import '../../utils/WenanCodeImagePickerUtils.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodeimage_url_utils.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodestring_format.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../../utils/WenanCodeutils.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import '../call/chat/mediaViewer/WenanCodeProfileMediaPhotoViewerDataSource.dart';
import '../call/chat/mediaViewer/WenanCodeProfileMediaVideoViewerDataSource.dart';
import 'package:wenan/StringTranslate.dart';

class MediaEditView extends ConsumerStatefulWidget {
  final List<AppMedia> medias;

  const MediaEditView(this.medias, {Key? key}) : super(key: key);

  @override
  createState() {
    return _MediaEditViewState();
  }
}

class _MediaEditViewState extends ConsumerState<MediaEditView> {
  List<ProfileMediaBean> list = [];

  @override
  void initState() {
    super.initState();
    var medias = widget.medias;
    for (var element in medias) {
      AuvChatLog.d("MediaEditView initState media :$element");
      list.add(ProfileMediaBean(element));
    }
    var mediaIds = getUploadIds();
    AuvChatLog.d("MediaEditPage doUploads initState datas : $mediaIds");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.color111523,
        appBar: AuvCupertinoNavigationBar(
          middle: Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_media_title).replaceFirst("s1%", '6').replaceFirst("s2%", list.length.toString()),
            style: AppTextStyle.white18,
          ),
          leading: UIUtils.navigationCommonBackButton(
              () => doUploads(), //FluroRouter.appRouter.pop(context),
              color: AppColor.white,
              leftPadding: 0),
          backgroundColor: AppColor.color111523,
        ),
        body: CustomDragSortView(
          list,
          space: 5,
          onItemClick: (index) {
            var onMedia = list[index].media;
            if (onMedia.isImage()) {
              FeedMediaPhotoViewerDataSource.showViewer(context,
                  selectItem: onMedia.image);
            } else if (onMedia.isVideo()) {
              AuvChatLog.d("CustomDragSortView  onItemClick  ${onMedia.video}");
              List<AppVideo> videos = [onMedia.video!];
              FeedMediaVideoViewerDataSource.showViewer(context, videos);
            }
          },
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            AppMedia media = list[index].media;
            return _initItemBuilder(media, index);
          },
          initBuilder: (BuildContext context) {
            return _initInnWellBuilder();
          },
          onDragListener: (CustomMotionEvent event, double itemWidth) {
            if (!list.first.isBeFirst) {
              return true;
            }
            return false;
          },
        ));
  }

  _initItemBuilder(AppMedia media, int index){
    return Stack(
      fit: StackFit.expand,
      children: [
        _mediaContent(media),
        Positioned(
            right: 9,
            top: 8,
            child: Visibility(
              visible: index == 0,
              child: Container(
                  height: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    color: AppColor.black_40p,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_head),
                      style: AppTextStyle.white12,
                    ),
                  )),
            )),
        Positioned(
            right: 9,
            top: 8,
            child: Visibility(
                visible: index > 0,
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: InkWell(
                    onTap: () => Utils.callSetStateSafely(this, () {
                      list.removeAt(index);
                    }),
                    child: ImageLoader.loadLocalImage(
                        "profile/wceDniaun3_Yrfefs8_jmmeBdmiOak_YcHlzobsVeTdp_oiicTosnM",
                        width: 18,
                        height: 18),
                  ),
                ))),
        Positioned(
            left: 6,
            top: 8,
            child: Visibility(
              visible: media.isVideo(),
              child: Container(
                height: 20,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                  color: AppColor.black_40p,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    ImageLoader.loadLocalImage(
                        "profile/wReWnOapnn_KrNefsB_Pmqerdgigah_ev9ihd8eaoK_IbVtZnH_5iDchoLno",
                        width: 8,
                        height: 8),
                    AppGap.hGap4,
                    Text(
                      StringUtils.formatDuration(Duration(
                          seconds: media.video?.duration ?? 0)),
                      style: AppTextStyle.white12,
                    ),
                  ],
                ),
              ),
            )),
        Align(
          alignment: Alignment.center,
          child: media.getAppMediaReallyId() > 0
              ? Container()
              : const SizedBox(
              width: 12,
              height: 12,
              child: CupertinoActivityIndicator(
                radius: 8,
                color: AppColor.color_cccccc,
              )),
        )
      ],
    );
  }

  _initInnWellBuilder(){
    return InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          _showImagesPanel();
        },
        child: Container(
          width: 108,
          height: 144,
          decoration: BoxDecoration(
            color: AppColor.color979797_20p,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: ImageLoader.loadLocalImage("profile/w8ebntaMn9_mrJe9sY_RmHeVd2iuau_Ua0dsdO_Xi0cqotnm",
                width: 24, height: 24),
          ),
        ));
  }

  _takeCamera() async {
    Navigator.pop(context);
    CameraPickerUtils.showNativeCameraPicker(
      context,
      type: CameraPickerType.all,
      callback: (mediaType, data) {
        AuvChatLog.d("MediaEditPage _takePhoto  data:$data");
        if (data != null) {
          if (data is AppImage) {
            _uploadImage(data);
          } else if (data is AppVideo) {
            _uploadVideo(data);
          }
        }
      },
    );
  }

  _uploadVideo(AppVideo video) {
    var appMedia = AppMedia.video(video);
    var profileMediaBean = ProfileMediaBean(appMedia);
    Utils.callSetStateSafely(this, () {
      list.add(profileMediaBean);
    });
    _uploadVideoNet(profileMediaBean).then((success) {
      if (success) {
        Utils.callSetStateSafely(this, () {});
      } else {
        Utils.callSetStateSafely(this, () {
          list.remove(profileMediaBean);
        });
        Fluttertoast.showToast(msg: "upload fail");
      }
    });
  }

  _uploadImage(AppImage image) {
    var appMedia = AppMedia.image(image);
    var profileMediaBean = ProfileMediaBean(appMedia);
    Utils.callSetStateSafely(this, () {
      list.add(profileMediaBean);
    });
    _uploadImageNet(profileMediaBean).then((success) {
      if (success) {
        Utils.callSetStateSafely(this, () {});
      } else {
        Utils.callSetStateSafely(this, () {
          list.remove(profileMediaBean);
        });
        Fluttertoast.showToast(msg: "upload fail");
      }
    });
  }

  Future<bool> _uploadImageNet(ProfileMediaBean bean) async {
    final rsp = await UploadManager.instance
        .upload(
      bean.media.getAppMediaLocalUrl() ?? "",
      UploadType.image,
    )
        .last;
    if (rsp.result?.img != null) {
      var imageId = Utils.parseInt(rsp.result?.img?.id)!;
      if (bean.media.isImage()) {
        bean.media.image?.id = imageId;
      }
      // bean.media.image?.img_url = rsp.result?.img?.url;
      AuvChatLog.d("_uploadImage ProfileMediaBean  $bean");
      return imageId > 0;
    } else {
      return false;
    }
  }

  _takeImagePicker() async {
    Navigator.pop(context);
    ImagePickerUtils.showNativeImagePicker(
      context,
      callback: (mediaType, mediaList) {
        if (!Utils.isEmpty(mediaList)) {
          var selected = mediaList.first;
          if (selected is AppImage) {
            _uploadImage(selected);
          } else if (selected is AppVideo) {
            _uploadVideo(selected);
          }
        }
      },
    );
  }


  Future<bool> _uploadVideoNet(ProfileMediaBean bean) async {
    final rsp = await UploadManager.instance
        .upload(
          bean.media.getAppMediaLocalUrl() ?? "",
          UploadType.video,
        )
        .last;
    if (rsp.result?.video != null) {
      var videoId = Utils.parseInt(rsp.result?.video?.id)!;
      var videoUrl = rsp.result?.video?.url??"";
      if (bean.media.isVideo()) {
        bean.media.video?.id = videoId;
        bean.media.video?.video_url = videoUrl;
      }
      // bean.media.image?.img_url = rsp.result?.img?.url;
      AuvChatLog.d("_uploadVideo ProfileMediaBean  $bean");
      return videoId > 0;
    } else {
      return false;
    }
  }

  void _showImagesPanel() {
    AuvChatLog.d("_showImagesPanel _showImagesPanel");
    var mainWidget = Column(
      children: [
        UIUtils.commonButton(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_take_photo),
          16,
          () => _takeCamera(),
        ),
        AppGap.vGap16,
        UIUtils.commonButton(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_choose_gallery),
          16,
          () => _takeImagePicker(),
        ),
        AppGap.vGap20,
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_cancel),
              style: AppTextStyle.white18Bold,
            )),
        AppGap.vGap30,
      ],
    );
    UIUtils.showBottomDialog(context, "", mainWidget,PageRouter.EditUserInfoBtmDlg);
  }

  String getUploadIds() {
    if (list.isNotEmpty) {
      List<UploadMediaData> medias = [];
      for (var element in list) {
        var mid = element.media.getAppMediaReallyId();
        var mtype = element.media.type ?? 0;
        if (mid > 0 && mtype > 0) {
          var media = UploadMediaData();
          media.id = mid;
          media.type = mtype;
          medias.add(media);
        }
      }
      return json.encode(medias);
    }
    return "";
  }

  Future<void> doUploads() async {
    try {
      var mediaIds = getUploadIds();
      AuvChatLog.d("MediaEditPage doUploads datas : $mediaIds");
      ProfileApi(DioHelper.getInstance())
          .resetMedias(mediaIds, 0)
          .then((result) {
        if (result.code == 0) {
          AuvChatLog.d("MediaEditPage doUploads success ");
          ref.refresh(commonUserNotify);
          FluroRouter.appRouter.pop(context);
        } else {
          Fluttertoast.showToast(msg: "Update photo error");
          FluroRouter.appRouter.pop(context);
        }
      }).onError((error, stackTrace){
        FluroRouter.appRouter.pop(context);
      });
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
      Fluttertoast.showToast(msg: "Update photo error");
      FluroRouter.appRouter.pop(context);
    }
  }

  Widget _mediaContent(AppMedia media) {
    if (media.isImage()) {
      return Container(
          width: 108,
          height: 144,
          color: AppColor.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Utils.isEmpty(media.localPath)
                ? ImageLoader.loadDefault(media.getAppMediaUrl() ?? "",
                    width: 108, height: 144)
                : Image(
                    fit: BoxFit.cover,
                    image: FileImage(File(media.localPath!))),
          ));
    } else if (media.isVideo()) {
      return Container(
          width: 108,
          height: 144,
          color: AppColor.transparent,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Utils.isEmpty(media.localPath)
                  ? CachedNetworkImage(
                      imageUrl: ImageURLUtils.videoMiddleURL(
                        media.video!.cover_url!,
                        media.video!.width ?? 0,
                        media.video!.height ?? 0,
                      ),
                      fit: BoxFit.cover,
                    )
                  : FutureBuilder(
                      future: ImagePickerUtils.getThumbnail(
                        videoPath: media.localPath,
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data! as Image;
                        } else {
                          return Container();
                        }
                      },
                    )));
    } else {
      return Container();
    }
  }
}

class ProfileMediaBean extends CustomDragBean {
  final AppMedia media;

  ProfileMediaBean(this.media) {
    isBeFirst = !media.isVideo();
  }

  @override
  String toString() {
    return 'ProfileMediaBean{media: $media}';
  }
}
