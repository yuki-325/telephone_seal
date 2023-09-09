import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/models/timer_model.dart';

class TimerGaugeWidget extends StatelessWidget {
  final double radius = 100.0; // ゲージの半径
  final double strokeWidth = 8.0; // ゲージの太さ
  const TimerGaugeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context, listen: true);
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black87, width: strokeWidth)),
      child: Center(
        child: Text(
          timerModel.timeRemaining,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
