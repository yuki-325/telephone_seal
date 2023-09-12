import 'package:flutter/material.dart';
import 'package:telephone_seal/common/utils/timer_gauge_painter.dart';
import 'package:telephone_seal/models/timer_model.dart';

class TimerGaugeWidget extends StatelessWidget {
  const TimerGaugeWidget({
    super.key,
    required AnimationController controller,
    required this.radius,
    required this.timerModel,
  }) : _controller = controller;

  final AnimationController _controller;
  final double radius;
  final TimerModel timerModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn)),
        builder: (BuildContext context, Widget? child) {
          return Column(children: [
            // Text("_percentage :=> $_percentage"),
            CustomPaint(
              size: Size(radius * 2, radius * 2),
              painter: TimerGaugePainter(
                  percentage: _controller.value, color: Colors.purple),
              child: SizedBox(
                width: radius * 2,
                height: radius * 2,
                child: Center(
                  child: Text(
                    timerModel.timeRemaining,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ]);
        });
  }
}
