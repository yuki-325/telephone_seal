import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:telephone_seal/common/utils/logger_util.dart';

class TimerModel extends ChangeNotifier {
  late Duration _initialDuration; // 初期時間を格納する変数
  late Duration _currentDuration; // 現在の残り時間を格納する変数
  bool _isActive = false;
  late Timer _timer;
  late final TickerProvider _tickerProvider;
  late AnimationController _controller;
  TimerModel(String initialTime) {
    _initialDuration = parseTime(initialTime); // 指定された時間を解析してDurationに変換
    _currentDuration = _initialDuration;
    _tickerProvider = TimerModelTickerProvider();
    _controller = AnimationController(
      vsync: _tickerProvider, // カスタムクラスを使用
      duration: const Duration(seconds: 1),
    );
  }

  AnimationController get controller {
    return _controller;
  }

  String get timeRemaining {
    // 残り時間をHH:mm:ss形式の文字列にフォーマット
    final hours = _currentDuration.inHours.toString().padLeft(2, '0');
    final minutes =
        (_currentDuration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds =
        (_currentDuration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  double get percentage {
    LoggerUtil.debug("get percentage _currentDuration :=> $_currentDuration");
    LoggerUtil.debug("get percentage _initialDuration :=> $_initialDuration");

    final currentMilliseconds = _currentDuration.inMilliseconds;
    final totalMilliseconds = _initialDuration.inMilliseconds;

    if (currentMilliseconds <= 0 || totalMilliseconds <= 0) {
      return 0.0;
    }

    final percentage =
        (currentMilliseconds / totalMilliseconds).clamp(0.0, 1.0);
    LoggerUtil.debug("get percentage return :=> $percentage");
    return percentage;
  }

  bool get isActive => _isActive;

  void startTimer() {
    LoggerUtil.debug("startTimer() begin");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentDuration.inSeconds > 0) {
        _currentDuration -= const Duration(seconds: 1);
        _controller.forward();
        notifyListeners();
      } else {
        _timer.cancel();
        _isActive = false;
        notifyListeners();
      }
    });
    // if (_controller.isAnimating) {
    //   _controller.stop();
    // }
    // _controller.reset();
    // _controller.duration = _currentDuration;
    // _controller.forward();
    // タイマーの残り時間に応じて`percentage`を更新
    // 例: タイマーが進行する度に `percentage = 新しい割合` を計算し、`notifyListeners()`を呼び出す
    notifyListeners();
    _isActive = true;
    LoggerUtil.debug("startTimer() end");
  }

  void stopTimer() {
    LoggerUtil.debug("stopTimer() begin");
    if (_timer.isActive) {
      _timer.cancel();
      _isActive = false;
      notifyListeners();
    }
    if (_controller.isAnimating) {
      // _controller.stop();
      // _controller.dispose();
    }
    LoggerUtil.debug("stopTimer() end");
  }

  void resetTimer() {
    LoggerUtil.debug("resetTimer() begin");
    _timer.cancel();
    _currentDuration = _initialDuration;
    _isActive = false;
    _controller.stop();
    notifyListeners();
    LoggerUtil.debug("resetTimer() end");
  }

  // HH:mm:ss形式の文字列をDurationに変換するユーティリティメソッド
  Duration parseTime(String time) {
    final parts = time.split(':');
    if (parts.length == 3) {
      final hours = int.tryParse(parts[0]);
      final minutes = int.tryParse(parts[1]);
      final seconds = int.tryParse(parts[2]);
      if (hours != null && minutes != null && seconds != null) {
        return Duration(hours: hours, minutes: minutes, seconds: seconds);
      }
    }
    // パースに失敗した場合、デフォルトとして0秒のDurationを返す
    return Duration.zero;
  }
}

class TimerModelTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
