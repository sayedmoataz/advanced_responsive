# Advanced Responsive

[![pub package](https://img.shields.io/pub/v/advanced_responsive.svg)](https://pub.dev/packages/advanced_responsive)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Coverage](https://img.shields.io/badge/coverage-65%25-yellow.svg)](https://github.com/sayedmoataz/advanced_responsive)
[![Live Demo](https://img.shields.io/badge/demo-live-blue.svg)](https://advanced-responsive-demo.vercel.app/)

A comprehensive Flutter package for building responsive layouts using **Material Design 3 breakpoints**, device detection, responsive spacing, typography, and powerful context extensions.

---

## 🌐 Live Demo (Try it Yourself)

🔗 **https://advanced-responsive-demo.vercel.app/**

> 💡 **Important:**  
> This demo is designed to be tested by **resizing the screen**.
>
> - Open **Browser DevTools (F12)**
> - Toggle **Device Toolbar** (📱)
> - Resize the viewport (320 → 600 → 840 → 1200px)
>
> Watch how layouts, spacing, typography, and grid columns adapt automatically.

---

## Features

- 📱 **Material Design 3 Breakpoints** - Industry-standard responsive breakpoints
- 🔍 **Device Detection** - Detect mobile, tablet, and desktop with caching
- 📐 **Responsive Spacing** - Consistent spacing that scales with screen size
- 🔤 **Responsive Typography** - Font sizes that adapt to screen width
- 🧩 **Flexible Widgets** - `ResponsiveBuilder` and `ResponsiveLayout` for any use case
- ⚡ **Context Extension** - Quick access via `context.isMobile`, `context.safePadding`, etc.
- 🎯 **Screen Size Helpers** - Detect narrow screens, compact width, extra wide, and more

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  advanced_responsive: ^1.0.3
```

Then run:

```bash
flutter pub get
```

---

## Quick Start

```dart
import 'package:advanced_responsive/advanced_responsive.dart';
```

---

## Using ResponsiveBuilder

```dart
ResponsiveBuilder(
  builder: (context, info) {
    return Container(
      padding: EdgeInsets.all(info.spacing(ResponsiveSpacing.md)),
      child: Column(
        children: [
          Text(
            'Responsive Text',
            style: TextStyle(fontSize: info.responsiveFontSize(18)),
          ),
          if (info.isDesktop)
            Text('Desktop View')
          else if (info.isTablet)
            Text('Tablet View')
          else
            Text('Mobile View'),
        ],
      ),
    );
  },
)
```

---

## Using Context Extension

```dart
Widget build(BuildContext context) {
  return Padding(
    padding: context.safePadding,
    child: Column(
      children: [
        Text(
          'Quick Access',
          style: TextStyle(fontSize: context.responsiveFontSize(24)),
        ),
        SizedBox(height: context.spacing(ResponsiveSpacing.md)),
        if (context.isMobile)
          MobileWidget()
        else
          DesktopWidget(),
      ],
    ),
  );
}
```

---

## Using ResponsiveLayout

```dart
ResponsiveLayout(
  mobile: MobileView(),
  tablet: TabletView(),
  desktop: DesktopView(),
)
```

---

## Breakpoints (Material Design 3)

| Device  | Width Range   | Grid Columns |
| ------- | ------------- | ------------ |
| Mobile  | < 600px       | 4            |
| Tablet  | 600px – 839px | 8            |
| Desktop | ≥ 840px       | 12           |

---

## Responsive Spacing

| Spacing | Mobile | Tablet | Desktop |
| ------- | ------ | ------ | ------- |
| xs      | 4      | 6      | 8       |
| sm      | 8      | 12     | 16      |
| md      | 16     | 24     | 32      |
| lg      | 24     | 32     | 48      |
| xl      | 32     | 48     | 64      |
| xxl     | 48     | 64     | 96      |

---

## API Reference

### ResponsiveInfo

| Property/Method | Description |
|-----------------|-------------|
| `isMobile` | True if width < 600px |
| `isTablet` | True if width 600-839px |
| `isDesktop` | True if width >= 840px |
| `isLandscape` | True if width > height |
| `isPortrait` | True if height >= width |
| `isNarrowScreen` | True if width < 360px |
| `isCompactWidth` | True if width < 400px |
| `responsiveValue<T>()` | Returns value based on device type |
| `responsiveFontSize()` | Calculates scaled font size |
| `spacing()` | Gets spacing for ResponsiveSpacing enum |
| `horizontalPadding()` | Gets horizontal padding (16/24/32) |
| `verticalPadding()` | Gets vertical padding (16/24/32) |
| `safePadding` | EdgeInsets with responsive padding |
| `safeAreaPadding()` | Padding including system UI insets |
| `gridColumns` | Number of grid columns (4/8/12) |
| `contentMaxWidth()` | Maximum content width |

### Context Extension

All `ResponsiveInfo` properties are available directly on `BuildContext`:

```dart
context.isMobile
context.isTablet
context.isDesktop
context.safePadding
context.spacing(ResponsiveSpacing.md)
context.responsiveFontSize(16)
```

## Example

The `example/` folder contains the full demo app.

🌐 **Live Demo:** [https://advanced-responsive-demo.vercel.app/](https://advanced-responsive-demo.vercel.app/)

---

## License

MIT License - see [LICENSE](LICENSE) for details.
