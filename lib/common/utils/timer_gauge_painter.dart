import 'dart:math';

import 'package:flutter/material.dart';

class TimerGaugePainter extends CustomPainter {
  final double percentage; // ゲージの割合（0.0から1.0までの値）
  final Color color; // ゲージの色

  TimerGaugePainter({
    required this.percentage,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color // ゲージの色を設定
      ..strokeCap = StrokeCap.round // 線の端を丸くする
      ..style = PaintingStyle.stroke // 線を描画モードで描画
      ..strokeWidth = 8.0; // 線の幅

    final center = Offset(size.width / 2, size.height / 2); // 中心座標を計算
    final radius = min(size.width / 2, size.height / 2); // 半径を計算
    final sweepAngle = 2 * pi * percentage; // 弧の角度を計算

    // 弧を描画（中心座標、半径、開始角度（上から時計回り）、弧の角度、描画スタイル）
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // 開始角度（上から時計回り）
      sweepAngle, // 弧の角度
      false, // 弧を塗りつぶさない
      paint, // 描画設定
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
