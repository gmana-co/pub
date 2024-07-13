import 'dart:math';

import 'package:flutter/material.dart';

import 'vertical_point.dart';

class GWaveCustomPaint extends CustomPainter {
  final Color color;

  final Color trackColor;
  final Color waveColor;
  late final double _waveMaxRadius;

  late final Animation<double> _spinnerAnimation;
  late final Animation<double> _waveVerticalShiftAnimation;
  late final Animation<double>? _waveAmplitudeAnimation;
  GWaveCustomPaint({
    required this.color,
    required this.trackColor,
    required this.waveColor,
    required AnimationController controller,
    required bool hasChild,
    required Curve curve,
    required Size size,
  }) : super(repaint: controller) {
    _waveMaxRadius = _lineRadius(size.width, 10);
    _spinnerAnimation = Tween<double>(begin: 0, end: pi * 2).animate(CurvedAnimation(curve: curve, parent: controller));
    _waveVerticalShiftAnimation = Tween<double>(begin: _waveMaxRadius, end: -_waveMaxRadius).animate(CurvedAnimation(curve: curve, parent: controller));
    _waveAmplitudeAnimation = !hasChild ? Tween<double>(begin: 0, end: -4).animate(CurvedAnimation(curve: curve, parent: controller)) : null;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final spinnerMaxWidth = max(6.0, size.width * 0.045);
    _drawArc(
      size,
      canvas,
      color: trackColor,
      lineRadiusMultiplier: 4,
      startAngle: pi,
      sweepAngle: 2 * pi,
      strokeWidth: spinnerMaxWidth,
    );
    _drawArc(
      size,
      canvas,
      color: color,
      lineRadiusMultiplier: 4,
      startAngle: _spinnerAnimation.value,
      sweepAngle: pi,
      strokeWidth: spinnerMaxWidth,
    );

    if (_waveAmplitudeAnimation != null) {
      _drawWave(size, canvas);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  void _drawArc(
    Size size,
    Canvas canvas, {
    required Color color,
    required double lineRadiusMultiplier,
    required double startAngle,
    required double sweepAngle,
    double strokeWidth = 4,
    PaintingStyle paintingStyle = PaintingStyle.stroke,
  }) {
    final lineRadius = _lineRadius(size.width, lineRadiusMultiplier) * 2;
    final centerOffset = Offset(size.width / 2, size.width / 2);
    canvas.drawArc(
      Rect.fromCenter(center: centerOffset, width: lineRadius, height: lineRadius),
      startAngle,
      sweepAngle,
      false,
      Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..style = paintingStyle,
    );
  }

  void _drawWave(Size size, Canvas canvas) {
    final bounds = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: Size.fromRadius(_waveMaxRadius).width,
      height: Size.fromRadius(_waveMaxRadius).width,
    );
    canvas.save();
    canvas.clipRRect(RRect.fromRectAndRadius(bounds, Radius.circular(_waveMaxRadius)));
    canvas.translate(size.width / 2, size.height / 2);

    final path = Path()..moveTo(-_waveMaxRadius, _waveMaxRadius);
    for (int i = -_waveMaxRadius.toInt(); i < _waveMaxRadius.toInt(); i++) {
      path.lineTo(
        i.toDouble(),
        verticalPoint(
          waveLength: _waveMaxRadius * 3.5,
          verticalShift: _waveVerticalShiftAnimation.value,
          amplitude: size.width * 0.05 * (_waveAmplitudeAnimation?.value ?? 0),
          phaseShift: size.width * 0.15,
          value: i.toDouble(),
        ),
      );
    }
    path.lineTo(_waveMaxRadius, _waveMaxRadius);

    canvas.drawPath(path, Paint()..color = waveColor);
    canvas.restore();
  }

  double _lineRadius(double width, double multiplier) => (width - (multiplier * max(2.5, width * 0.015))) / 2;
}
