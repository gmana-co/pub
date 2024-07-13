import 'dart:math';

import 'package:flutter/material.dart';

import 'g_wave_custom_paint.dart';

class GSpinner extends StatefulWidget {
  final Color color;

  final Color trackColor;
  final Color waveColor;
  final double size;
  final Duration duration;
  final Curve curve;
  final Widget? child;
  final AnimationController? controller;
  const GSpinner({
    super.key,
    required this.color,
    this.trackColor = const Color(0x68757575),
    this.waveColor = const Color(0x68757575),
    this.size = 50,
    this.duration = const Duration(milliseconds: 3000),
    this.curve = Curves.decelerate,
    this.child,
    this.controller,
  });

  @override
  State<GSpinner> createState() => _GSpinnerState();
}

class _GSpinnerState extends State<GSpinner> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final size = Size.square(min(min(constraints.maxWidth, constraints.maxHeight), widget.size));
      final childMaxSize = Size.square(widget.size * 0.7);
      return SizedBox.fromSize(
        size: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: size,
              painter: GWaveCustomPaint(
                size: size,
                color: widget.color,
                trackColor: widget.trackColor,
                waveColor: widget.waveColor,
                curve: widget.curve,
                hasChild: widget.child != null,
                controller: _controller,
              ),
            ),
            if (widget.child != null) Center(child: ConstrainedBox(constraints: BoxConstraints.tight(childMaxSize), child: widget.child))
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(duration: widget.duration, vsync: this))..repeat();
  }
}
