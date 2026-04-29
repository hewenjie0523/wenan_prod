import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/widgets/WenanCodeAuvCupertinoPageScaffold.dart';
import 'package:wenan/view/widgets/WenanCodeAuvNavBar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';

class AvatarCameraPage extends ConsumerStatefulWidget {
  const AvatarCameraPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _AvatarCameraState();
  }
}

class _AvatarCameraState extends ConsumerState<AvatarCameraPage> {
  final CameraSwitch cameraSwitch = CameraSwitch();
  late String imagePath = '';
  late bool isCamera = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("Camera build page");
    return AuvCupertinoPageScaffold(
      backgroundColor: AppColor.color_1E294F,
      resizeToAvoidBottomInset: true,
      navigationBar: AuvCupertinoNavigationBar(
        border: null,
        backgroundColor: AppColor.transparent,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            isCamera
                ? PageRouter.popCurrPage(context: context, result: '')
                : _setCamera(true);
          },
          child:
              ImageLoader.loadLocalImage('wDemn9a9nT_CrAeds7_dcMo3mjmDonnO_HbuaBcNky', width: 24, height: 24),
        ),
        trailing: GestureDetector(
          onTap: () => isCamera
              ? cameraSwitch.switchCamera?.call()
              : PageRouter.popCurrPage(context: context, result: imagePath),
          child: Container(
            width:32,
            height: 32,
            padding: const EdgeInsets.all(4.0),
            child: ImageLoader.loadLocalImage(
                isCamera
                    ? 'match/wkejnBaBn8_Zrye2s2_Tp7aMlKaJ_gdLrUa5wSaebulRe3_HiccD_omDaCt2cIhQi6nhgA_ZsRwliptEcnhV'
                    : 'chat/wwevnoaxnn_ArSeCsf_KiacU_KsOtcidcekYetrT_psyenlAesc1tQekds',
                width: 24,
                height: 24),
          ),
        ),
      ),
      child: isCamera
          ? CameraPreviewView(
              cameraSwitch: cameraSwitch,
              setImage: (path) => _setImage(path),
            )
          : PicturePreviewView(imagePath),
    );
  }

  _setImage(path) {
    Utils.callSetStateSafely(this, () {
      imagePath = path;
      isCamera = false;
    });
  }

  _setCamera(flag) {
    Utils.callSetStateSafely(this, () {
      isCamera = flag;
    });
  }
}

class CameraPreviewView extends StatefulWidget {
  CameraSwitch? cameraSwitch;
  final dynamic setImage;
  CameraPreviewView({this.cameraSwitch, this.setImage, Key? key})
      : super(key: key);

  @override
  State<CameraPreviewView> createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreviewView> {
  List<CameraDescription>? cameras;
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    widget.cameraSwitch?.switchCamera = _switchCamera;
    [
      Permission.camera,
    ].request().then((statuses) {
      AuvChatLog.d("statuses:$statuses");
      if (statuses[Permission.camera] == PermissionStatus.granted) {
        availableCameras().then((value) {
          AuvChatLog.d("availableCameras:$value");
          cameras = value;
          _switchCamera();
        }, onError: (e, stack) {
          AuvChatLog.printE(e, error: stack);
        });
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller?.dispose();
    super.dispose();
  }

  _switchCamera() {
    if (cameras != null && cameras!.isNotEmpty) {
      var aimLensDirection = widget.cameraSwitch?.currCamera?.lensDirection ==
              CameraLensDirection.back
          ? CameraLensDirection.front
          : CameraLensDirection.back;
      CameraDescription? newOne;
      for (var element in cameras!) {
        if (element.lensDirection == aimLensDirection) {
          newOne = element;
          break;
        }
      }
      //如果没找到合适的，并且当前没有在预览中的摄像头，随便选一个
      if (newOne == null && widget.cameraSwitch?.currCamera == null) {
        newOne = cameras!.first;
      }
      if (newOne != null) {
        widget.cameraSwitch?.currCamera = newOne;
        _controller = CameraController(
          // Get a specific camera from the list of available cameras.
          newOne,
          // Define the resolution to use.
          ResolutionPreset.max,
        );
        _initializeControllerFuture = _controller!.initialize();

        Utils.callSetStateSafely(this, () {});
      }
    }
  }

  _takePicture() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Attempt to take a picture and get the file `image`
      // where it was saved.
      final image = await _controller?.takePicture();
      if (!mounted) return;

      // If the picture was taken, display preview.
      widget.setImage(image?.path);
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _initializeControllerFuture == null
        ? Container()
        : FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              // If the Future is complete, display the preview.
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CameraPreview(_controller!),
                    _takePictureButton(),
                  ],
                ),
              );
            },
          );
  }

  Widget _takePictureButton(){
    return Positioned(
      width: 80,
      height: 80,
      left: MediaQuery.of(context).size.width / 2 - 40,
      bottom: 60,
      child: MaterialButton(
        shape: const CircleBorder(
          side: BorderSide(
            width: 10,
            color: AppColor.black_60p,
            style: BorderStyle.solid,
          ),
        ),
        color: AppColor.white,
        onPressed: () {
          _takePicture();
        },
      ),
    );
  }
}

class CameraSwitch {
  VoidCallback? switchCamera;
  CameraDescription? currCamera;
}

class PicturePreviewView extends StatefulWidget {
  final String imagePath;
  const PicturePreviewView(this.imagePath, {Key? key}) : super(key: key);

  @override
  State<PicturePreviewView> createState() => _PicturePreviewState();
}

class _PicturePreviewState extends State<PicturePreviewView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColor.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // margin: const EdgeInsets.only(top: 50),
      child: Image.file(File(widget.imagePath),width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
    );
  }
}
