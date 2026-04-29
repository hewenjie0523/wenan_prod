// Copyright 2013 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:collection';

///简单的LRU实现
class WenanLruMap<K, V> {
  final LinkedHashMap<K, V> _map = LinkedHashMap<K, V>();
  late final int _maxSize;

  WenanLruMap(this._maxSize);

  ///获取，并移动到队尾
  V? get(K key) {
    //先刷新一下，移动到队尾部
    V? value = _map.remove(key);
    if (value != null) {
      _map[key] = value;
    }
    return value;
  }

  /// 删除
  void remove(K key) {
    _map.remove(key);
  }

  /// 添加
  void put(K key, V value) {
    _map.remove(key);
    _map[key] = value;
    if (_map.length > _maxSize) {
      //超过最大容量，删除最早插入、但未使用的
      K evictedKey = _map.keys.first;
      _map.remove(evictedKey) as V;
    }
  }


}
