

import 'package:wenan/data/BaseRsp.dart';

typedef Success<T> = void Function(T rsp);
typedef Failure = void Function(int code, String errorMsg);
class CommonRspObserver<T extends BaseRsp>{
   Success<T> onSuccess;
   Failure onFailure;
   CommonRspObserver({required this.onSuccess,required this.onFailure});
}