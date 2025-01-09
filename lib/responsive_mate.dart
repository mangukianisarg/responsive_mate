library responsive_mate;

import 'package:flutter/material.dart';

/// A widget that provides a responsive layout for mobile, tablet, and desktop views.
///
/// This widget dynamically displays the appropriate child widget based on the
/// screen width. You can customize the breakpoints for mobile and tablet views.
///
/// Example:
/// ```dart
/// Responsive(
///   mobile: Text('Mobile View'),
///   tablet: Text('Tablet View'),
///   desktop: Text('Desktop View'),
/// )
/// ```
class Responsive extends StatelessWidget {
  /// The widget to display on mobile screens.
  final Widget mobile;

  /// The widget to display on tablet screens. If null, the mobile widget is used.
  final Widget? tablet;

  /// The widget to display on desktop screens.
  final Widget desktop;

  /// The maximum width for mobile screens.
  ///
  /// Defaults to `850`.
  final double mobileBreakpoint;

  /// The maximum width for tablet screens.
  ///
  /// Defaults to `1100`.
  final double tabletBreakpoint;

  /// Creates a [Responsive] widget.
  ///
  /// [mobile] and [desktop] are required. [tablet] is optional.
  /// Default breakpoints are `850` for mobile and `1100` for tablet.
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
    this.mobileBreakpoint = 850,
    this.tabletBreakpoint = 1100,
  });

  /// Returns `true` if the screen width is less than the mobile breakpoint.
  ///
  /// Example:
  /// ```dart
  /// if (responsive.isMobile(context)) {
  ///   // Show mobile layout
  /// }
  /// ```
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  /// Returns `true` if the screen width is between the mobile and tablet breakpoints.
  ///
  /// Example:
  /// ```dart
  /// if (responsive.isTablet(context)) {
  ///   // Show tablet layout
  /// }
  /// ```
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletBreakpoint &&
      MediaQuery.of(context).size.width >= mobileBreakpoint;

  /// Returns `true` if the screen width is greater than or equal to the tablet breakpoint.
  ///
  /// Example:
  /// ```dart
  /// if (responsive.isDesktop(context)) {
  ///   // Show desktop layout
  /// }
  /// ```
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= tabletBreakpoint) {
      return desktop;
    } else if (size.width >= mobileBreakpoint && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
