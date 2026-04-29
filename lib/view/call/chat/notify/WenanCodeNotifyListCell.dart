import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:wenan/data/chat/NotifyItem.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

import '../../../../utils/WenanCodeimage_url_utils.dart';

class NotifyListCell extends StatelessWidget {
  final NotifyItem item;

  const NotifyListCell({Key? key, required this.item}) : super(key: key);

  static String formatTime(int? milliSeconds) {
    if (milliSeconds == null) return '';
    String ret;
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
    if (dateTime.isAfter(now) || dateTime.year < now.year) {
      ret = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    } else if (dateTime.month < now.month || dateTime.day <= now.day - 1) {
      ret = DateFormat('MM-dd HH:mm').format(dateTime);
    } else {
      ret = DateFormat('HH:mm').format(dateTime);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          _timeWidget(),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (!Utils.isEmptyString(item.url)) {
                // Fluttertoast.showToast(msg: "item clicked!");
                PageRouter.startWebview(context, item.url!);
                // if (LinkJumpUtils.isProfileGod(item.url)) {
                //   Routes.close(context);
                //   LinkJumpUtils.profileGod();
                // } else {
                //   Routes.routerToNativeH5Page(item.url);
                // }
              }
            },
            child: _contentWidget(context),
          ),
        ],
      ),
    );
  }

  Widget _timeWidget() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50.0,
      ),
      child: Center(
        child: Text(
          formatTime(item.time),
          style: AppTextStyle.style(
            color: AppColor.color_cccccc,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    List<Widget> children = [];
    if (item.image == null) {
      children.add(AppGap.vGap5);
    } else {
      final width = MediaQuery.of(context).size.width - 2 * 15.0 - 2 * 15.0;
      var imgUrl = "";
      if(Utils.isEmptyString(item.image!.img_url)){
        imgUrl = item.imgUrl??"";
      } else {
        imgUrl = item.image!.img_url!;
      }
      children.add(Container(
        width: width,
        height: (width * 140.0 / 315.0).ceil().toDouble(),
        decoration: BoxDecoration(
          color: AppColor.black_10p,
          borderRadius: BorderRadius.circular(4.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(ImageURLUtils.imageURLOrigin(imgUrl)),
          ),
        ),
      ));
      children.add(AppGap.vGap15);
    }
    // if (!Utils.isEmptyString(item.title)) {
    //   children.add(Text(item.title!, style: AppTextStyle.TextB1_16_Middle));
    // }
    if (!Utils.isEmptyString(item.content)) {
      children.add(Text(
        item.content!,
        style: AppTextStyle.TextB3_14,
        // maxLines: 2,
        // overflow: TextOverflow.ellipsis,
      ));
      children.add(AppGap.vGap15);
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
