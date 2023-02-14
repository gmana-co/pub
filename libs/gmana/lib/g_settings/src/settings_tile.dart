import 'package:flutter/material.dart';

import 'cupertino_settings_item.dart';
import 'defines.dart';
import 'settings_tile_theme.dart';

enum _SettingsTileType { simple, switchTile }

enum Position {
  first,
  last,
  both,
  none,
}

abstract class AbstractTile extends StatelessWidget {
  const AbstractTile({super.key});
}

class SettingsTile extends AbstractTile {
  final String? title;
  final Widget? titleWidget;
  final int? titleMaxLines;
  final String? subtitle;
  final Widget? subtitleWidget;
  final int? subtitleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final Icon? iosChevron;
  final EdgeInsetsGeometry? iosChevronPadding;
  final VoidCallback? onTap;
  final Function(BuildContext context)? onPressed;
  final Function(bool value)? onToggle;
  final bool? switchValue;
  final bool enabled;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? switchActiveColor;
  final _SettingsTileType _tileType;
  final TargetPlatform? platform;
  final Position? position;

  /// iOS only supports iconColor, textColor & tileColor
  final SettingsTileTheme? theme;

  final cupertinoKey = GlobalKey<CupertinoSettingsItemState>();

  SettingsTile(
      {super.key,
      this.title,
      this.titleWidget,
      this.titleMaxLines,
      this.subtitle,
      this.subtitleMaxLines,
      this.leading,
      this.trailing,
      this.subtitleWidget,
      this.iosChevron = defaultCupertinoForwardIcon,
      this.iosChevronPadding = defaultCupertinoForwardPadding,
      @Deprecated('Use onPressed instead') this.onTap,
      this.titleTextStyle,
      this.subtitleTextStyle,
      this.enabled = true,
      this.onPressed,
      this.switchActiveColor,
      this.platform,
      this.theme,
      this.position})
      : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0);

  SettingsTile.switchTile(
      {super.key,
      this.title,
      this.titleWidget,
      this.titleMaxLines,
      this.subtitle,
      this.subtitleMaxLines,
      this.leading,
      this.enabled = true,
      this.trailing,
      this.subtitleWidget,
      required this.onToggle,
      required this.switchValue,
      this.titleTextStyle,
      this.subtitleTextStyle,
      this.switchActiveColor,
      this.platform,
      this.theme,
      this.position})
      : _tileType = _SettingsTileType.switchTile,
        onTap = null,
        onPressed = null,
        iosChevron = null,
        iosChevronPadding = null,
        assert(titleMaxLines == null || titleMaxLines > 0),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0);

  @override
  Widget build(BuildContext context) {
    final platform = this.platform ?? Theme.of(context).platform;

    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return iosTile(context);

      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return androidTile(context);

      default:
        return iosTile(context);
    }
  }

  Widget iosTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return CupertinoSettingsItem(
        key: cupertinoKey,
        enabled: enabled,
        type: SettingsItemType.toggle,
        label: title ?? '',
        labelWidget: titleWidget,
        subtitleWidget: subtitleWidget,
        labelMaxLines: titleMaxLines,
        leading: leading,
        subtitle: subtitle,
        subtitleMaxLines: subtitleMaxLines,
        switchValue: switchValue,
        onToggle: onToggle,
        labelTextStyle: titleTextStyle,
        switchActiveColor: switchActiveColor,
        subtitleTextStyle: subtitleTextStyle,
        valueTextStyle: subtitleTextStyle,
        trailing: trailing,
        listTileTheme: theme,
        position: position,
      );
    } else {
      return CupertinoSettingsItem(
        key: cupertinoKey,
        enabled: enabled,
        type: SettingsItemType.modal,
        labelWidget: titleWidget,
        subtitleWidget: subtitleWidget,
        label: title ?? '',
        labelMaxLines: titleMaxLines,
        value: subtitle,
        valueWidget: subtitleWidget,
        trailing: trailing,
        iosChevron: iosChevron,
        iosChevronPadding: iosChevronPadding,
        hasDetails: false,
        leading: leading,
        onPress: onTapFunction(context) as void Function()?,
        labelTextStyle: titleTextStyle,
        subtitleTextStyle: subtitleTextStyle,
        valueTextStyle: subtitleTextStyle,
        listTileTheme: theme,
        position: position,
      );
    }
  }

  Widget androidTile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      return ListTileTheme.merge(
        dense: theme?.dense,
        shape: theme?.shape,
        style: theme?.style,
        selectedColor: theme?.selectedColor,
        iconColor: theme?.iconColor,
        textColor: theme?.textColor,
        contentPadding: theme?.contentPadding,
        tileColor: theme?.tileColor,
        selectedTileColor: theme?.selectedTileColor,
        enableFeedback: theme?.enableFeedback,
        horizontalTitleGap: theme?.horizontalTitleGap,
        minVerticalPadding: theme?.minVerticalPadding,
        minLeadingWidth: theme?.minLeadingWidth,
        child: SwitchListTile(
          secondary: leading,
          value: switchValue!,
          activeColor: switchActiveColor,
          onChanged: enabled ? onToggle : null,
          title: titleWidget ??
              Text(
                title ?? '',
                style: titleTextStyle,
                maxLines: titleMaxLines,
                overflow: TextOverflow.ellipsis,
              ),
          subtitle: subtitleWidget ??
              (subtitle != null
                  ? Text(
                      subtitle!,
                      style: subtitleTextStyle,
                      maxLines: subtitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null),
        ),
      );
    } else {
      return ListTileTheme.merge(
        dense: theme?.dense,
        shape: theme?.shape,
        style: theme?.style,
        selectedColor: theme?.selectedColor,
        iconColor: theme?.iconColor,
        textColor: theme?.textColor,
        contentPadding: theme?.contentPadding,
        tileColor: theme?.tileColor,
        selectedTileColor: theme?.selectedTileColor,
        enableFeedback: theme?.enableFeedback,
        horizontalTitleGap: theme?.horizontalTitleGap,
        minVerticalPadding: theme?.minVerticalPadding,
        minLeadingWidth: theme?.minLeadingWidth,
        child: ListTile(
          title: titleWidget ?? Text(title ?? '', style: titleTextStyle),
          subtitle: subtitleWidget ??
              (subtitle != null
                  ? Text(
                      subtitle!,
                      style: subtitleTextStyle,
                      maxLines: subtitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    )
                  : null),
          leading: leading,
          enabled: enabled,
          trailing: trailing,
          onTap: onTapFunction(context) as void Function()?,
        ),
      );
    }
  }

  Function? onTapFunction(BuildContext context) => onTap != null || onPressed != null
      ? () {
          if (onPressed != null) {
            onPressed!.call(context);
          } else {
            onTap!.call();
          }
        }
      : null;
}

class CustomTile extends AbstractTile {
  final Widget child;
  const CustomTile({
    super.key,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
