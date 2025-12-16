import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

/// A responsive grid that adapts its column count based on device type.
///
/// Shows a colorful grid of items that changes from 2 columns on mobile,
/// to 3 on tablet, and 4 on desktop.
class ResponsiveGridDemo extends StatelessWidget {
  /// The responsive info for sizing and device detection.
  final ResponsiveInfo info;

  /// The number of items to display in the grid.
  final int itemCount;

  /// Whether to show the column count subtitle.
  final bool showColumnCount;

  /// Creates a [ResponsiveGridDemo] with the given [info].
  const ResponsiveGridDemo({
    super.key,
    required this.info,
    this.itemCount = 8,
    this.showColumnCount = true,
  });

  /// Gets the number of columns for the current device type.
  int get crossAxisCount => info.responsiveValue<int>(
        mobile: 2,
        tablet: 3,
        desktop: 4,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showColumnCount)
          Padding(
            padding:
                EdgeInsets.only(bottom: info.spacing(ResponsiveSpacing.sm)),
            child: Text(
              '$crossAxisCount items per row',
              style: TextStyle(
                fontSize: info.responsiveFontSize(14),
                color: Colors.grey.shade600,
              ),
            ),
          ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: info.spacing(ResponsiveSpacing.sm),
            crossAxisSpacing: info.spacing(ResponsiveSpacing.sm),
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return _GridItem(
              index: index,
              info: info,
            );
          },
        ),
      ],
    );
  }
}

/// A single item in the responsive grid.
class _GridItem extends StatelessWidget {
  final int index;
  final ResponsiveInfo info;

  const _GridItem({
    required this.index,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.primaries[index % Colors.primaries.length].shade200,
      child: Center(
        child: Text(
          'Item ${index + 1}',
          style: TextStyle(
            fontSize: info.responsiveFontSize(16),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
