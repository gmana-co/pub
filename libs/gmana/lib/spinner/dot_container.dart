import 'package:flutter/material.dart';

class DotContainer extends StatelessWidget {
  final Interval offsetInterval;
  final Interval reverseOffsetInterval;
  final Interval heightInterval;
  final Interval reverseHeightInterval;
  final double size;
  final Color color;
  final double maxHeight;
  final AnimationController controller;

  const DotContainer({
    super.key,
    required this.offsetInterval,
    required this.reverseOffsetInterval,
    required this.heightInterval,
    required this.reverseHeightInterval,
    required this.size,
    required this.color,
    required this.maxHeight,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final double maxDy = -(size * 0.20);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Opacity(
              opacity: controller.value <= offsetInterval.end ? 1 : 0,
              child: Transform.translate(
                offset: Tween<Offset>(begin: Offset.zero, end: Offset(0, maxDy))
                    .animate(CurvedAnimation(
                        parent: controller, curve: offsetInterval))
                    .value,
                child: Container(
                  width: size * 0.13,
                  height: Tween<double>(begin: size * 0.13, end: maxHeight)
                      .animate(CurvedAnimation(
                          parent: controller, curve: heightInterval))
                      .value,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(size),
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: controller.value >= offsetInterval.end ? 1 : 0,
              child: Transform.translate(
                offset: Tween<Offset>(begin: Offset(0, maxDy), end: Offset.zero)
                    .animate(CurvedAnimation(
                        parent: controller, curve: reverseOffsetInterval))
                    .value,
                child: Container(
                  width: size * 0.13,
                  height: Tween<double>(end: size * 0.13, begin: maxHeight)
                      .animate(CurvedAnimation(
                          parent: controller, curve: reverseHeightInterval))
                      .value,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(size),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
