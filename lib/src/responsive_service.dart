import 'breakpoints.dart';
import 'enums.dart';

/// A singleton service for responsive calculations with caching.
///
/// Provides efficient device type and orientation detection with
/// automatic caching to prevent redundant calculations during rebuilds.
///
/// Usage:
/// ```dart
/// final service = ResponsiveService();
/// final deviceType = service.getDeviceType(screenWidth);
/// final orientation = service.getOrientation(width, height);
/// ```
///
/// See also:
/// - [ResponsiveInfo] for a complete responsive data class
/// - [ResponsiveBuilder] for a widget-based approach
class ResponsiveService {
  static final ResponsiveService _instance = ResponsiveService._internal();

  /// Returns the singleton instance of [ResponsiveService].
  factory ResponsiveService() => _instance;

  ResponsiveService._internal();

  // Cache for device type
  DeviceType? _cachedDeviceType;
  double? _cachedWidth;

  // Cache for orientation
  ScreenOrientation? _cachedOrientation;
  double? _cachedOrientationWidth;
  double? _cachedHeight;

  /// Gets the device type based on screen width.
  ///
  /// Returns cached value if width hasn't changed.
  ///
  /// [width] The screen width in logical pixels.
  ///
  /// Returns [DeviceType.mobile], [DeviceType.tablet], or [DeviceType.desktop].
  DeviceType getDeviceType(double width) {
    if (_cachedWidth == width && _cachedDeviceType != null) {
      return _cachedDeviceType!;
    }

    if (width < ResponsiveBreakpoints.mobile) {
      _cachedDeviceType = DeviceType.mobile;
    } else if (width < ResponsiveBreakpoints.tablet) {
      _cachedDeviceType = DeviceType.tablet;
    } else {
      _cachedDeviceType = DeviceType.desktop;
    }

    _cachedWidth = width;
    return _cachedDeviceType!;
  }

  /// Gets the screen orientation based on dimensions.
  ///
  /// Returns cached value if dimensions haven't changed.
  ///
  /// [width] The screen width in logical pixels.
  /// [height] The screen height in logical pixels.
  ///
  /// Returns [ScreenOrientation.landscape] if width > height,
  /// otherwise [ScreenOrientation.portrait].
  ScreenOrientation getOrientation(double width, double height) {
    if (_cachedOrientationWidth == width &&
        _cachedHeight == height &&
        _cachedOrientation != null) {
      return _cachedOrientation!;
    }

    _cachedOrientation = width > height
        ? ScreenOrientation.landscape
        : ScreenOrientation.portrait;
    _cachedOrientationWidth = width;
    _cachedHeight = height;

    return _cachedOrientation!;
  }

  /// Clears all cached values.
  ///
  /// Useful for testing or when dimensions need to be recalculated.
  void clearCache() {
    _cachedDeviceType = null;
    _cachedWidth = null;
    _cachedOrientation = null;
    _cachedOrientationWidth = null;
    _cachedHeight = null;
  }

  /// Whether the current width indicates a mobile device.
  bool isMobile(double width) => getDeviceType(width) == DeviceType.mobile;

  /// Whether the current width indicates a tablet device.
  bool isTablet(double width) => getDeviceType(width) == DeviceType.tablet;

  /// Whether the current width indicates a desktop device.
  bool isDesktop(double width) => getDeviceType(width) == DeviceType.desktop;

  /// Whether the current dimensions indicate landscape orientation.
  bool isLandscape(double width, double height) =>
      getOrientation(width, height) == ScreenOrientation.landscape;
}
