import 'package:flutter/widgets.dart';

import 'enums.dart';
import 'responsive_info.dart';
import 'responsive_spacing.dart';

/// Extension on [BuildContext] for quick responsive access.
///
/// Provides convenient getters and methods without needing [ResponsiveBuilder].
///
/// Example:
/// ```dart
/// Widget build(BuildContext context) {
///   return Padding(
///     padding: context.safePadding,
///     child: Column(
///       children: [
///         Text(
///           'Quick Access',
///           style: TextStyle(fontSize: context.responsiveFontSize(24)),
///         ),
///         SizedBox(height: context.spacing(ResponsiveSpacing.md)),
///         if (context.isMobile)
///           MobileWidget()
///         else
///           DesktopWidget(),
///       ],
///     ),
///   );
/// }
/// ```
///
/// Note: This uses [MediaQuery], so values are based on the screen size,
/// not the widget's constraints. For constraint-based responsive layouts,
/// use [ResponsiveBuilder] instead.
extension ResponsiveContextExtension on BuildContext {
  /// Gets the [ResponsiveInfo] for this context.
  ResponsiveInfo get responsive {
    final mediaQuery = MediaQuery.of(this);
    return ResponsiveInfo.fromMediaQuery(mediaQuery);
  }

  // ========== Device Type Helpers ==========

  /// Whether the current device is classified as mobile.
  bool get isMobile => responsive.isMobile;

  /// Whether the current device is classified as tablet.
  bool get isTablet => responsive.isTablet;

  /// Whether the current device is classified as desktop.
  bool get isDesktop => responsive.isDesktop;

  /// Whether the screen is in landscape orientation.
  bool get isLandscape => responsive.isLandscape;

  /// Whether the screen is in portrait orientation.
  bool get isPortrait => responsive.isPortrait;

  /// Gets the current device type.
  DeviceType get deviceType => responsive.deviceType;

  // ========== Screen Size Helpers ==========

  /// Whether this is a very small screen (< 360px).
  bool get isNarrowScreen => responsive.isNarrowScreen;

  /// Whether this is a compact width screen (< 400px).
  bool get isCompactWidth => responsive.isCompactWidth;

  /// Whether this is an extra tall screen (> 800px height).
  bool get isExpandedHeight => responsive.isExpandedHeight;

  /// Whether this is an extra wide screen (> 1000px width, mobile).
  bool get isExtraWide => responsive.isExtraWide;

  /// Whether this is a narrow tablet (< 700px, portrait).
  bool get isNarrowTablet => responsive.isNarrowTablet;

  // ========== Responsive Values ==========

  /// Calculates a responsive font size based on screen width.
  double responsiveFontSize(double baseSize) =>
      responsive.responsiveFontSize(baseSize);

  /// Gets responsive horizontal padding (16/24/32).
  double horizontalPadding() => responsive.horizontalPadding();

  /// Gets responsive vertical padding (16/24/32).
  double verticalPadding() => responsive.verticalPadding();

  /// Gets the spacing value for the given [ResponsiveSpacing].
  double spacing(ResponsiveSpacing spacing) => responsive.spacing(spacing);

  /// Gets safe padding that respects screen edges.
  EdgeInsets get safePadding => responsive.safePadding;

  /// Gets padding that includes system UI insets.
  EdgeInsets safeAreaPadding() => responsive.safeAreaPadding(this);
}
