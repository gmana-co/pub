import 'package:flutter/material.dart';

import 'abstract_section.dart';

// ignore: must_be_immutable
class CustomSection extends AbstractSection {
  final Widget child;

  CustomSection({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
