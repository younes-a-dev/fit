import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, desktop }

class AppBreakpoints {
  static const double tablet  = 600;
  static const double desktop = 1200;
  const AppBreakpoints._();
}

extension ResponsiveContext on BuildContext {

  ScreenType get screenType {
    final width = MediaQuery.sizeOf(this).width;
    if (width < AppBreakpoints.tablet)  return ScreenType.mobile;
    if (width < AppBreakpoints.desktop) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  // ── Boolean helpers
  bool get isMobile  => screenType == ScreenType.mobile;
  bool get isTablet  => screenType == ScreenType.tablet;
  bool get isDesktop => screenType == ScreenType.desktop;

  // ── Generic value switcher
  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet)  return tablet  ?? mobile;
    return mobile;
  }

  // ── Layout
  double get horizontalPadding => responsive(
    mobile: 16.0, tablet: 24.0, desktop: 32.0,
  );
  double get verticalPadding => responsive(
    mobile: 12.0, tablet: 20.0, desktop: 28.0,
  );
  double get contentMaxWidth => responsive(
    mobile: double.infinity, tablet: 600.0, desktop: 800.0,
  );

  // ── Typography
  double get displayFontSize  => responsive(mobile: 40.0, tablet: 48.0, desktop: 56.0);
  double get headingFontSize  => responsive(mobile: 28.0, tablet: 34.0, desktop: 40.0);
  double get titleFontSize    => responsive(mobile: 20.0, tablet: 24.0, desktop: 28.0);
  double get bodyFontSize     => responsive(mobile: 14.0, tablet: 16.0, desktop: 18.0);
  double get captionFontSize  => responsive(mobile: 11.0, tablet: 12.0, desktop: 13.0);

  // ── Grid 
  int    get gridColumns      => responsive(mobile: 2,    tablet: 3,    desktop: 4);
  double get cardBorderRadius => responsive(mobile: 12.0, tablet: 16.0, desktop: 20.0);
  double get iconSize         => responsive(mobile: 20.0, tablet: 24.0, desktop: 28.0);
}