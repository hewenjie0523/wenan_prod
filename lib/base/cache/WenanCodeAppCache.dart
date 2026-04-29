import 'package:get_storage/get_storage.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodelog.dart';



class AppCache{

  static AppCache? _instance;

  static AppCache get instance=>_instance??=AppCache._();

  static const String _expire_key = "_expire_key";

  AppCache._();

  final _appCacheBox = GetStorage();

  T? get <T>(String key,{T Function(Map<String, dynamic> json)? convert}){
    try {
      if(_isDataExpired(key)){
            return null;
          }
      var data = _appCacheBox.read(key);
      AuvChatLog.d("_appCacheBox.data:${data.runtimeType}");
      if(data is T){
            return data;
          } else {
            if(data is Map<String, dynamic>){
              return convert?.call(data);
            }
          }
    } catch (e) {
      AuvChatLog.printE(e);
    }
    return null;
  }

  List<T>? getList <T>(String key,{T Function(Map<String, dynamic> json)? convert}){
    try {
      if(_isDataExpired(key)){
            AuvChatLog.d("getList,_isDataExpired");
            return null;
          }
      var data = _appCacheBox.read(key);
      // AuvChatLog.d("getList,data=$data");
      if(data is List<T>){
            return data;
          } else {
            if(data is List&&convert!=null){
              List<T> result = [];
              for(var elem in data){
                // AuvChatLog.d("getList,elem1:$elem");
                if(elem is T){
                  result.add(elem);
                } else if(elem is Map<String, dynamic>){
                  // AuvChatLog.d("getList,elem:$elem");
                  result.add(convert(elem));
                }
              }
              return result;
            }
          }
    } catch (e) {
      AuvChatLog.printE(e);
    }
    return null;
  }

  bool _isDataExpired(String key){
    var expireTime = _getExpireTime(key);
    AuvChatLog.d("palacache,expireTime:$expireTime,${DateTime.now().millisecondsSinceEpoch-expireTime}");
    return (expireTime>=0&&(DateTime.now().millisecondsSinceEpoch>expireTime));
  }

  bool hasData(String key) {
    return _appCacheBox.hasData(key);
  }

  String _getExpireTimeKey(String key){
    return "$key$_expire_key";
  }

  int _getExpireTime(String key){
    try {
      return _appCacheBox.read(_getExpireTimeKey(key));
    } catch (e) {
      AuvChatLog.printE(e);
    }
    return -1;
  }

  ///validTimeInMills 有效时间，小于0,永不过期
  Future<void> _setExpireTime(String key,int validTimeInMills){
    if(validTimeInMills>=0){
      return _appCacheBox.write(_getExpireTimeKey(key), DateTime.now().millisecondsSinceEpoch+validTimeInMills);
    } else {
      return _appCacheBox.write(_getExpireTimeKey(key), -1);
    }
  }

  ///validTimeInMills 有效时间，小于0,永不过期
  Future<void> put(String key, dynamic value,{int validTimeInMills=24*3600*1000}) async{
    await _setExpireTime(key,validTimeInMills);
    return _appCacheBox.write(key, value);
  }

  Future<void> putSharePref(String key, dynamic value) async{
    await _setExpireTime(key,-1);
    return _appCacheBox.write(key, value);
  }

  Future<void> putUserSharePref(String key, dynamic value) async{
    String realKey = "${key}_${Application.commonUser?.ucode}";
    await _setExpireTime(realKey,-1);
    return _appCacheBox.write(realKey, value);
  }

  T? getUserSharePref <T>(String key,{T Function(Map<String, dynamic> json)? convert}){
    String realKey = "${key}_${Application.commonUser?.ucode}";
    return get(realKey,convert: convert);
  }

  List<T>? getUserSharePrefList <T>(String key,{T Function(Map<String, dynamic> json)? convert}){
    String realKey = "${key}_${Application.commonUser?.ucode}";
    return getList(realKey,convert: convert);
  }

  Future<void> remove(String key){
    _appCacheBox.remove(_getExpireTimeKey(key));
    return _appCacheBox.remove(key);
  }


}