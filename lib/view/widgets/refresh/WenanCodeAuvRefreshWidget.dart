import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AuvRefreshWidget extends ConsumerStatefulWidget {
  final Future<ReqStatus> Function()? refresh;
  final Future<ReqStatus> Function()? loadMore;
  final Widget? child;
  final RefreshStyle refreshHeader;

  const AuvRefreshWidget({Key? key,
    this.refresh,
    this.loadMore,
    required this.child,
    this.refreshHeader = RefreshStyle.Front}) : super(key: key);

  @override
  createState() {
    return _AuvRefreshWidgetState();
  }
}

class _AuvRefreshWidgetState extends ConsumerState<AuvRefreshWidget> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }


  void onInitRefreshController() {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.refresh != null,
      enablePullUp: widget.loadMore != null,
      header: const ClassicHeader(),
      //AuvGifHeader(widget.key),
      footer: const ClassicFooter(loadStyle: LoadStyle.ShowWhenLoading),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoadMore,
      child: widget.child,
    );
  }

  void _onLoadMore() {
    AuvChatLog.d("AuvRefreshWidget  _onLoadMores  ");
    widget.refresh!().then((result) {
      _refreshController.loadComplete();
      switch (result) {
        case ReqStatus.success:
          _refreshController.loadComplete();
          break;
        case ReqStatus.error:
          _refreshController.loadFailed();
          break;
        default:
          _refreshController.refreshToIdle();
          break;
      }
    });
  }

  void _onRefresh() {
    AuvChatLog.d("AuvRefreshWidget  _onRefresh  ");
    widget.refresh!().then((result) {
      AuvChatLog.d("AuvRefreshWidget  _onRefresh result :$result ");
      if(result == ReqStatus.loading) return;
      _refreshController.loadComplete();
      switch (result) {
        case ReqStatus.success:
          _refreshController.refreshCompleted();
          break;
        case ReqStatus.error:
          _refreshController.refreshFailed();
          break;
        default:
          _refreshController.refreshToIdle();
          break;
      }
    });
  }

}
