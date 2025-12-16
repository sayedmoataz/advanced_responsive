import 'package:flutter/widgets.dart';

import '../responsive_info.dart';

/// A builder widget that provides [ResponsiveInfo] to its child.
///
/// Uses [LayoutBuilder] internally to respond to size changes and
/// provides comprehensive responsive information through [ResponsiveInfo].
///
/// Example:
/// ```dart
/// ResponsiveBuilder(
///   builder: (context, info) {
///     return Container(
///       padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
///       child: Column(
///         children: [
///           Text(
///             'Responsive Text',
///             style: TextStyle(fontSize: info.responsiveFontSize(18)),
///           ),
///           if (info.isDesktop)
///             Text('Desktop View')
///           else if (info.isTablet)
///             Text('Tablet View')
///           else
///             Text('Mobile View'),
///         ],
///       ),
///     );
///   },
/// )
/// ```
///
/// See also:
/// - [ResponsiveLayout] for simpler device-based layouts
/// - [ResponsiveInfo] for available responsive data
class ResponsiveBuilder extends StatelessWidget {
  /// The builder function that receives [ResponsiveInfo].
  final Widget Function(BuildContext context, ResponsiveInfo info) builder;

  /// Creates a [ResponsiveBuilder] with the given builder function.
  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final info = ResponsiveInfo.fromConstraints(constraints, context);
        return builder(context, info);
      },
    );
  }
}
