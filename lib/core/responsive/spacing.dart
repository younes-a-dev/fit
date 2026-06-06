import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'responsive_context.dart';

class Spacing {
  const Spacing._();

  // ── Scale
  static const double xs   = 4;
  static const double sm   = 8;
  static const double md   = 16;
  static const double lg   = 24;
  static const double xl   = 32;
  static const double xxl  = 48;
  static const double xxxl = 64;

  // ── Const vertical widgets
  static const Widget vXs   = SizedBox(height: xs);
  static const Widget vSm   = SizedBox(height: sm);
  static const Widget vMd   = SizedBox(height: md);
  static const Widget vLg   = SizedBox(height: lg);
  static const Widget vXl   = SizedBox(height: xl);
  static const Widget vXxl  = SizedBox(height: xxl);
  static const Widget vXxxl = SizedBox(height: xxxl);

  // ── Const horizontal widgets
  static const Widget hXs   = SizedBox(width: xs);
  static const Widget hSm   = SizedBox(width: sm);
  static const Widget hMd   = SizedBox(width: md);
  static const Widget hLg   = SizedBox(width: lg);
  static const Widget hXl   = SizedBox(width: xl);
  static const Widget hXxl  = SizedBox(width: xxl);
  static const Widget hXxxl = SizedBox(width: xxxl);

  // ── Custom size (when we need exact value)
  static Widget v(double value) => SizedBox(height: value);
  static Widget h(double value) => SizedBox(width: value);

  // ── Responsive Gap widgets
  static Widget responsiveV(BuildContext context) => Gap(
    context.responsive(mobile: md, tablet: lg, desktop: xl),
  );
  static Widget responsiveH(BuildContext context) => Gap(
    context.responsive(mobile: md, tablet: lg, desktop: xl),
  );
}