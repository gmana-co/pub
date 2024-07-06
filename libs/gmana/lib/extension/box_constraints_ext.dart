part of '../gmana.dart';

extension BreakpointUtils on BoxConstraints {
  bool get isDesktop => maxWidth > 1200;
  bool get isMobile => !isTablet && !isDesktop;
  bool get isTablet => maxWidth > 730;
}
