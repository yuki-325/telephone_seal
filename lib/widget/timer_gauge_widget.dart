import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telephone_seal/common/utils/timer_gauge_painter.dart';
import 'package:telephone_seal/models/timer_model.dart';

class TimerGaugeWidget extends StatefulWidget {
  const TimerGaugeWidget({
    super.key,
  });
  @override
  State<TimerGaugeWidget> createState() => _TimerGaugeWidgetState();
}

class _TimerGaugeWidgetState extends State<TimerGaugeWidget>
    with SingleTickerProviderStateMixin {
  final double radius = 100.0; // ゲージの半径
  final double strokeWidth = 8.0; // ゲージの太さ
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerModel>(context, listen: true);
    return AnimatedBuilder(
        animation: Tween<double>(
          begin: timerModel.percentage,
          end: 0,
        ).animate(CurvedAnimation(
            parent: timerModel.controller, curve: Curves.easeInOut)),
        builder: (BuildContext context, Widget? child) {
          return Column(children: [
            CustomPaint(
              size: Size(radius * 2, radius * 2),
              painter: TimerGaugePainter(
                  percentage: timerModel.percentage, color: Colors.purple),
              child: SizedBox(
                width: radius * 2,
                height: radius * 2,
                // decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     border:
                //         Border.all(color: Colors.black87, width: strokeWidth)),
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
    // return SizedBox(
    //   // width: double.infinity,
    //   // height: double.infinity,
    //   // decoration: BoxDecoration(
    //   //     shape: BoxShape.circle,
    //   //     border: Border.all(color: Colors.black87, width: strokeWidth)),
    //   child: Row(
    //     children: [
    //       // TODO timer gauge仮
    //       CustomPaint(
    //         size: Size(radius * 2, radius * 2),
    //         painter: TimerGaugePainter(percentage: 1, color: Colors.purple),
    //       ),
    //       Center(
    //         child: Text(
    //           timerModel.timeRemaining,
    //           style: const TextStyle(fontSize: 24),
    //         ),
    //       )
    //     ],
    //   ),
    // );
