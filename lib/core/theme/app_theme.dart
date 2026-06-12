// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Colors extracted from Figma
  static const Color primary = Color(0xFF055DC9); // Primary button3B82F6
  static const Color primary200 = Color(0xFF9BC7FD); // Light primary
  static const Color secondary = Color(0xFF9E9E9E); // Example secondary
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  static const Color whiteColor = Colors.white; // convenience
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTitle = Color(0xFF333333);
  static const Color textBody = Color(0xFF999999);
  static const Color borderColor = Color(0xFFE5E7EB);
  static const Color successTextColor = Color(0xFF166534);
  static const Color hintColor = Color(0xFF9E9E9E);
  static const Color labelColor = Color(0xFF929292);
  static const Color backgroundBlurColor = Color(0xFF101321);
  static const Color headerTextColor = Color(0xFF111827);
  static const Color messageTextColor = Color(0xFF4B5563);
  static const Color filterColorBg = Color(0xFFF3F4F6);

  // Dashboard-specific colors
  static const Color dashboardTextPrimary = Color(0xFF283547);
  static const Color dashboardTextSecondary = Color(0xFF192339);
  static const Color dashboardBorder = Color(0x0D0D0D0D);
  static const Color dashboardShadow = Color(
    0x0D0D0D0D,
  ); // Colors.black.withOpacity(0.05)

  static const Color drawerTitle = Color(0xFF9CA3AF);

  // Status colors
  static const Color statusSuccess = Color(0xFF16A34A);
  static const Color statusSuccessLight = Color(0xFF14e8a1);
  static const Color statusSuccessBg = Color(0xFFc5fad7);
  static const Color statusWarning = Color(0xFFf57834);
  static const Color statusWarningLight = Color(0xFFf8c52d);
  static const Color statusWarningBg = Color(0xFFffe2bb);
  static const Color statusError = Color(0xFFdf2929);
  static const Color statusErrorLight = Color(0xFFf37373);
  static const Color statusErrorBg = Color(0xFFfee2e2);
  static const Color statusInfo = Color(0xFF6ca2f8);
  static const Color statusInfoLight = Color(0xFF15d2f8);
  static const Color statusInfoBg = Color(0xFFc2dcfd);
  static const Color statusPending = Color(0xFFF8C52D);
  static const Color statusPendingBg = Color(0xFFfef9c3);

  // Gradient colors
  static const Color gradientBlueStart = Color(0xFF3b82f6);
  static const Color gradientBlueEnd = Color(0xFF4f46e5);
  static const Color gradientGreenStart = Color(0xFF1cac51);
  static const Color gradientGreenEnd = Color(0xFF3ddd78);
  // Profile header gradient (purple-blue gradient from Figma)
  static const Color profileGradientStart = Color(0xFF667eea);
  static const Color profileGradientEnd = Color(0xFF764ba2);

  // Additional UI colors (for dashboard and other features)
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color red500 = Color(0xFFEF4444);
  static const Color purple500 = Color(0xFF9333ea);
  static const Color primaryBlue = Color(0xFF0052CC);
  static const Color primaryBlueLight = Color(0xFF2684FF);
  static const Color darkGray = Color(0xFF2C2E3E);

  // Icon colors
  static const Color iconDefault = Color(
    0xFF6B7280,
  ); // Gray icon color for dashboard header

  // Shadow colors
  static const Color shadowColor = Color(
    0x1A000000,
  ); // Colors.black.withOpacity(0.1)
  static const Color shadowColorLight = Color(0x1F000000); // Colors.black12

  // Spacing (in dp) extracted from Figma
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;

  // Typography extracted from Figma
  static const String fontInter = 'Inter';
  static const String fontCairo = 'Cairo';

  // Base text styles without colors (colors applied via ThemeData or extensions)
  static const TextStyle displayLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 64,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle displayMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 44,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle headlineLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );
  static const TextStyle headlineMedium = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle titleLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 21,
    height: 48 / 21,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle titleMedium = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 19,
    height: 1.0,
    color: textSecondary, // Default light theme color
  );

  static const TextStyle drawerLink = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: gradientBlueStart, // Theme-independent color
  );

  static const TextStyle labelLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );
  static const TextStyle labelMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle labelSmall = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    height: 1.0,
    color: labelColor, // Default light theme color
  );

  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    height: 1.0,
    color: textPrimary, // Default light theme color
  );

  // Dashboard text styles (with default light theme colors)
  static const TextStyle dashboardTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: dashboardTextPrimary, // Default light theme color
  );

  static const TextStyle dashboardSubtitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: textSecondary, // Default light theme color
  );

  static const TextStyle dashboardSectionTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: dashboardTextSecondary, // Default light theme color
  );

  static const TextStyle dashboardLabel = TextStyle(
    fontSize: 12,
    color: messageTextColor, // Default light theme color
  );

  static const TextStyle dashboardValue = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    color: dashboardTextSecondary, // Default light theme color
  );

  static const TextStyle dashboardSmallValue = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    color: dashboardTextPrimary, // Default light theme color
  );

  static const TextStyle dashboardCardTitle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: textPrimary, // Default light theme color
  );

  static const TextStyle dashboardCardLabel = TextStyle(
    fontSize: 14,
    color: textSecondary, // Default light theme color
  );

  // Button text style
  static const TextStyle buttonText = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
    color: surface, // White text on colored buttons (always white)
  );

  // Badge text style (small white text)
  static const TextStyle badgeText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    color: surface, // White text (always white)
  );

  // User name text style
  static const TextStyle headerText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: headerTextColor, // Default light theme color
  );

  // Avatar initial text style
  static const TextStyle avatarInitial = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: primary, // Primary color (theme-independent)
  );

  // Language toggle text style
  static const TextStyle languageToggleText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: textPrimary, // Default light theme color
  );

  // Dark theme colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkBorderColor = Color(0xFF2C2C2C);
  static const Color darkDashboardTextPrimary = Color(0xFFE0E0E0);
  static const Color darkDashboardTextSecondary = Color(0xFFB0B0B0);
  static const Color darkHeaderTextColor = Color(0xFFFFFFFF);
  static const Color darkMessageTextColor = Color(0xFFB0B0B0);
  static const Color darkFilterColorBg = Color(0xFF2C2C2C);
  static const Color darkDrawerTitle = Color(0xFFB0B0B0);

  // Light theme definition (kept for backward compatibility)
  static final ThemeData lightTheme = lightThemeEnhanced;

  // Dark theme definition
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    fontFamily: fontCairo,
    fontFamilyFallback: [fontInter],
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: secondary,
      onSurface: darkTextPrimary,
      surface: darkSurface,
      error: error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
      onSurfaceVariant: darkTextSecondary,
    ),
    textTheme: TextTheme(
      displayLarge: displayLarge.copyWith(color: darkTextPrimary),
      displayMedium: displayMedium.copyWith(color: darkTextPrimary),
      headlineLarge: headlineLarge.copyWith(color: darkTextPrimary),
      headlineMedium: headlineMedium.copyWith(color: darkTextPrimary),
      titleLarge: titleLarge.copyWith(color: darkTextPrimary),
      titleMedium: titleMedium.copyWith(color: darkTextSecondary),
      labelLarge: labelLarge.copyWith(color: darkTextPrimary),
      labelMedium: labelMedium.copyWith(color: darkTextSecondary),
      labelSmall: labelSmall.copyWith(color: darkTextSecondary),
      bodyLarge: bodyLarge.copyWith(color: darkTextPrimary),
      bodyMedium: labelMedium.copyWith(color: darkTextSecondary),
      bodySmall: labelSmall.copyWith(color: darkTextSecondary),
    ),
    iconTheme: const IconThemeData(color: darkTextSecondary),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: darkTextPrimary,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacingSm),
      ),
    ),
    dividerTheme: const DividerThemeData(color: darkBorderColor, thickness: 1),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: darkBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: darkBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: primary),
      ),
      labelStyle: const TextStyle(color: darkTextSecondary),
      hintStyle: const TextStyle(color: darkTextSecondary),
    ),
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingSm),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary200,
      selectionHandleColor: primary,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: darkSurface,
      textStyle: const TextStyle(color: darkTextPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacingSm),
      ),
    ),
  );

  // Light theme enhancements
  static final ThemeData lightThemeEnhanced = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    fontFamily: fontCairo,
    fontFamilyFallback: [fontInter],
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: secondary,
      onSurface: textPrimary,
      surface: surface,
      error: error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onError: Colors.white,
      onSurfaceVariant: textPrimary,
    ),
    textTheme: TextTheme(
      displayLarge: displayLarge.copyWith(color: textPrimary),
      displayMedium: displayMedium.copyWith(color: textPrimary),
      headlineLarge: headlineLarge.copyWith(color: textPrimary),
      headlineMedium: headlineMedium.copyWith(color: textPrimary),
      titleLarge: titleLarge.copyWith(color: textPrimary),
      titleMedium: titleMedium.copyWith(color: textPrimary),
      labelLarge: labelLarge.copyWith(color: textPrimary),
      labelMedium: labelMedium.copyWith(color: textPrimary),
      labelSmall: labelSmall.copyWith(color: textPrimary),
      bodyLarge: bodyLarge.copyWith(color: textPrimary),
      bodyMedium: labelMedium.copyWith(color: textPrimary),
      bodySmall: labelSmall.copyWith(color: textPrimary),
    ),
    iconTheme: const IconThemeData(color: iconDefault),
    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacingSm),
      ),
    ),
    dividerTheme: const DividerThemeData(color: borderColor, thickness: 1),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(spacingSm),
        borderSide: const BorderSide(color: primary),
      ),
      labelStyle: const TextStyle(color: textPrimary),
      hintStyle: const TextStyle(color: textPrimary),
    ),
    navigationBarTheme: const NavigationBarThemeData(
      labelTextStyle: WidgetStatePropertyAll(TextStyle(color: textPrimary)),
      iconTheme: WidgetStatePropertyAll(IconThemeData(color: textPrimary)),
    ),
    buttonTheme: const ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacingSm),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary200,
      selectionHandleColor: primary,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: surface,
      textStyle: const TextStyle(color: textPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacingSm),
      ),
    ),
  );

  // Add more text styles as needed based on Figma
}
