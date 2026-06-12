import 'package:flutter/material.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';

/// Extension methods for theme-aware color access
extension ThemeExtensions on BuildContext {
  /// Returns true if the current theme is dark
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  /// Theme-aware background color
  Color get themeBackground {
    return isDarkMode ? AppTheme.darkBackground : AppTheme.background;
  }

  /// Theme-aware surface color
  Color get themeSurface {
    return isDarkMode ? AppTheme.darkSurface : AppTheme.surface;
  }

  /// Theme-aware text primary color
  Color get themeTextPrimary {
    return isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary;
  }

  /// Theme-aware text secondary color
  Color get themeTextSecondary {
    return isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary;
  }

  /// Theme-aware border color
  Color get themeBorderColor {
    return isDarkMode ? AppTheme.darkBorderColor : AppTheme.borderColor;
  }

  /// Theme-aware header text color
  Color get themeHeaderTextColor {
    return isDarkMode ? AppTheme.darkHeaderTextColor : AppTheme.textPrimary;
  }

  /// Theme-aware message text color
  Color get themeMessageTextColor {
    return isDarkMode ? AppTheme.darkMessageTextColor : AppTheme.textPrimary;
  }

  /// Theme-aware filter background color
  Color get themeFilterColorBg {
    return isDarkMode ? AppTheme.darkFilterColorBg : AppTheme.filterColorBg;
  }

  /// Theme-aware dashboard text primary color
  Color get themeDashboardTextPrimary {
    return isDarkMode ? AppTheme.darkDashboardTextPrimary : AppTheme.textPrimary;
  }

  /// Theme-aware dashboard text secondary color
  Color get themeDashboardTextSecondary {
    return isDarkMode ? AppTheme.darkDashboardTextSecondary : AppTheme.textPrimary;
  }

  /// Theme-aware drawer title/link text color
  Color get themeDrawerTitle {
    return isDarkMode ? AppTheme.darkDrawerTitle : AppTheme.textPrimary;
  }
}

/// Extension methods for theme-aware text styles
extension AppThemeTextStyles on BuildContext {
  /// Theme-aware displayLarge text style
  TextStyle get themeDisplayLarge {
    return AppTheme.displayLarge.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware displayMedium text style
  TextStyle get themeDisplayMedium {
    return AppTheme.displayMedium.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware headlineLarge text style
  TextStyle get themeHeadlineLarge {
    return AppTheme.headlineLarge.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware headlineMedium text style
  TextStyle get themeHeadlineMedium {
    return AppTheme.headlineMedium.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware titleLarge text style
  TextStyle get themeTitleLarge {
    return AppTheme.titleLarge.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware titleMedium text style
  TextStyle get themeTitleMedium {
    return AppTheme.titleMedium.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware labelLarge text style
  TextStyle get themeLabelLarge {
    return AppTheme.labelLarge.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware labelMedium text style
  TextStyle get themeLabelMedium {
    return AppTheme.labelMedium.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware labelSmall text style
  TextStyle get themeLabelSmall {
    return AppTheme.labelSmall.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware bodyLarge text style
  TextStyle get themeBodyLarge {
    return AppTheme.bodyLarge.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardTitle text style
  TextStyle get themeDashboardTitle {
    return AppTheme.dashboardTitle.copyWith(
      color: isDarkMode ? AppTheme.darkDashboardTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardSubtitle text style
  TextStyle get themeDashboardSubtitle {
    return AppTheme.dashboardSubtitle.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardSectionTitle text style
  TextStyle get themeDashboardSectionTitle {
    return AppTheme.dashboardSectionTitle.copyWith(
      color: isDarkMode ? AppTheme.darkDashboardTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardLabel text style
  TextStyle get themeDashboardLabel {
    return AppTheme.dashboardLabel.copyWith(
      color: isDarkMode ? AppTheme.darkMessageTextColor : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardValue text style
  TextStyle get themeDashboardValue {
    return AppTheme.dashboardValue.copyWith(
      color: isDarkMode ? AppTheme.darkDashboardTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardSmallValue text style
  TextStyle get themeDashboardSmallValue {
    return AppTheme.dashboardSmallValue.copyWith(
      color: isDarkMode ? AppTheme.darkDashboardTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardCardTitle text style
  TextStyle get themeDashboardCardTitle {
    return AppTheme.dashboardCardTitle.copyWith(
      color: isDarkMode ? AppTheme.darkTextPrimary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware dashboardCardLabel text style
  TextStyle get themeDashboardCardLabel {
    return AppTheme.dashboardCardLabel.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.textPrimary,
    );
  }

  /// Theme-aware headerText text style
  TextStyle get themeHeaderText {
    return AppTheme.headerText.copyWith(
      color: isDarkMode ? AppTheme.darkHeaderTextColor : AppTheme.textPrimary,
    );
  }

  /// Theme-aware drawer link text style (footer links)
  TextStyle get themeDrawerLink {
    return AppTheme.drawerLink.copyWith(
      color: isDarkMode ? AppTheme.darkTextSecondary : AppTheme.gradientBlueStart,
    );
  }

  /// Helper to check if dark mode
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

/// Extension methods for AppTheme static colors to be theme-aware
extension AppThemeExtensions on BuildContext {
  /// Get theme-aware version of AppTheme colors
  /// Usage: context.appTheme.textPrimary instead of AppTheme.textPrimary
  AppThemeColors get appTheme => AppThemeColors(this);
}

class AppThemeColors {
  final BuildContext context;
  final bool isDark;

  AppThemeColors(this.context) : isDark = Theme.of(context).brightness == Brightness.dark;

  Color get background => isDark ? AppTheme.darkBackground : AppTheme.background;
  Color get surface => isDark ? AppTheme.darkSurface : AppTheme.surface;
  Color get textPrimary => isDark ? AppTheme.darkTextPrimary : AppTheme.textPrimary;
  Color get textSecondary => isDark ? AppTheme.darkTextSecondary : AppTheme.textPrimary;
  Color get borderColor => isDark ? AppTheme.darkBorderColor : AppTheme.borderColor;
  Color get headerTextColor => isDark ? AppTheme.darkHeaderTextColor : AppTheme.textPrimary;
  Color get messageTextColor => isDark ? AppTheme.darkMessageTextColor : AppTheme.textPrimary;
  Color get filterColorBg => isDark ? AppTheme.darkFilterColorBg : AppTheme.filterColorBg;
  Color get dashboardTextPrimary => isDark ? AppTheme.darkDashboardTextPrimary : AppTheme.textPrimary;
  Color get dashboardTextSecondary => isDark ? AppTheme.darkDashboardTextSecondary : AppTheme.textPrimary;
  Color get drawerTitle => isDark ? AppTheme.darkDrawerTitle : AppTheme.textPrimary;

  // Status colors remain the same in both themes
  Color get statusSuccess => AppTheme.statusSuccess;
  Color get statusWarning => AppTheme.statusWarning;
  Color get statusError => AppTheme.statusError;
  Color get statusInfo => AppTheme.statusInfo;
  Color get primary => AppTheme.primary;
}

