import 'package:flutter/material.dart';

class ScaleYWidget extends AnimatedWidget {
  final Widget child;
  final Alignment alignment;

  const ScaleYWidget({
    super.key,
    required Animation<double> scaleY,
    required this.child,
    this.alignment = Alignment.center,
  }) : super(listenable: scaleY);

  Animation<double> get scale => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(1.0, scale.value, 1.0),
      alignment: alignment,
      child: child,
    );
  }
}
