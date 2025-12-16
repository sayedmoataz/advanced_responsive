import 'responsive_info.dart';

/// Predefined spacing values that scale based on device type.
///
/// Provides consistent spacing across different screen sizes following
/// a harmonious scale that increases for larger devices.
///
/// Usage:
/// ```dart
/// ResponsiveBuilder(
///   builder: (context, info) {
///     return Padding(
///       padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
///       child: Text('Content'),
///     );
///   },
/// )
/// ```
///
/// | Spacing | Mobile | Tablet | Desktop |
/// |---------|--------|--------|---------|
/// | xs      | 4      | 6      | 8       |
/// | sm      | 8      | 12     | 16      |
/// | md      | 16     | 24     | 32      |
/// | lg      | 24     | 32     | 48      |
/// | xl      | 32     | 48     | 64      |
/// | xxl     | 48     | 64     | 96      |
enum ResponsiveSpacing {
  /// Extra small spacing (4/6/8).
  xs,

  /// Small spacing (8/12/16).
  sm,

  /// Medium spacing (16/24/32).
  md,

  /// Large spacing (24/32/48).
  lg,

  /// Extra large spacing (32/48/64).
  xl,

  /// Double extra large spacing (48/64/96).
  xxl;

  /// Gets the spacing value based on the current [ResponsiveInfo].
  double getValue(ResponsiveInfo info) {
    return info.responsiveValue<double>(
      mobile: _mobileValue,
      tablet: _tabletValue,
      desktop: _desktopValue,
    );
  }

  double get _mobileValue {
    switch (this) {
      case ResponsiveSpacing.xs:
        return 4;
      case ResponsiveSpacing.sm:
        return 8;
      case ResponsiveSpacing.md:
        return 16;
      case ResponsiveSpacing.lg:
        return 24;
      case ResponsiveSpacing.xl:
        return 32;
      case ResponsiveSpacing.xxl:
        return 48;
    }
  }

  double get _tabletValue {
    switch (this) {
      case ResponsiveSpacing.xs:
        return 6;
      case ResponsiveSpacing.sm:
        return 12;
      case ResponsiveSpacing.md:
        return 24;
      case ResponsiveSpacing.lg:
        return 32;
      case ResponsiveSpacing.xl:
        return 48;
      case ResponsiveSpacing.xxl:
        return 64;
    }
  }

  double get _desktopValue {
    switch (this) {
      case ResponsiveSpacing.xs:
        return 8;
      case ResponsiveSpacing.sm:
        return 16;
      case ResponsiveSpacing.md:
        return 32;
      case ResponsiveSpacing.lg:
        return 48;
      case ResponsiveSpacing.xl:
        return 64;
      case ResponsiveSpacing.xxl:
        return 96;
    }
  }
}
