/// A comprehensive Flutter package for building responsive layouts.
///
/// Provides utilities for:
/// - Device type detection (mobile, tablet, desktop)
/// - Screen orientation detection
/// - Responsive spacing system
/// - Responsive font sizing
/// - Context extensions for quick access
///
/// ## Quick Start
///
/// ```dart
/// import 'package:advanced_responsive/advanced_responsive.dart';
///
/// // Using ResponsiveBuilder
/// ResponsiveBuilder(
///   builder: (context, info) {
///     return Text(
///       'Hello',
///       style: TextStyle(fontSize: info.responsiveFontSize(16)),
///     );
///   },
/// )
///
/// // Using context extension
/// Widget build(BuildContext context) {
///   if (context.isMobile) {
///     return MobileLayout();
///   }
///   return DesktopLayout();
/// }
/// ```
///
/// See also:
/// - [ResponsiveBuilder] for constraint-based responsive layouts
/// - [ResponsiveLayout] for simple device-based layouts
/// - [ResponsiveInfo] for responsive data and helpers
/// - [ResponsiveContextExtension] for context-based access
library;

export 'src/breakpoints.dart';
export 'src/enums.dart';
export 'src/extensions.dart';
export 'src/responsive_info.dart';
export 'src/responsive_service.dart';
export 'src/responsive_spacing.dart';
export 'src/widgets/responsive_builder.dart';
export 'src/widgets/responsive_layout.dart';
