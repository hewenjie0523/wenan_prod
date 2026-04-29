
import 'package:dio/dio.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

enum ReqStatus {idle ,loading, success, error, dataModified}

class BaseApiState<T>{
  ReqStatus status = ReqStatus.idle;
  T? data;
  String? message;
  int? errorCode;

  BaseApiState<T> copyWith({ReqStatus? status,T? rsp,String? message,int? errorCode}){
    var copyWith = BaseApiState<T>();
    copyWith.status=status??this.status;
    copyWith.data = rsp;
    copyWith.message = message??this.message;
    copyWith.errorCode = errorCode??errorCode;

    return copyWith;
  }

  @override
  String toString() {
    return 'status=$status,data=$data';
  }

}

class BaseStateNotifier<T extends BaseApiState> extends StateNotifier<T>{
  BaseStateNotifier(T state) : super(state);
  Future<T> mapRspToNotifier<R extends BaseRsp>(Future<R> rsp) async{
    state = state.copyWith(status: ReqStatus.loading) as T;
    try {
      var result = await rsp;
      if(result.getCodeInt()==0){
        AuvChatLog.d("result=$result,result.getData()=${result.getData()}:",tag: 'BaseStateNotifier');
        state = state.copyWith(status: ReqStatus.success,rsp: result.getData(),message: result.msg) as T;
      } else {
        state = state.copyWith(status: ReqStatus.error,message: result.msg,errorCode: result.getCodeInt()) as T;
      }

    } catch (obj,stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode??-1;
          msg = res?.statusMessage??"";
          break;
        default:
          break;
      }
      AuvChatLog.e("http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      state = state.copyWith(status: ReqStatus.error,message: msg,errorCode: errorCode) as T;
    }
    return state;
  }


}


class BaseApiPageState<T>{
  ReqStatus status = ReqStatus.idle;
  List<T>? dataList;
  String? message;
  int? errorCode;
  int page = 0;
  int total = 0;
  bool hasMore = false;

  BaseApiPageState<T>  modifyData({List<T>? added,List<T>? modified,List<T>? removed}){
    var shouldAdd = !Utils.isEmptyList(added);
    var shouldModify = !Utils.isEmptyList(modified);
    var shouldRemove = !Utils.isEmptyList(removed);
    if(!(shouldAdd||shouldModify||shouldRemove)){
      return this;
    }
    var copyWith = BaseApiPageState<T>();
    copyWith.status = ReqStatus.dataModified;
    copyWith.dataList = dataList;
    copyWith.page = this.page;
    copyWith.total = this.total;
    copyWith.hasMore = this.hasMore;
    //如果没有旧数据，就新建一个list
    copyWith.dataList ??= <T>[];
    if(shouldAdd){
      copyWith.dataList!.addAll(added!);
    }

    if(shouldModify){
      for (var element in modified!) {
        var index = copyWith.dataList!.indexOf(element);
        if(index>=0){
          copyWith.dataList![index] = element;
        }
      }
    }

    if(shouldRemove){
      copyWith.dataList!.removeWhere((element) => removed!.contains(element));
    }

    return copyWith;
  }

  BaseApiPageState<T> copyWith({ReqStatus? status,List<T>? rsp,String? message,int? errorCode,int? page,int?total,bool? hasMore,DataAppendStrategy dataAppendStrategy = DataAppendStrategy.Page}){
    var copyWith = BaseApiPageState<T>();
    copyWith.status=status??this.status;
    if(status==ReqStatus.success){
      //成功才有更新的必要
      copyWith.page = page??this.page;
      copyWith.hasMore = hasMore??this.hasMore;
      //刷新数据
      var newData = rsp ?? <T>[];
      copyWith.dataList = dataList;
      //如果没有旧数据，就新建一个list
      copyWith.dataList ??= <T>[];
      if(dataAppendStrategy==DataAppendStrategy.Page){
        if(page==1){
          copyWith.dataList = <T>[];
          copyWith.total = total??this.total;
        }
        copyWith.dataList?.addAll(newData);

      } else if(dataAppendStrategy==DataAppendStrategy.HEAD) {
        copyWith.dataList?.insertAll(0,newData);
      } else if(dataAppendStrategy==DataAppendStrategy.TAIL) {
        copyWith.dataList?.addAll(newData);
      } else if(dataAppendStrategy==DataAppendStrategy.Clear) {
        copyWith.dataList?.clear();
        copyWith.dataList?.addAll(newData);
      }
    } else {
      copyWith.dataList = dataList;
      copyWith.page = this.page;
      copyWith.total = this.total;
      copyWith.hasMore = this.hasMore;
    }

    copyWith.message = message??this.message;
    copyWith.errorCode = errorCode??errorCode;

    return copyWith;
  }

  @override
  String toString() {
    return 'status=$status,data=$dataList,datasize=${dataList?.length}.';
  }

}

typedef DataFilter<T> = List<T>? Function(List<T>? obj);
//list 添加策略
///Page page==1,clear后添加;page>1,append后添加，默认策略
///HEAD 添加在列表头部
///TAIL 添加在列表尾部
///clear 清除旧数据后添加
enum DataAppendStrategy {Page,HEAD,TAIL,Clear}

class BasePageStateNotifier<T extends BaseApiPageState> extends StateNotifier<T>{
  BasePageStateNotifier(T state) : super(state);
  Future mapRspToNotifier<R extends BaseRsp>(Future<R> rsp,{DataFilter? dataFilter,DataAppendStrategy dataAppendStrategy = DataAppendStrategy.Page}) async{
    state = state.copyWith(status: ReqStatus.loading) as T;
    try {
      var result = await rsp;
      AuvChatLog.d("mapRspToNotifier:rsp=${result.toString()}");
      if(result.getCodeInt()==0){
        var pageData = result.getData() as BasePageData;
        state = state.copyWith(status: ReqStatus.success,rsp: dataFilter==null?pageData.getDataList():dataFilter.call(pageData.getDataList()),message: result.msg,total: pageData.total,page: pageData.page,hasMore: pageData.has_more,dataAppendStrategy: dataAppendStrategy) as T;
      } else {
        state = state.copyWith(status: ReqStatus.error,message: result.msg,errorCode: result.getCodeInt()) as T;
      }

    } catch (obj,stackTrace) {
      var errorCode = -1;
      var msg = "";
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          errorCode = res?.statusCode??-1;
          msg = res?.statusMessage??"";
          break;
        default:
          break;
      }
      AuvChatLog.e("http request Got error : $errorCode -> $msg，$obj,$stackTrace");
      state = state.copyWith(status: ReqStatus.error,message: msg,errorCode: errorCode) as T;
    }
  }

  void  modifyData<R>({List<R>? added,List<R>? modified,List<R>? removed}){
    state = state.modifyData(added:added,modified: modified,removed: removed) as T;
  }
}

