import 'package:flutter/material.dart';
import 'package:gmana/spinner/spinner_wave_dot.dart';

class GElevatedButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? textStyle;
  final Color loadingColor;
  final double loadingSize;

  const GElevatedButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.loadingColor = Colors.white,
    this.loadingSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading ? SpinnerWaveDot(color: loadingColor, size: loadingSize) : Text(text, style: textStyle),
    );
  }
}
