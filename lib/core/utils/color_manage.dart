import 'dart:ui';

class ColorManager {
  // Background Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color body = Color(0xFF757575);
  static const Color black = Color(0xFF000000);
  static const Color chat = Color(0xFFF5F5F5);

  // Grey Color Variations
  static const Color grey100 = Color(0xFF000000);
  static const Color grey90 = Color(0xFF1A1A1A);
  static const Color grey80 = Color(0xFF333333);
  static const Color grey70 = Color(0xFF4D4D4D);
  static const Color grey60 = Color(0xFF666666);
  static const Color grey50 = Color(0xFF808080);
  static const Color grey40 = Color(0xFF999999);
  static const Color grey30 = Color(0xFFB3B3B3);
  static const Color grey20 = Color(0xFFCCCCCC);

  // Primary Color Variations
  static const Color primary100 = Color(0xFF247CFF);
  static const Color primary80 = Color(0xFF4D93FF);
  static const Color primary60 = Color(0xFF80B3FF);
  static const Color primary40 = Color(0xFFB3D4FF);
  static const Color primary20 = Color(0xFFE6F2FF);
  static const Color primarySurface = Color(0xFFF5F9FF);

  // Secondary Colors
  static const Color surfaceBlue = Color(0xFFE6F2FF);
  static const Color surfaceGreen = Color(0xFFE6F7ED);
  static const Color surfaceRed = Color(0xFFFFE6E6);
  static const Color surfaceText = Color(0xFFF5F5F5);

  static const Color fillBlue = Color(0xFF247CFF);
  static const Color fillGreen = Color(0xFF22C55E);
  static const Color fillRed = Color(0xFFEF4444);
  static const Color form = Color(0xFFF8F9FA);

  // Warning Colors
  static const Color warning100 = Color(0xFFFFC107);
  static const Color warning80 = Color(0xFFFFCD38);
  static const Color warning60 = Color(0xFFFFD969);
  static const Color warning40 = Color(0xFFFFE499);
  static const Color warning20 = Color(0xFFFFF0CC);
  static const Color warningSurface = Color(0xFFFFFBF0);

  // Text Color Variations
  static const Color text10 = Color(0xFFE6E6E6);
  static const Color text20 = Color(0xFFCCCCCC);
  static const Color text30 = Color(0xFFB3B3B3);
  static const Color text40 = Color(0xFF999999);
  static const Color text50 = Color(0xFF808080);
  static const Color text60 = Color(0xFF666666);
  static const Color text80 = Color(0xFF333333);
  static const Color text90 = Color(0xFF1A1A1A);
  static const Color text100 = Color(0xFF000000);

  static const Color primaryColor = primary100;
  static const Color textColor = text50;
  static const Color blackColor = black;
  static const Color logoColor = chat;

  static const Map<int, Color> primaryColors = {
    100: primary100,
    80: primary80,
    60: primary60,
    40: primary40,
    20: primary20,
  };

  static const Map<int, Color> greyColors = {
    100: grey100,
    90: grey90,
    80: grey80,
    70: grey70,
    60: grey60,
    50: grey50,
    40: grey40,
    30: grey30,
    20: grey20,
  };

  static const Map<int, Color> warningColors = {
    100: warning100,
    80: warning80,
    60: warning60,
    40: warning40,
    20: warning20,
  };

  static const Map<int, Color> textColors = {
    10: text10,
    20: text20,
    30: text30,
    40: text40,
    50: text50,
    60: text60,
    80: text80,
    90: text90,
    100: text100,
  };

  // Helper methods for getting colors by intensity
  static Color getPrimaryColor(int intensity) {
    return primaryColors[intensity] ?? primary100;
  }

  static Color getGreyColor(int intensity) {
    return greyColors[intensity] ?? grey50;
  }

  static Color getWarningColor(int intensity) {
    return warningColors[intensity] ?? warning100;
  }

  static Color getTextColor(int intensity) {
    return textColors[intensity] ?? text50;
  }

  // Semantic color aliases for common use cases
  static const Color success = fillGreen;
  static const Color error = fillRed;
  static const Color info = fillBlue;
  static const Color warning = warning100;

  static const Color background = white;
  static const Color surface = chat;
  static const Color onPrimary = white;
  static const Color onSurface = text100;
  static const Color onBackground = text100;
}
