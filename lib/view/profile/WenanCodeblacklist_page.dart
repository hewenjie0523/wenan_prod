import 'dart:ffi';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/viewmodel/WenanCodeblacklist_vm.dart';
import '../../http/UserApi.dart';
import '../../http/WenanCodedio_helper.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../state/WenanCodeBaseApiState.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import '../widgets/refresh/WenanCodeAuvRefreshWidget.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

final blackListProvider = Provider.autoDispose((ref) => BlackModelProvider());
final refreshRsp =
    FutureProvider.autoDispose((ref) => ref.read(blackListProvider).refresh());
final blackListNotifier = StateNotifierProvider.autoDispose(
    (ref) => BlackListNotifier(BaseApiPageState<CommonUser>()));

class BlackListPage extends ConsumerStatefulWidget {
  const BlackListPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _BlackListPageState();
  }
}

class _BlackListPageState extends ConsumerState<BlackListPage> {
  List<CommonUser> dataList =[];
  bool isRequest = false;
  ProfileApi api = ProfileApi(DioHelper.getInstance());
  int page = 1;
  int total = 0;

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("BlackListPage build page:$page");
    return Scaffold(
        backgroundColor: const Color(0xFF1D002A),
        appBar: AuvCupertinoNavigationBar(
          middle: Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_blacklist_count).replaceFirst("s%", total.toString()),
            style: AppTextStyle.white18,
          ),
          leading: UIUtils.navigationCommonBackButton(
              () => FluroRouter.appRouter.pop(context),
              color: AppColor.white,
              leftPadding: 0),
          backgroundColor: const Color(0xFF1D002A),
        ),
        body: AuvRefreshWidget(
          refresh: _refresh,
          loadMore: page>1?_onLoadMore:null,
          child: _blockListViews(),
        ));
  }

  Widget _blockListViews() {
    AuvChatLog.d(
        "BlackListPage _blackListViews page:$page");
    if (!isRequest && Utils.isEmptyList(dataList)) {
      return Center(
        child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_no_data),
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            )),
      );
    }
    // dataList = [Application.commonUser!,Application.commonUser!,] ;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _userCell(dataList[index], index);
      },
      itemCount: dataList.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 24,
        );
      },
    );
  }

  _userCell(CommonUser commonUser, int index) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: (context) => _onDelete(context, index),
            backgroundColor: const Color(0xFFFF0000),
            foregroundColor: Colors.white,
            spacing: 0,
            label: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_delete),
          ),
        ],
      ),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white_20p,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            ImageLoader.loadOvalImage(commonUser.avatar_url ?? "",
                width: 48, height: 48, type: ImageClipType.IMAGE_S),
            AppGap.hGap16,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commonUser.nick_name ?? "",
                  style: AppTextStyle.white18,
                ),
                AppGap.vGap4,
                UIUtils.userInfoWidget(commonUser,
                    backgroundColor: AppColor.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 0)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _onDelete(BuildContext context, int index) async {
    try {
      if (dataList.isNotEmpty == true) {
        var userId = dataList[index].uid ?? 0;
        var result = await UserApi(DioHelper.getInstance()).unBlock(userId);
        if (result.code == 0) {
          Utils.callSetStateSafely(this, () {
            dataList.removeAt(index);
          });
        }
      }
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
  }
  Future<ReqStatus> _loadData() async{

    if(isRequest) return ReqStatus.success;
    isRequest = true;
    try {
      var rsp = await api.blackList(page, 20);
      isRequest = false;
      if (rsp.code == 0) {
        var dataSet = rsp.data?.getDataList();
        if(!Utils.isEmpty(dataSet)){
          Utils.callSetStateSafely(this, () {
            if(page == 1) dataList.clear();
            dataList.addAll(dataSet!);
            var hasMore = rsp.data?.has_more??false;
            page = hasMore? page += 1 : -1;
            AuvChatLog.d("BlackListPage _loadData hasMore:$hasMore page:$page");
            total = rsp.data?.total??0;
          });
        }else{
          page == 0;
        }
        return ReqStatus.success;
      } else {
        return ReqStatus.error;
      }
    }catch(e){
      isRequest = false;
      return ReqStatus.error;
    }
  }

  Future<ReqStatus>  _refresh() async {
    page = 1;
    return _loadData();
  }

  Future<ReqStatus>  _onLoadMore() async {
    return _loadData();
  }

}
