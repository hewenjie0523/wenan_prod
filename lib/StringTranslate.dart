
import 'dart:convert';
import 'dart:math';

class StringTranslate{

  static String z2e(String z){
    String appName = "wenan";
    List<String> result = [];
    for (int i = 0; i < z.length; i ++) {
      int index = Random().nextInt(appName.length);
      result.add(z[i]);
      result.add(appName[index]);
    }
    return result.join();
  }

  static String e2z(String? e){
    if(e==null||e.isEmpty){
      return "";
    }
    List<String> result = [];
    for (int i = 0; i < e.length; i += 2) {
      result.add(e[i]);
    }

    return result.join();
  }
}