/// Device type classification based on screen width.
///
/// Used to determine which layout variant to display.
///
/// See also:
/// - [ResponsiveBreakpoints] for the width thresholds
/// - [ResponsiveInfo.deviceType] for getting the current device type
enum DeviceType {
  /// Mobile devices with width < 600px.
  mobile,

  /// Tablet devices with width 600px - 839px.
  tablet,

  /// Desktop devices with width >= 840px.
  desktop,
}

/// Screen orientation classification.
///
/// Named `ScreenOrientation` to avoid conflicts with Flutter's
/// `DeviceOrientation` from `package:flutter/services.dart`.
///
/// See also:
/// - [ResponsiveInfo.orientation] for getting the current orientation
enum ScreenOrientation {
  /// Portrait mode where height > width.
  portrait,

  /// Landscape mode where width > height.
  landscape,
}
