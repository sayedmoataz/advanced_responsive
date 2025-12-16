import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

/// A demo widget showing mobile layout style.
///
/// Displays a single-column stacked layout with an icon and text,
/// styled with a blue background.
class MobileLayoutDemo extends StatelessWidget {
  /// The responsive info for sizing.
  final ResponsiveInfo info;

  /// Creates a [MobileLayoutDemo] with the given [info].
  const MobileLayoutDemo({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Icon(Icons.phone_android, size: 48),
          SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
          Text(
            'Mobile Layout',
            style: TextStyle(fontSize: info.responsiveFontSize(18)),
          ),
          const Text('Single column, stacked content'),
        ],
      ),
    );
  }
}

/// A demo widget showing tablet layout style.
///
/// Displays a two-column layout with an icon on the left
/// and content description on the right, styled with a green background.
class TabletLayoutDemo extends StatelessWidget {
  /// The responsive info for sizing.
  final ResponsiveInfo info;

  /// Creates a [TabletLayoutDemo] with the given [info].
  const TabletLayoutDemo({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Icon(Icons.tablet_android, size: 48),
                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
                Text(
                  'Tablet Layout',
                  style: TextStyle(fontSize: info.responsiveFontSize(18)),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Text(
              'Two column layout with more space for content',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

/// A demo widget showing desktop layout style.
///
/// Displays a three-column layout with navigation, main content,
/// and sidebar areas, styled with a purple background.
class DesktopLayoutDemo extends StatelessWidget {
  /// The responsive info for sizing.
  final ResponsiveInfo info;

  /// Creates a [DesktopLayoutDemo] with the given [info].
  const DesktopLayoutDemo({
    super.key,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
      decoration: BoxDecoration(
        color: Colors.purple.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Icon(Icons.desktop_windows, size: 48),
                SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
                Text(
                  'Desktop Layout',
                  style: TextStyle(fontSize: info.responsiveFontSize(18)),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Text(
              'Navigation or sidebar content',
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            child: Text(
              'Main content area with more details',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
