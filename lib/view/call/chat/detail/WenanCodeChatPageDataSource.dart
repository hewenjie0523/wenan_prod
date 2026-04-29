
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/chat/WenanCodeChatSnapSortGroup.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCell.dart';

enum ChatLoadDirection {
  normal,
  forward,
  backward,
}

class ChatPageDataSource {
  static const int PAGE_SIZE = 20;
  static const int MAX_INT = 0;

  late ChatBox _chatBox;
  ChatSnap? _showSnap;
  String? _shareJson;

  bool _hasForward = false;
  bool _hasBackward = false;
  bool _isMoreLoaded = false;
  bool _firstLoading = true;
  bool _isLoading = false;

  int _moreCount = 0;
  ChatSnap? _moreFirstSnap;
  int lastReadTime = 0;
  bool _loadWithShowSnap = false;
  List _items = [];
  List<ChatSnapSortGroup> _groups = [];

  ChatBox get chatBox => _chatBox;

  set chatBox(cb) => _chatBox = cb;

  get showSnap => _showSnap;

  set showSnap(snap) {
    _showSnap = snap;
    _loadWithShowSnap = _showSnap != null;
  }

  get shareJson => _shareJson;

  set shareJson(json) => _shareJson = json;

  int get itemCount => _items.length;

  int get moreCount => _moreCount;

  bool get hasMoreForward => _hasForward;

  bool get hasMoreBackward => _hasBackward;

  ChatSnapSortGroup? get _firstGroup => _groups.isEmpty ? null : _groups.first;

  ChatSnapSortGroup? get _lastGroup => _groups.isEmpty ? null : _groups.last;

  ChatSnap? firstSnap() {
    final group = _firstGroup;
    return group == null || group.isEmpty() ? null : group.snaps.first;
  }

  ChatSnap? lastSnap() {
    final group = _lastGroup;
    return group == null || group.isEmpty() ? null : group.snaps.last;
  }

  dynamic itemAtIndex(int index) => _items[index];

  void clean() {
    _hasForward = false;
    _hasBackward = false;
    _isMoreLoaded = false;
    _moreCount = 0;
    _loadWithShowSnap = false;
    _items.clear();
    _groups.clear();
  }


  void _preHandleSnaps(List<ChatSnap>? snaps) {
    if (Utils.isEmptyList(snaps)) return;
    for (var e in snaps!) {
      e.clearCacheTime = _chatBox.clearCacheTime;
      ChatCell.preHandleSnap(e);
    }
  }

  void _updateItems() {
    List items = [];
    _groups.forEach((e) {
      if (e.newItem != null) items.add(e.newItem);
      items.add(e.dateItem);
      items.addAll(e.snaps);
    });
    _items.clear();
    _items.addAll(items);
  }


  Future<bool> resendSnap(snap) async {
    if (lastSnap() == snap) return false;

    var group;
    for (var g in _groups) {
      int index = g.snaps.indexOf(snap);
      if (index > -1) {
        group = g;
        g.snaps.removeAt(index);
        break;
      }
    }
    if (group != null && group.isEmpty()) {
      _groups.remove(group);
    }
    final groups = ChatSnapSortGroup.sortSnaps([snap], null, _groups.isEmpty ? null : _groups.last);
    if(!Utils.isEmptyList(groups)){
      _groups.addAll(groups!);
    }

    _updateItems();
    return true;
  }

  Future<bool> addSnaps(List<ChatSnap> snaps) async {
    _preHandleSnaps(snaps);

    bool changed = false;
    snaps.removeWhere((e) {
      for (var g in _groups) {
        int index = g.snaps.indexOf(e);
        if (index > -1) {
          g.snaps.removeAt(index);
          g.snaps.insert(index, e);
          changed = true;
          return true;
        }
      }
      return false;
    });
    if (snaps.isNotEmpty) {
      final groups = ChatSnapSortGroup.sortSnaps(snaps, null, _groups.isEmpty ? null : _groups.last);
      if(!Utils.isEmptyList(groups)){
        _groups.addAll(groups!);
      }
      changed = true;
    }
    if (changed) _updateItems();
    return changed;
  }

  Future<bool> updateSnaps(List<ChatSnap> snaps) async {
    _preHandleSnaps(snaps);

    bool changed = false;
    snaps.forEach((e) {
      for (var g in _groups) {
        int index = g.snaps.indexOf(e);
        if (index > -1) {
          g.snaps.removeAt(index);
          g.snaps.insert(index, e);
          changed = true;
          break;
        }
      }
    });
    if (changed) _updateItems();
    return changed;
  }

