import 'package:flutter/material.dart';

class GSpinnerLinear extends StatelessWidget {
  const GSpinnerLinear({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: const LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.purple),
      ),
    );
  }
}
