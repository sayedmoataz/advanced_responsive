import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Responsive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ResponsiveDemoPage(),
    );
  }
}

class ResponsiveDemoPage extends StatelessWidget {
  const ResponsiveDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Responsive Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ResponsiveBuilder(
        builder: (context, info) {
          return SingleChildScrollView(
            padding: info.safePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Device Info Card
                DeviceInfoCard(info: info),
                SizedBox(height: info.spacing(ResponsiveSpacing.lg)),

                // Responsive Layout Example
                Text(
                  'Responsive Layout',
                  style: TextStyle(
                    fontSize: info.responsiveFontSize(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.md)),
                ResponsiveLayout(
                  mobile: MobileLayoutDemo(info: info),
                  tablet: TabletLayoutDemo(info: info),
                  desktop: DesktopLayoutDemo(info: info),
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.xl)),

                // Grid Example
                Text(
                  'Responsive Grid',
                  style: TextStyle(
                    fontSize: info.responsiveFontSize(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: info.spacing(ResponsiveSpacing.md)),
                ResponsiveGridDemo(info: info),
              ],
            ),
          );
        },
      ),
    );
  }
}
