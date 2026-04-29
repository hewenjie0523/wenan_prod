import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/WenanCodehome_page.dart';
import '../../base/WenanCodeUploadManager.dart';
import '../../data/AppImage.dart';
import '../../data/BaseRsp.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../utils/WenanCodeImagePickerUtils.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';


class EditUserInfoPage extends ConsumerStatefulWidget {
  const EditUserInfoPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _EditUserInfoPageState();
  }
}

class _EditUserInfoPageState extends ConsumerState<EditUserInfoPage> {
  int imageId = -1;
  String headUrl = "";
  String nickname = "";
  String birthday = "";
  String localBirthday = "";
  String signature = Application.commonUser?.signature ?? "";

  late final TextEditingController _controller;
  final FocusNode _editFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF7D55ED),
        appBar: AuvCupertinoNavigationBar(
          middle: Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_edit_info),
            style: AppTextStyle.white18,
          ),
          leading: UIUtils.navigationCommonBackButton(
              () => FluroRouter.appRouter.pop(context),
              color: AppColor.white,
              leftPadding: 0),
          backgroundColor: const Color(0xFF7D55ED),
        ),
        body: Column(
          children: [AppGap.vGap50, _photoHeadView(), AppGap.vGap64, _detailInfoLayout()],
        ));
  }

  Widget _photoHeadView() {
    AuvChatLog.d("soggyAppEditUserInfoPage _photoView ");
    CommonUser user = Application.commonUser!;
    Widget childWidget = SizedBox(
      height: 120,
      width: 120,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Utils.isEmpty(headUrl)
                ? ImageLoader.loadOvalImage(user.avatar_url ?? "",
                    height: 120, width: 120, type: ImageClipType.IMAGE_M)
                : ClipOval(
                    child: ImageLoader.loadFileImage(headUrl,
                        width: 120, height: 120)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ImageLoader.loadLocalImage("profile/wQeensaUnJ_GrSeAsd_leLd5i1t5_VcUaAmie6rUaY_7iYceoznv",
                width: 36, height: 36),
          ),
        ],
      ),
    );

    return InkWell(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onTap: () => _showImagesPanel(),
      child: childWidget,
    );
  }

  Widget _detailInfoLayout() {
    AuvChatLog.d("soggyAppEditUserInfoPage _infolay");
    CommonUser user = Application.commonUser!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColor.color979797_10p),
      child: Column(
        children: [
          UIUtils.editUserInfoRow(
              StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_nickname),
              Utils.isEmpty(nickname) ? user.nick_name ?? "" : nickname,
              "profile/wNewnWaRn9_urye9sV_OefdniRtJ_mues2eYrI_gigcCoTnT", () {
            _showEditNickNamePanel(
                Utils.isEmpty(nickname) ? user.nick_name ?? "" : nickname);
          }),
          UIUtils.editUserInfoRow(
              StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_birthday),
              Utils.isEmpty(birthday) ? user.birthday ?? "" : birthday,
              "profile/wMeJnIaonO_drJebsd_GeadNiStO_Sbbi2rktghndkaJyL_UiQcBobnn", () {
            _showEditBirthdayPanel(
                Utils.isEmpty(birthday) ? user.birthday ?? "" : birthday);
          }),
          // UIUtils.editUserInfoRow(
          //     StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_location),
          //     user.getCountry()?.name ?? "",
          //     "profile/wRexnKaEn4_ErQeSsU_qeJd1ict7_tleo3ceaStli4oLn5_Ni3cKosnz",
          //     () {},
          //     isMore: false),
          UIUtils.editUserInfoRow(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_bio), signature,
              "profile/wUejn3aUnA_ergeqsc_Tekd2iNtA_Ppie2ne_3iEcIo4nW", () {
            _showEditSignaturePanel(signature);
          }, isLast: true)
        ],
      ),
    );
  }

  void _showImagesPanel() {
    AuvChatLog.d("_showImagesPanel _showImagesPanel");
    var mainWidget = Column(
      children: [
        UIUtils.commonButton(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_take_photo),
          16,
          () => _takeCameraPage(),
        ),
        AppGap.vGap16,
        UIUtils.commonButton(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_choose_gallery),
          16,
          () => _takeImagePickerPage(),
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
    UIUtils.showBottomDialog(
        context, "", mainWidget, PageRouter.EditUserInfoBtmDlg);
  }

  _takeCameraPage() async {
    String imagePath =
        await PageRouter.pushPage(context, PageRouter.AvatarCameraPage);
    if (imagePath != '') {
      Navigator.pop(context);
      AppImage data = AppImage();
      data.img_url = imagePath;
      _uploadAvatar(data).then((success) {
        Navigator.pop(context);
        if (success) {
          try {
            CommonUser user = Application.commonUser!;
            ref
                .read(userViewModel)
                .editUserInfo(imageId,
                    Utils.isEmpty(nickname) ? user.nick_name ?? "" : nickname)
                .then((result) => parseUserResp(result, media: true));
          } catch (e) {
            e.toString();
          }
        }
      });
    }
  }

  _takeImagePickerPage() async {
    Navigator.pop(context);
    ImagePickerUtils.showNativeImagePicker(
      context,
      callback: (mediaType, mediaList) {
        if (!Utils.isEmpty(mediaList)) {
          var selected = mediaList.first;
          if (selected is AppImage) {
            _uploadAvatar(selected).then((success) {
              Navigator.pop(context);
              if (success) {
                try {
                  CommonUser user = Application.commonUser!;
                  ref
                      .read(userViewModel)
                      .editUserInfo(
                          imageId,
                          Utils.isEmpty(nickname)
                              ? user.nick_name ?? ""
                              : nickname)
                      .then((result) => parseUserResp(result, media: true));
                } catch (e) {
                  e.toString();
                }
              }
            });
          }
        }
      },
    );
  }

  Future<bool> _uploadAvatar(AppImage image) async {
    var imgUrl = image.img_url ?? "";
    if (Utils.isEmpty(imgUrl)) return false;

    SharedViewLogic.showLoadingDialog(context, canCancel: false);

    Utils.callSetStateSafely(this, () {
      headUrl = imgUrl;
    });

    final rsp = await UploadManager.instance
        .upload(
          imgUrl,
          UploadType.image,
        )
        .last;
    if (rsp.result?.img != null) {
      imageId = Utils.parseInt(rsp.result?.img?.id)!;
      return imageId > 0;
    } else {
      return false;
    }
  }

  void _showEditNickNamePanel(String nickname) {
    AuvChatLog.d("_showImagesPanel _showImagesPanel");
    _controller.text = nickname;
    var mainWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
          height: 80,
          child: TextField(
            controller: _controller,
            focusNode: _editFocus,
            decoration: InputDecoration(
              hintText: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_nickname),
              hintStyle: AppTextStyle.white20Bold_20p,
              fillColor: AppColor.white_20p,
              suffixIcon: IconButton(
                  //如果文本长度不为空则显示清除按钮
                  onPressed: () {
                    Utils.callSetStateSafely(this, () {
                      _controller.clear();
                    });
                  },
                  icon: const Icon(Icons.cancel, color: Colors.grey)),
              filled: true,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide.none),
            ),
            buildCounter: (context,
                    {currentLength = 0, maxLength, isFocused = false}) =>
                Text(
              "$currentLength/$maxLength",
              style: const TextStyle(color: AppColor.colorF8_40p, fontSize: 14),
            ),
            maxLength: 15,
            maxLines: 1,
            style: AppTextStyle.white20Bold,
            onChanged: (value) {
              AuvChatLog.d("_nameView TextField onChanged() > $value");
              Utils.callSetStateSafely(this, () {
                nickname = value;
              });
            },
          ),
        ),
        AppGap.vGap27,
        _confirmBtn(0),
        AppGap.vGap27,
      ],
    );
    UIUtils.showBottomDialog(context, StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_nickname),
        mainWidget, PageRouter.EditUserInfoBtmDlg);
  }

  void _showEditSignaturePanel(String signature) {
    AuvChatLog.d("_showImagesPanel _showImagesPanel");
    _controller.text = signature;
    var mainWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 24),
          height: 136,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: TextField(
            controller: _controller,
            focusNode: _editFocus,
            decoration: InputDecoration(
              fillColor: AppColor.white_20p,
              filled: true,
              hintText: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_about_me),
              hintStyle: AppTextStyle.white20Bold_20p,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide.none),
              // fillColor: AppColor.white_20p,
            ),
            maxLength: 150,
            maxLines: 4,
            style: AppTextStyle.white20Bold,
            buildCounter: (context,
                    {currentLength = 0, maxLength, isFocused = false}) =>
                Text(
              "$currentLength/$maxLength",
              style:
                  const TextStyle(color: AppColor.color_cccccc, fontSize: 14),
            ),
            onChanged: (value) {
              AuvChatLog.d("_signature TextField onChanged() > $value");
              Utils.callSetStateSafely(this, () {
                signature = value;
              });
            },
          ),
        ),
        AppGap.vGap27,
        _confirmBtn(1),
        AppGap.vGap27,
      ],
    );
    UIUtils.showBottomDialog(context, StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_bio),
        mainWidget, PageRouter.EditUserInfoBtmDlg);
  }

  void _showEditBirthdayPanel(String birthday) {
    var initTime = DateTime(
        DateTime.now().year - 18, DateTime.now().month, DateTime.now().day);
    if (Utils.isEmpty(birthday)) {
      birthday = DateFormat('yyyy-MM-dd').format(initTime);
      localBirthday = birthday;
    } else {
      localBirthday = birthday;
    }

    var mainWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          margin: const EdgeInsets.only(top: 20),
          child: _cupertinoDatePicker(CupertinoDatePickerMode.date, initTime),
        ),
        AppGap.vGap27,
        _confirmBtn(2),
        AppGap.vGap27,
      ],
    );
    UIUtils.showBottomDialog(context, StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_birthday),
        mainWidget, PageRouter.EditUserInfoBtmDlg);
  }

  Widget _cupertinoDatePicker(CupertinoDatePickerMode mode, DateTime initTime) {
    return CupertinoTheme(
      data: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      child: CupertinoDatePicker(
        mode: mode,
        initialDateTime: initTime,
        // DateTime(
        //     DateTime.now().year - 20, DateTime.now().month, DateTime.now().day),
        // 默认选中日期
        minimumDate: DateTime(1970, 01, 01),
        // 最小可选日期
        maximumDate: DateTime.now(),
        // 最大可选日期
        minimumYear: 1970,
        // 最小可选年份
        maximumYear: DateTime.now().year - 18,
        // 最大可选年份
        use24hFormat: true,
        // 是否采用24小时制
        backgroundColor: Colors.transparent,
        // 背景色
        onDateTimeChanged: (dayTime) {
          print("onDateTimeChanged $dayTime");
          localBirthday = DateFormat('yyyy-MM-dd').format(dayTime);
          AuvChatLog.d("_cupertinoDatePicker localBirthday :$localBirthday");
        },
      ),
    );
  }

  Widget _confirmBtn(int way) {
    AuvChatLog.d("EditUserInfoPage _confirmBtn ");
    return ElevatedButton(
      onPressed: () {
        //0 nick name
        if (way == 0) {
          if (Utils.isEmpty(_controller.text)) {
            Fluttertoast.showToast(msg: "nickname is empty");
          } else {
            Navigator.pop(context);
            _editFocus.unfocus();
            Utils.callSetStateSafely(this, () {
              nickname = _controller.text;
              _controller.clear();
              ref
                  .read(userViewModel)
                  .editUserNickName(nickname)
                  .then((result) => parseUserResp(result));
            });
          }
        } else if (way == 1) {
          Navigator.pop(context);
          _editFocus.unfocus();
          Utils.callSetStateSafely(this, () {
            signature = _controller.text;
            _controller.clear();
            ref
                .read(userViewModel)
                .editUserSignature(signature)
                .then((result) => parseUserResp(result));
          });
        } else if (way == 2) {
          Navigator.pop(context);
          Utils.callSetStateSafely(this, () {
            birthday = localBirthday;
            ref
                .read(userViewModel)
                .editUserBirthday(birthday)
                .then((result) => parseUserResp(result));
          });
        }
      },
      child: Text(
        StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_save),
        style: const TextStyle(
            color: AppColor.b1,
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.colorFFF616,
        minimumSize: const Size(175, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  parseUserResp(RawDataRsp result, {bool media = false}) {
    if (result.code == 0 || result.code == 8020) {
      AuvChatLog.d("EditUserInfo updateUserInfo success ");
      ref.refresh(commonUserNotify);
      // if(media){
      //   ref.refresh(mediaNotifier);
      // }
    } else {
      Fluttertoast.showToast(msg: "Update user error");
    }
  }

  @override
  void dispose() {
    super.dispose();
    AuvChatLog.d("EditUserPage dispose");
  }
}
