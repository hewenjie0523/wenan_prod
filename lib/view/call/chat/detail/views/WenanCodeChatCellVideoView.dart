import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeImagePickerUtils.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeimage_url_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeChatMediaVideoViewerDataSource.dart';


class ChatCellVideoView extends StatelessWidget {
  final ChatSnap snap;

  const ChatCellVideoView({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = ChatUtils.imageVideoContainerSize(
      true,
      snap.video?.width?.toDouble()??0,
      snap.video?.height?.toDouble()??0,
      MediaQuery.of(context).size.width - ChatCellLayouts.headSpacePadding,
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ChatMediaVideoViewerDataSource.showViewer(context,snap);
      },
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: AppColor.color_f6f6fa,
          borderRadius: snap.isMine? ChatUtils.chatCellRadiusMine(): ChatUtils.chatCellRadiusOther(),
        ),
        child: Stack(
          children: <Widget>[
            Hero(
                tag: snap.hashCode.toString(),
                child: snap.isLocalMediaNotOutOfDate &&
                    !Utils.isEmptyString(snap.video?.relativePath)
                    ? FutureBuilder(
                  future: ImagePickerUtils.getThumbnail(
                    videoPath: snap.video?.absolutePath,
                  ),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return ClipRRect(child: snapshot.data! as Image,borderRadius: snap.isMine? ChatUtils.chatCellRadiusMine(): ChatUtils.chatCellRadiusOther(),);
                    } else {
                      return Container();
                    }

                  },
                )
                    : ImageLoader.loadRoundCornerImage(snap.video!.cover_url??"", snap.isMine? ChatUtils.chatCellRadiusMine(): ChatUtils.chatCellRadiusOther(), width: snap.video!.width?.toDouble()??0,height: snap.video!.height?.toDouble()??0,type: ImageClipType.IMAGE_M)
            ),
            Center(
              child: ImageLoader.loadLocalImage(
                'wIeTnWavny_jrLexsG_BvuiydWenoL_5pwlza4yG_fi7c6oenC',
                width: 48.0,
                height: 48.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
