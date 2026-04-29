import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeimage_url_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeChatMediaPhotoViewerDataSource.dart';


class ChatCellImageView extends StatelessWidget {
  final ChatSnap snap;

  const ChatCellImageView({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = ChatUtils.imageVideoContainerSize(
      true,
      snap.image?.width?.toDouble()??0,
      snap.image?.height?.toDouble()??0,
      MediaQuery.of(context).size.width - ChatCellLayouts.headSpacePadding,
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ChatMediaPhotoViewerDataSource.showViewer(context,snap);
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: AppColor.color_f6f6fa,
          borderRadius: snap.isMine? ChatUtils.chatCellRadiusMine(): ChatUtils.chatCellRadiusOther(),
        ),
        child: Hero(
            tag: snap.hashCode.toString(),
            child: snap.isLocalMediaNotOutOfDate &&
                !Utils.isEmptyString(snap.image?.relativePath)
                ? Container(
                    decoration: BoxDecoration(
                    borderRadius: snap.isMine ? ChatUtils.chatCellRadiusMine() : ChatUtils.chatCellRadiusOther(),
                    image: DecorationImage(
                        image: FileImage(File(snap.image!.absolutePath!))),
                  ))
                : ImageLoader.loadRoundCornerImage(snap.image?.img_url ?? "",
                    snap.isMine ? ChatUtils.chatCellRadiusMine() : ChatUtils.chatCellRadiusOther(),
                    width: size.width,
                    height: size.height,
                    type: ImageClipType.IMAGE_M)
        ),
      ),
    );
  }
}
