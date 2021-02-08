import 'dart:async';
import 'package:flutter/material.dart';

class TimerStore with ChangeNotifier {
  int _timeCount = 0;
  bool _timeUp = false;
  int get timeCount => _timeCount;
  bool get timeUp => _timeUp;
  Timer _timer;
  static const ms = const Duration(milliseconds: 10);

  startTimer(int status) {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(ms, (timer) {
      updateCounter(status);
    });
    notifyListeners();
  }

  void updateCounter(int status) {
    if (status - 1 == _timeCount) {
      endTimer();
      notifyListeners();
    }
    _timeCount++;
    notifyListeners();
  }

  void endTimer() {
    _timeUp = !_timeUp;
    _timer.cancel();
    notifyListeners();
  }

  resetCount() {
    _timeCount = 0;
    if (_timeUp) {
      _timeUp = !_timeUp;
    }
    if (_timer != null) {
      _timer.cancel();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
