
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:path_provider/path_provider.dart';
import '../utils/WenanCodeutils.dart';

class ProfileModelProvider{

  final ProfileApi _profileApi = ProfileApi(DioHelper.getInstance());

  Future<bool> clearCache() async{
    try {
      final _tempDir = await getTemporaryDirectory();
      await Utils.requestPermission(_tempDir);
      double cacheSize = await getCacheSize();
      AuvChatLog.d(">>>>>>>>>>>>>clearCache $cacheSize");
    } catch (err) {
    }
    return true;
  }

  Future<DisturbRsp> disturb (bool isDisturb){
    return _profileApi.disturb(isDisturb?1:0);
  }


  Future<double> getCacheSize() async {
    final _tempDir = await getTemporaryDirectory();
    double _cache = await Utils.getTotalSizeOfFilesInDir(_tempDir);
    AuvChatLog.d(">>>>>>>>>>>>>getCacheSize $_cache");
    return _cache;
  }
  
}