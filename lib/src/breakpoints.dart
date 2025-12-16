/// Responsive breakpoints following Material Design 3 standards.
///
/// These breakpoints define the boundaries between different device categories:
/// - Mobile: < 600px
/// - Tablet: 600px - 839px
/// - Desktop: >= 840px
///
/// Usage:
/// ```dart
/// if (screenWidth < ResponsiveBreakpoints.mobile) {
///   // Mobile layout
/// }
/// ```
class ResponsiveBreakpoints {
  ResponsiveBreakpoints._();

  /// Maximum width for mobile devices (< 600px is mobile).
  static const double mobile = 600;

  /// Maximum width for tablet devices (600px - 839px is tablet).
  static const double tablet = 840;

  /// Minimum width for desktop devices (>= 840px is desktop, >= 1240px is large desktop).
  static const double desktop = 1240;

  /// Small mobile devices (iPhone SE, small Android).
  @Deprecated('Use mobile instead for standard breakpoints')
  static const double mobileSmall = 360;

  /// Medium mobile devices (iPhone 12/13/14).
  @Deprecated('Use mobile instead for standard breakpoints')
  static const double mobileMedium = 390;

  /// Large mobile devices (iPhone Plus/Max, large Android).
  @Deprecated('Use mobile instead for standard breakpoints')
  static const double mobileLarge = 430;
}
