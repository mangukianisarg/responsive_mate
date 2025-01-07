library responsive;

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  // Customizable breakpoints
  final double mobileBreakpoint;
  final double tabletBreakpoint;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileBreakpoint = 850, // Default mobile size is 850
    this.tabletBreakpoint = 1100, // Default tablet size is 1100
  });

  // This isMobile, isTablet, isDesktop with customizable breakpoints
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint &&
      MediaQuery.of(context).size.width >= mobileBreakpoint;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than tabletBreakpoint then we consider it a desktop
    if (size.width >= tabletBreakpoint) {
      return desktop;
    }
    // If width is less than tabletBreakpoint and more than mobileBreakpoint we consider it as tablet
    else if (size.width >= mobileBreakpoint && tablet != null) {
      return tablet!;
    }
    // Or less than mobileBreakpoint we called it mobile
    else {
      return mobile;
    }
  }
}
