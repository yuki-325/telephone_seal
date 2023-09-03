import 'package:flutter/material.dart';
import 'package:telephone_seal/widget/timer_widget.dart';

class TimerScreen extends StatelessWidget {
  // ルート名の定義
  static const routeName = '/timer';
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer App'),
      ),
      body: const Center(
        child: TimerWidget(),
      ),
    );
  }
}
