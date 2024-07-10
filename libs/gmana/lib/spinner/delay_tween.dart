import 'dart:math' show sin, pi;

import 'package:flutter/material.dart';

class DelayTween extends Tween<double> {
  final double delay;

  DelayTween({super.begin, super.end, required this.delay});

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);

  @override
  double lerp(double t) {
    return super.lerp((sin((t - delay) * 2 * pi) + 1) / 2);
  }
}
