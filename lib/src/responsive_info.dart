import 'package:flutter/widgets.dart';

import 'breakpoints.dart';
import 'enums.dart';
import 'responsive_service.dart';
import 'responsive_spacing.dart';

/// An immutable data class containing all responsive information.
///
/// Provides device type, orientation, screen dimensions, and helper methods
/// for building responsive layouts.
///
/// Create using factory constructors:
/// ```dart
/// // From BoxConstraints (in LayoutBuilder)
/// final info = ResponsiveInfo.fromConstraints(constraints, context);
///
/// // From MediaQuery
/// final info = ResponsiveInfo.fromMediaQuery(MediaQuery.of(context));
/// ```
///
/// See also:
/// - [ResponsiveBuilder] for widget-based responsive layouts
/// - [ResponsiveContextExtension] for quick context access
class ResponsiveInfo {
  /// The screen width in logical pixels.
  final double width;

  /// The screen height in logical pixels.
  final double height;

  /// The current device type classification.
  final DeviceType deviceType;

  /// The current screen orientation.
  final ScreenOrientation orientation;

  /// The text scale factor from system settings.
  final double textScaleFactor;

  /// The device pixel ratio (DPR).
  final double devicePixelRatio;

  /// Creates a [ResponsiveInfo] with the given values.
  const ResponsiveInfo({
    required this.width,
    required this.height,
    required this.deviceType,
    required this.orientation,
    required this.textScaleFactor,
    required this.devicePixelRatio,
  });

  /// Creates a [ResponsiveInfo] from [BoxConstraints] and [BuildContext].
  ///
  /// Typically used inside a [LayoutBuilder]:
  /// ```dart
  /// LayoutBuilder(
  ///   builder: (context, constraints) {
  ///     final info = ResponsiveInfo.fromConstraints(constraints, context);
  ///     return YourWidget(info: info);
  ///   },
  /// )
  /// ```
  factory ResponsiveInfo.fromConstraints(
    BoxConstraints constraints,
    BuildContext context,
  ) {
    final mediaQuery = MediaQuery.of(context);
    final width = constraints.maxWidth;
    final height = constraints.maxHeight;

    return ResponsiveInfo(
      width: width,
      height: height,
      deviceType: ResponsiveService().getDeviceType(width),
      orientation: ResponsiveService().getOrientation(width, height),
      textScaleFactor: mediaQuery.textScaler.scale(1.0),
      devicePixelRatio: mediaQuery.devicePixelRatio,
    );
  }

  /// Creates a [ResponsiveInfo] from [MediaQueryData].
  ///
  /// Useful when you already have access to MediaQuery data:
  /// ```dart
  /// final info = ResponsiveInfo.fromMediaQuery(MediaQuery.of(context));
  /// ```
  factory ResponsiveInfo.fromMediaQuery(MediaQueryData mediaQuery) {
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;

    return ResponsiveInfo(
      width: width,
      height: height,
      deviceType: ResponsiveService().getDeviceType(width),
      orientation: ResponsiveService().getOrientation(width, height),
      textScaleFactor: mediaQuery.textScaler.scale(1.0),
      devicePixelRatio: mediaQuery.devicePixelRatio,
    );
  }

  // ========== Device Type Helpers ==========

  /// Whether the current device is classified as mobile.
  bool get isMobile => deviceType == DeviceType.mobile;

  /// Whether the current device is classified as tablet.
  bool get isTablet => deviceType == DeviceType.tablet;

  /// Whether the current device is classified as desktop.
  bool get isDesktop => deviceType == DeviceType.desktop;

  /// Whether the screen is in landscape orientation.
  bool get isLandscape => orientation == ScreenOrientation.landscape;

  /// Whether the screen is in portrait orientation.
  bool get isPortrait => orientation == ScreenOrientation.portrait;

  // ========== Screen Size Helpers ==========

  /// Whether this is a very small screen (iPhone SE, small Android).
  ///
  /// True when width < 360px.
  bool get isNarrowScreen => width < 360;

  /// Whether this is a compact width screen (most phones in portrait).
  ///
  /// True when width < 400px.
  bool get isCompactWidth => width < 400;

  /// Whether this is an extra tall screen (modern phones with high aspect ratio).
  ///
  /// True when height > 800px.
  bool get isExpandedHeight => height > 800;

