import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/models/timer_model.dart';

class TimerScreen extends StatelessWidget {
  // ルート名の定義
  static const routeName = '/timer';
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '残り時間: ${timerModel.secondsRemaining} 秒',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (!timerModel.isActive) {
                      timerModel.startTimer();
                    }
                  },
                  child: const Text('スタート'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    timerModel.stopTimer();
                  },
                  child: const Text('ストップ'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    timerModel.resetTimer();
                  },
                  child: const Text('リセット'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
