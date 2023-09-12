import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/common/utils/logger_util.dart';
import 'package:telephone_seal/models/timer_model.dart';
import 'package:telephone_seal/widget/timer_gauge_widget.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget>
    with SingleTickerProviderStateMixin {
  final double radius = 100.0;
  final double strokeWidth = 8.0;
  late AnimationController _controller;
  late TimerModel _timerModel;

  @override
  void initState() {
    super.initState();
    _timerModel = Provider.of<TimerModel>(context, listen: false);
    _controller = AnimationController(
      vsync: this,
      duration: _timerModel.initialDuration,
      reverseDuration: const Duration(milliseconds: 1500),
    );
    _controller.addListener(
      () => LoggerUtil.debug("_controller.value :=> ${_controller.value}"),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TimerGaugeWidget(
            controller: _controller, radius: radius, timerModel: timerModel),
        // タイマーのゲージ
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: timerModel.isActive ? _onStop : _onStart,
              child: Text(timerModel.isActive ? "一時停止" : '開始'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: _onReset,
              child: const Text('リセット'),
            ),
          ],
        ),
      ],
    );
  }

  void _onStart() {
    LoggerUtil.debug("onStart() begin");
    _controller.forward();
    _timerModel.startTimer();
    LoggerUtil.debug("onStart() end");
  }

  void _onStop() {
    LoggerUtil.debug("onStart() begin");
    _controller.stop();
    _timerModel.stopTimer();
    LoggerUtil.debug("onStart() end");
  }

  void _onReset() {
    LoggerUtil.debug("onStart() begin");
    _controller.reverse();
    _timerModel.resetTimer();
    LoggerUtil.debug("onStart() end");
  }
}
