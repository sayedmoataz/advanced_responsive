import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveBuilder', () {
    testWidgets('provides ResponsiveInfo to builder', (tester) async {
      ResponsiveInfo? capturedInfo;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveBuilder(
              builder: (context, info) {
                capturedInfo = info;
                return const Text('Test');
              },
            ),
          ),
        ),
      );

      expect(capturedInfo, isNotNull);
      expect(capturedInfo!.width, greaterThan(0));
      expect(capturedInfo!.height, greaterThan(0));
    });

    testWidgets('rebuilds when size changes', (tester) async {
      int buildCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveBuilder(
              builder: (context, info) {
                buildCount++;
                return Text('Width: ${info.width}');
              },
            ),
          ),
        ),
      );

      expect(buildCount, 1);
    });
  });

  group('ResponsiveLayout', () {
    testWidgets('shows mobile widget on small screens', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: Text('Mobile'),
              tablet: Text('Tablet'),
              desktop: Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsNothing);

      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    testWidgets('shows tablet widget on medium screens', (tester) async {
      tester.view.physicalSize = const Size(700, 1024);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: Text('Mobile'),
              tablet: Text('Tablet'),
              desktop: Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Tablet'), findsOneWidget);
      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Desktop'), findsNothing);

      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    testWidgets('shows desktop widget on large screens', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: Text('Mobile'),
              tablet: Text('Tablet'),
              desktop: Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Desktop'), findsOneWidget);
      expect(find.text('Mobile'), findsNothing);
      expect(find.text('Tablet'), findsNothing);

      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    testWidgets('falls back to mobile when tablet is null', (tester) async {
      tester.view.physicalSize = const Size(700, 1024);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResponsiveLayout(
              mobile: Text('Mobile'),
              // tablet is null
              desktop: Text('Desktop'),
            ),
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);

      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });
  });

  group('ResponsiveContextExtension', () {
    testWidgets('provides device type helpers', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              expect(context.responsive, isNotNull);
              expect(context.deviceType, isA<DeviceType>());
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('provides spacing method', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final spacing = context.spacing(ResponsiveSpacing.md);
              expect(spacing, isA<double>());
              expect(spacing, greaterThan(0));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    testWidgets('provides safePadding', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final padding = context.safePadding;
              expect(padding, isA<EdgeInsets>());
              return const SizedBox();
            },
          ),
        ),
      );
    });
  });
}
