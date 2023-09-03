import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/models/timer_model.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context, listen: true);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          timerModel.timeRemaining,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: timerModel.isActive
                  ? timerModel.stopTimer
                  : timerModel.startTimer,
              child: Text(timerModel.isActive ? "一時停止" : '開始'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: timerModel.resetTimer,
              child: const Text('リセット'),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
