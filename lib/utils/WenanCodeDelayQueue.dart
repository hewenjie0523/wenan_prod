import 'dart:collection';

abstract class Delayed {
  /// @return the remaining delay; zero or negative values indicate
  /// that the delay has already elapsed
  int getDelay();

  bool equals(Delayed o);
}

class DelayQueue {
  final ListQueue<Delayed> _queue = ListQueue<Delayed>();

  void add(Delayed item) {
    _queue.add(item);
  }

  Delayed? pop() => _queue.isEmpty ? null : _queue.removeFirst();

  void remove(Delayed item) {
    _queue.removeWhere((element) {
      return item.equals(element);
    });
  }

  Delayed? poll() {
    if (_queue.isEmpty) {
      return null;
    }
    if (_queue.first.getDelay() > 0) {
      return null;
    }
    return _queue.removeFirst();
  }

  bool contains(Delayed item) {
    return _queue.any((element) {
      return item.equals(element);
    });
  }

  int size() {
    return _queue.length;
  }
}
