import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

/// A card widget that displays current device information.
///
/// Shows device type, orientation, screen dimensions, grid columns,
/// and pixel ratio using the provided [ResponsiveInfo].
class DeviceInfoCard extends StatelessWidget {
  /// The responsive info to display.
  final ResponsiveInfo info;

  /// Creates a [DeviceInfoCard] with the given [info].
  const DeviceInfoCard({
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Information',
              style: TextStyle(
                fontSize: info.responsiveFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: info.spacing(ResponsiveSpacing.sm)),
            _InfoRow(
                label: 'Device Type',
                value: info.deviceType.name.toUpperCase()),
            _InfoRow(
                label: 'Orientation',
                value: info.orientation.name.toUpperCase()),
            _InfoRow(
                label: 'Screen Width',
                value: '${info.width.toStringAsFixed(0)}px'),
            _InfoRow(
                label: 'Screen Height',
                value: '${info.height.toStringAsFixed(0)}px'),
            _InfoRow(label: 'Grid Columns', value: '${info.gridColumns}'),
            _InfoRow(
                label: 'Pixel Ratio',
                value: info.devicePixelRatio.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }
}

/// A simple row widget for displaying label-value pairs.
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
