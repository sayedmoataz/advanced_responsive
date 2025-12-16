## 1.0.0

* Initial release
* Material Design 3 responsive breakpoints (mobile: 600px, tablet: 840px, desktop: 1240px)
* Device type detection (`DeviceType.mobile`, `DeviceType.tablet`, `DeviceType.desktop`)
* Screen orientation detection (`ScreenOrientation.portrait`, `ScreenOrientation.landscape`)
* `ResponsiveService` singleton with caching for optimal performance
* `ResponsiveInfo` immutable data class with comprehensive helpers
* `ResponsiveSpacing` enum with device-aware spacing values
* `ResponsiveBuilder` widget for constraint-based responsive layouts
* `ResponsiveLayout` widget for simple device-specific layouts
* `ResponsiveContextExtension` for quick context-based access
* Screen size helpers: `isNarrowScreen`, `isCompactWidth`, `isExpandedHeight`, `isExtraWide`, `isNarrowTablet`
* Layout helpers: `horizontalPadding()`, `verticalPadding()`, `contentMaxWidth()`, `safePadding`, `safeAreaPadding()`
* Responsive font sizing with `responsiveFontSize()`
* Grid column system (4/8/12 columns)
