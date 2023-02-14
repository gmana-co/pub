import 'package:flutter/material.dart';

import 'abstract_section.dart';
import 'colors.dart';

class SettingsList extends StatelessWidget {
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final List<AbstractSection>? sections;
  final Color? backgroundColor;
  final Color? lightBackgroundColor;
  final Color? darkBackgroundColor;
  final EdgeInsetsGeometry? contentPadding;

  const SettingsList({
    super.key,
    this.sections,
    this.backgroundColor,
    this.physics,
    this.shrinkWrap = false,
    this.lightBackgroundColor,
    this.darkBackgroundColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: Theme.of(context).brightness == Brightness.light
            ? backgroundColor ?? lightBackgroundColor ?? backgroundGray
            : backgroundColor ?? darkBackgroundColor ?? Colors.black,
        child: ListView.builder(
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: contentPadding,
          itemCount: sections!.length,
          itemBuilder: (context, index) {
            AbstractSection current = sections![index];
            AbstractSection? futureOne;
            if (index + 1 != sections!.length) {
              futureOne = sections![index + 1];
            }

            // Add divider if title is null
            if (futureOne != null && futureOne.title != null) {
              current.showBottomDivider = false;
              return current;
            } else {
              current.showBottomDivider = true;
              return current;
            }
          },
        ),
      ),
    );
  }
}