  Future<bool> loadData(ChatLoadDirection direction) async {
    if (_isLoading) return false;
    _isLoading = true;

    List<ChatSnap>? snaps;
    switch (direction) {
      case ChatLoadDirection.normal:
        if (_firstLoading) {
          _firstLoading = false;
          final cbInDB = await Application.chatContext.dbService.chatBoxDao.modelById(_chatBox.id);
          if (cbInDB != null) {
            lastReadTime = cbInDB.lastReadSnapTime??0;
            final moreCount =
                await Application.chatContext.dbService.snapDao.countOfNewModelsForChatBox(_chatBox.id, lastReadTime);
            if (moreCount > 5) {
              _moreCount = 5;
              _moreFirstSnap =
                  await Application.chatContext.dbService.snapDao.firstModelForChatBox(_chatBox.id, lastReadTime);
            }
          }
        }

        if (!_loadWithShowSnap) {
          snaps = await Application.chatContext.snapModule.snapsForChatBoxByTimeDesc(_chatBox.id);
          _hasForward = snaps != null && snaps.length >= PAGE_SIZE;
        } else {
          _loadWithShowSnap = false;
          snaps = [];
          final forward =
              await Application.chatContext.snapModule.snapsForChatBoxByToTime(_chatBox.id, _showSnap?.createTime);
          _hasForward = forward != null && forward.length >= PAGE_SIZE;
          Utils.nullSafe<List<ChatSnap>>(forward, notNullBlock: (obj) {snaps?.addAll(obj); });
          final backward =
              await Application.chatContext.snapModule.snapsForChatBoxByTime(_chatBox.id, _showSnap?.createTime);
          _hasBackward = backward != null && backward.length >= PAGE_SIZE;
          if (backward != null) snaps.removeWhere((e) => backward.contains(e));
          Utils.nullSafe<List<ChatSnap>>(backward, notNullBlock: (obj) {snaps?.addAll(obj); });
        }
        AuvChatLog.d('ChatDataSource - LoadData(normal): $_hasForward, $_hasBackward, $snaps');
        break;
      case ChatLoadDirection.forward:
        if (_hasForward) {
          final first = firstSnap();
          if (first == null) {
            snaps = await Application.chatContext.snapModule.snapsForChatBoxByTimeDesc(_chatBox.id);
          } else {
            snaps = await Application.chatContext.snapModule.snapsForChatBoxByToTime(_chatBox.id, first.createTime);
          }
          _hasForward = snaps != null && snaps.length >= PAGE_SIZE;
          AuvChatLog.d('ChatDataSource - LoadData(forward): $_hasForward, $_hasBackward, $snaps}');
        }
        break;
      case ChatLoadDirection.backward:
        if (_hasBackward) {
          final last = lastSnap();
          final from = last == null ? 0 : last.createTime??0 + 1;
          snaps = await Application.chatContext.snapModule.snapsForChatBoxByTime(_chatBox.id, from, 0);
          _hasBackward = snaps != null && snaps.length >= PAGE_SIZE;
          AuvChatLog.d('ChatDataSource - LoadData(backward): $_hasForward, $_hasBackward, $snaps');
        }
        break;
    }

    /// 移除已加载
    if (snaps != null && snaps.isNotEmpty) {
      if (_moreFirstSnap != null) _isMoreLoaded = snaps.contains(_moreFirstSnap);

      snaps.removeWhere((e) {
        for (var g in _groups) {
          if (g.snaps.contains(e)) return true;
        }
        return false;
      });
    }

    _preHandleSnaps(snaps);

    final groups = ChatSnapSortGroup.sortSnaps(
      snaps,
      _moreFirstSnap,
      direction != ChatLoadDirection.backward || _groups.isEmpty ? null : _groups.last,
    );
    if (groups != null && groups.isNotEmpty) {
      switch (direction) {
        case ChatLoadDirection.normal:
        case ChatLoadDirection.backward:
          _groups.addAll(groups);
          break;
        case ChatLoadDirection.forward:
          _groups.insertAll(0, groups);
          break;
      }
    }

    bool loaded = snaps != null && snaps.isNotEmpty;
    if (loaded) _updateItems();
    _isLoading = false;
    return loaded;
  }


  Future<bool> deleteSnaps(List<ChatSnap> snaps) async {
    bool changed = false;
    snaps.forEach((e) {
      for (var g in _groups) {
        if (g.snaps.contains(e)) {
          g.snaps.remove(e);
          changed = true;
          break;
        }
      }
    });
    _groups.removeWhere((e) => e.isEmpty());
    if (changed) _updateItems();
    return changed;
  }


  Future<void> loadMoreItems() async {
    if (_isMoreLoaded) return;
    _isLoading = true;

    List<ChatSnap> snaps = [];
    final forward =
        await Application.chatContext.snapModule.snapsForChatBoxByToTime(_chatBox.id, _moreFirstSnap?.createTime);
    _hasForward = forward != null && forward.length >= PAGE_SIZE;
    Utils.nullSafe<List<ChatSnap>>(forward, notNullBlock: (obj) {snaps.addAll(obj); });

    bool jump = _moreCount > 2 * PAGE_SIZE;
    final backward = await Application.chatContext.snapModule
        .snapsForChatBoxByTime(_chatBox.id, _moreFirstSnap?.createTime, jump ? null : firstSnap()?.createTime);
    _hasBackward = jump;
    if (backward != null) snaps.removeWhere((e) => backward.contains(e));
    Utils.nullSafe<List<ChatSnap>>(backward, notNullBlock: (obj) {snaps.addAll(obj); });
    _preHandleSnaps(snaps);

    final groups = ChatSnapSortGroup.sortSnaps(snaps);
    if (groups != null && groups.isNotEmpty) {
      if (jump) {
        _groups.clear();
        _groups.addAll(groups);
      } else {
        _groups.insertAll(0, groups);
      }
      _updateItems();
    }

    _isLoading = false;
  }
}
