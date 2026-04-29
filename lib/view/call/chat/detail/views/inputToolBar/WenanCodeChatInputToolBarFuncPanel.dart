import 'package:flutter/cupertino.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';

enum ChatInputFuncType {
  voice,
  video,
  card,
//  order,
  location,
}

class ChatInputFuncItem {
  final ChatInputFuncType type;
  final String name;
  final String icon;

  ChatInputFuncItem(this.type, this.name, this.icon);
}

class ChatInputToolBarFuncPanel extends StatelessWidget {
  static final List<ChatInputFuncItem> _configItems = [
  ];

  final ValueChanged<ChatInputFuncType>? selectFunc;

  const ChatInputToolBarFuncPanel({Key? key, this.selectFunc}) : super(key: key);


  Widget _gridItem(ChatInputFuncItem item) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image(
              image: ImageLoader.assetImage(item.icon),
              width: 36.0,
              height: 36.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            item.name,
            style: AppTextStyle.TextB3_12,
          ),
        ],
      ),
      onPressed: () => selectFunc?.call(item.type),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    final itemWidth = (deviceData.size.width - 15.0 * 2 - 10.0 * 3) / 4;
    const itemHeight = 10.0 * 2 + 7.0 * 2 + 36.0 + 8.0 + 20.0;
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(
        15.0,
        15.0,
        15.0,
        deviceData.viewPadding.bottom > 0 ? deviceData.viewPadding.bottom : 15.0,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: itemWidth / itemHeight,
      ),
      itemCount: _configItems.length,
      itemBuilder: (context, index) => _gridItem(_configItems[index]),
    );
  }

}