  /// Whether this is an extra wide screen (foldable phones, tablets in landscape).
  ///
  /// True when width > 1000px and device is mobile.
  bool get isExtraWide => width > 1000 && isMobile;

  /// Whether this is a narrow tablet (iPad in portrait mode).
  ///
  /// True when tablet in portrait with width < 700px.
  bool get isNarrowTablet => isTablet && isPortrait && width < 700;

  // ========== Responsive Values ==========

  /// Returns a value based on the current device type.
  ///
  /// [mobile] Value for mobile devices.
  /// [tablet] Value for tablet devices.
  /// [desktop] Optional value for desktop devices. Falls back to [tablet] if not provided.
  ///
  /// Example:
  /// ```dart
  /// final padding = info.responsiveValue<double>(
  ///   mobile: 16,
  ///   tablet: 24,
  ///   desktop: 32,
  /// );
  /// ```
  T responsiveValue<T>({required T mobile, required T tablet, T? desktop}) {
    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet;
      case DeviceType.desktop:
        return desktop ?? tablet;
    }
  }

  /// Calculates a responsive font size based on screen width.
  ///
  /// [baseSize] The base font size in logical pixels.
  /// [minScale] Minimum scale factor (default: 0.85).
  /// [maxScale] Maximum scale factor (default: 1.15).
  ///
  /// Example:
  /// ```dart
  /// Text(
  ///   'Hello',
  ///   style: TextStyle(fontSize: info.responsiveFontSize(16)),
  /// )
  /// ```
  double responsiveFontSize(
    double baseSize, {
    double minScale = 0.85,
    double maxScale = 1.15,
  }) {
    final widthScale = (width / ResponsiveBreakpoints.mobile).clamp(
      minScale,
      maxScale,
    );
    return baseSize * widthScale;
  }

  /// Gets the spacing value for the given [ResponsiveSpacing].
  double spacing(ResponsiveSpacing spacing) {
    return spacing.getValue(this);
  }

  /// Gets the recommended number of grid columns for the current device.
  ///
  /// Returns 4 for mobile, 8 for tablet, 12 for desktop.
  int get gridColumns {
    return responsiveValue<int>(mobile: 4, tablet: 8, desktop: 12);
  }

  // ========== Layout Helpers ==========

  /// Gets responsive horizontal padding.
  ///
  /// Returns 16 for mobile, 24 for tablet, 32 for desktop.
  double horizontalPadding() =>
      responsiveValue(mobile: 16.0, tablet: 24.0, desktop: 32.0);

  /// Gets responsive vertical padding.
  ///
  /// Returns 16 for mobile, 24 for tablet, 32 for desktop.
  double verticalPadding() =>
      responsiveValue(mobile: 16.0, tablet: 24.0, desktop: 32.0);

  /// Gets the maximum content width for the current device.
  ///
  /// Returns full width for mobile, 840 for tablet, 1200 for desktop.
  double contentMaxWidth() =>
      responsiveValue(mobile: width, tablet: 840.0, desktop: 1200.0);

  /// Gets a responsive button width.
  ///
  /// [baseWidth] The base width (default: 222.0).
  double buttonWidth({double baseWidth = 222.0}) => responsiveValue(
    mobile: baseWidth,
    tablet: baseWidth * 1.2,
    desktop: baseWidth * 1.3,
  );

  /// Gets a responsive button height.
  ///
  /// [baseHeight] The base height (default: 50.0).
  double buttonHeight({double baseHeight = 50.0}) => responsiveValue(
    mobile: baseHeight,
    tablet: baseHeight * 1.1,
    desktop: baseHeight * 1.2,
  );

  /// Gets safe padding that respects screen edges.
  EdgeInsets get safePadding => EdgeInsets.symmetric(
    horizontal: horizontalPadding(),
    vertical: verticalPadding(),
  );

  /// Gets padding that includes system UI insets (notch, navigation bar, etc).
  ///
  /// [context] The build context to get view padding from.
  EdgeInsets safeAreaPadding(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    return EdgeInsets.only(
      left: horizontalPadding() + viewPadding.left,
      right: horizontalPadding() + viewPadding.right,
      top: verticalPadding() + viewPadding.top,
      bottom: verticalPadding() + viewPadding.bottom,
    );
  }
}
