import 'package:flutter/widgets.dart';

import 'responsive_builder.dart';

/// A widget that displays different children based on device type.
///
/// Provides a simple way to show different layouts for mobile, tablet,
/// and desktop without manual device type checking.
///
/// Example:
/// ```dart
/// ResponsiveLayout(
///   mobile: MobileView(),
///   tablet: TabletView(),
///   desktop: DesktopView(),
/// )
/// ```
///
/// If [tablet] is not provided, [mobile] is used for tablet devices.
/// If [desktop] is not provided, [tablet] (or [mobile]) is used for desktop.
///
/// See also:
/// - [ResponsiveBuilder] for more control over responsive layouts
class ResponsiveLayout extends StatelessWidget {
  /// The widget to display on mobile devices.
  final Widget mobile;

  /// The widget to display on tablet devices.
  ///
  /// If null, [mobile] is used.
  final Widget? tablet;

  /// The widget to display on desktop devices.
  ///
  /// If null, [tablet] (or [mobile] if tablet is also null) is used.
  final Widget? desktop;

  /// Creates a [ResponsiveLayout] with device-specific children.
  const ResponsiveLayout({
    required this.mobile,
    super.key,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, info) {
        if (info.isDesktop && desktop != null) return desktop!;
        if (info.isTablet && tablet != null) return tablet!;
        return mobile;
      },
    );
  }
}
