import 'dart:async';

import 'package:flutter/material.dart';

class TimerModel extends ChangeNotifier {
  int _secondsRemaining = 60;
  bool _isActive = false;
  late Timer _timer;

  int get secondsRemaining => _secondsRemaining;
  bool get isActive => _isActive;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _timer.cancel();
        _isActive = false;
        notifyListeners();
      }
    });
    _isActive = true;
    notifyListeners();
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
      _isActive = false;
      notifyListeners();
    }
  }

  void resetTimer() {
    _timer.cancel();
    _secondsRemaining = 60;
    _isActive = false;
    notifyListeners();
  }
}
