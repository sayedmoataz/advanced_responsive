import 'package:advanced_responsive/advanced_responsive.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResponsiveBreakpoints', () {
    test('has correct Material Design 3 values', () {
      expect(ResponsiveBreakpoints.mobile, 600);
      expect(ResponsiveBreakpoints.tablet, 840);
      expect(ResponsiveBreakpoints.desktop, 1240);
    });
  });

  group('ResponsiveService', () {
    late ResponsiveService service;

    setUp(() {
      service = ResponsiveService();
      service.clearCache();
    });

    test('is singleton', () {
      final service1 = ResponsiveService();
      final service2 = ResponsiveService();
      expect(identical(service1, service2), isTrue);
    });

    group('getDeviceType', () {
      test('returns mobile for width < 600', () {
        expect(service.getDeviceType(320), DeviceType.mobile);
        expect(service.getDeviceType(599), DeviceType.mobile);
      });

      test('returns tablet for width 600-839', () {
        expect(service.getDeviceType(600), DeviceType.tablet);
        expect(service.getDeviceType(700), DeviceType.tablet);
        expect(service.getDeviceType(839), DeviceType.tablet);
      });

      test('returns desktop for width >= 840', () {
        expect(service.getDeviceType(840), DeviceType.desktop);
        expect(service.getDeviceType(1200), DeviceType.desktop);
        expect(service.getDeviceType(1920), DeviceType.desktop);
      });

      test('caches result for same width', () {
        final result1 = service.getDeviceType(500);
        final result2 = service.getDeviceType(500);
        expect(result1, result2);
        expect(result1, DeviceType.mobile);
      });
    });

    group('getOrientation', () {
      test('returns landscape when width > height', () {
        expect(service.getOrientation(1000, 600), ScreenOrientation.landscape);
      });

      test('returns portrait when height >= width', () {
        expect(service.getOrientation(600, 1000), ScreenOrientation.portrait);
        expect(service.getOrientation(600, 600), ScreenOrientation.portrait);
      });
    });

    group('helper methods', () {
      test('isMobile returns correct value', () {
        expect(service.isMobile(400), isTrue);
        expect(service.isMobile(700), isFalse);
      });

      test('isTablet returns correct value', () {
        expect(service.isTablet(700), isTrue);
        expect(service.isTablet(400), isFalse);
      });

      test('isDesktop returns correct value', () {
        expect(service.isDesktop(1000), isTrue);
        expect(service.isDesktop(400), isFalse);
      });

      test('isLandscape returns correct value', () {
        expect(service.isLandscape(1000, 600), isTrue);
        expect(service.isLandscape(600, 1000), isFalse);
      });
    });

    test('clearCache resets all cached values', () {
      service.getDeviceType(500);
      service.getOrientation(500, 800);
      service.clearCache();
      // After clearing, getting the value should still work
      expect(service.getDeviceType(500), DeviceType.mobile);
    });
  });

  group('ResponsiveSpacing', () {
    test('has all expected values', () {
      expect(ResponsiveSpacing.values.length, 6);
      expect(ResponsiveSpacing.xs.index, 0);
      expect(ResponsiveSpacing.xxl.index, 5);
    });
  });

  group('DeviceType', () {
    test('has all expected values', () {
      expect(DeviceType.values.length, 3);
      expect(DeviceType.mobile.index, 0);
      expect(DeviceType.tablet.index, 1);
      expect(DeviceType.desktop.index, 2);
    });
  });

  group('ScreenOrientation', () {
    test('has all expected values', () {
      expect(ScreenOrientation.values.length, 2);
      expect(ScreenOrientation.portrait.index, 0);
      expect(ScreenOrientation.landscape.index, 1);
    });
  });
}
