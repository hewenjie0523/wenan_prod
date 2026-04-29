

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:wenan/utils/WenanCodelog.dart';

class ConnectivityUtil{
  static Future<bool> isNetworkConnect() async{
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      return connectivityResult!=ConnectivityResult.none;
    } catch (e) {
      AuvChatLog.e(e.toString(),error: e);
    }
    //TODO:MissingPluginException(No implementation found for method check on channel dev.fluttercommunity.plus/connectivity)  unbliveable!!
    return true;
  }
}

