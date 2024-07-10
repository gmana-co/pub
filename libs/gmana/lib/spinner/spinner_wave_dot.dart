import 'package:flutter/material.dart';

import 'dot_container.dart';

class SpinnerWaveDot extends StatefulWidget {
  final double size;
  final Color color;

  const SpinnerWaveDot({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  State<SpinnerWaveDot> createState() => _SpinnerWaveDotState();
}

class _SpinnerWaveDotState extends State<SpinnerWaveDot> with SingleTickerProviderStateMixin {
  late AnimationController _offsetController;

  @override
  Widget build(BuildContext context) {
    final double oddDotHeight = widget.size * 0.4;
    final double evenDotHeight = widget.size * 0.7;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          DotContainer(
            controller: _offsetController,
            heightInterval: const Interval(0.0, 0.1),
            offsetInterval: const Interval(0.18, 0.28),
            reverseHeightInterval: const Interval(0.28, 0.38),
            reverseOffsetInterval: const Interval(0.47, 0.57),
            color: widget.color,
            size: widget.size,
            maxHeight: oddDotHeight,
          ),
          DotContainer(
            controller: _offsetController,
            heightInterval: const Interval(0.09, 0.19),
            offsetInterval: const Interval(0.27, 0.37),
            reverseHeightInterval: const Interval(0.37, 0.47),
            reverseOffsetInterval: const Interval(0.56, 0.66),
            color: widget.color,
            size: widget.size,
            maxHeight: evenDotHeight,
          ),
          DotContainer(
            controller: _offsetController,
            heightInterval: const Interval(0.18, 0.28),
            offsetInterval: const Interval(0.36, 0.46),
            reverseHeightInterval: const Interval(0.46, 0.56),
            reverseOffsetInterval: const Interval(0.65, 0.75),
            color: widget.color,
            size: widget.size,
            maxHeight: oddDotHeight,
          ),
          DotContainer(
            controller: _offsetController,
            heightInterval: const Interval(0.27, 0.37),
            offsetInterval: const Interval(0.45, 0.55),
            reverseHeightInterval: const Interval(0.55, 0.65),
            reverseOffsetInterval: const Interval(0.74, 0.84),
            color: widget.color,
            size: widget.size,
            maxHeight: evenDotHeight,
          ),
          DotContainer(
            controller: _offsetController,
            heightInterval: const Interval(0.36, 0.46),
            offsetInterval: const Interval(0.54, 0.64),
            reverseHeightInterval: const Interval(0.64, 0.74),
            reverseOffsetInterval: const Interval(0.83, 0.93),
            color: widget.color,
            size: widget.size,
            maxHeight: oddDotHeight,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _offsetController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _offsetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat();
  }
}
