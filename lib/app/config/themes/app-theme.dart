import 'package:cerdas_swamedikasi/app/config/constants/app-constants.dart';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppTheme {
  // App Colors
  static const Color primaryColor =
      Color(0xFF4CAF50); // Green for health/medical
  static const Color secondaryColor = Color(0xFF2196F3); // Blue
  static const Color accentColor = Color(0xFFFFC107); // Amber

  static const Color backgroundColor = Colors.white;
  static const Color cardColor = Color(0xFFF5F5F5);

  static const Color textColorPrimary = Color(0xFF212121);
  static const Color textColorSecondary = Color(0xFF757575);
  static const Color textColorLight = Color(0xFFBDBDBD);

  static const Color errorColor = Color(0xFFE53935);
  static const Color successColor = Color(0xFF43A047);
  static const Color warningColor = Color(0xFFFFB300);
  static const Color infoColor = Color(0xFF039BE5);

  // Shadow
  static const List<BoxShadow> shadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: cardColor,
      background: backgroundColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: cardColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textColorPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColorPrimary,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textColorPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: textColorPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: textColorPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: textColorPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: textColorPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: textColorSecondary,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
      ),
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.PADDING_L,
          vertical: AppConstants.PADDING_M,
        ),
        minimumSize: const Size(double.infinity, AppConstants.BUTTON_HEIGHT_M),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(color: primaryColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.PADDING_L,
          vertical: AppConstants.PADDING_M,
        ),
        minimumSize: const Size(double.infinity, AppConstants.BUTTON_HEIGHT_M),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.PADDING_M,
          vertical: AppConstants.PADDING_S,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.PADDING_M,
        vertical: AppConstants.PADDING_M,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        borderSide: const BorderSide(color: textColorLight, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        borderSide: const BorderSide(color: textColorLight, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        borderSide: const BorderSide(color: primaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
        borderSide: const BorderSide(color: errorColor, width: 1.5),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return Colors.transparent;
      }),
      side: const BorderSide(color: textColorSecondary, width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_XS),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }
        return textColorSecondary;
      }),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: cardColor,
      disabledColor: cardColor.withOpacity(0.6),
      selectedColor: primaryColor.withOpacity(0.2),
      secondarySelectedColor: secondaryColor.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.PADDING_M,
        vertical: AppConstants.PADDING_XS,
      ),
      labelStyle: const TextStyle(color: textColorPrimary),
      secondaryLabelStyle: const TextStyle(color: secondaryColor),
      brightness: Brightness.light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_M),
      ),
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.BORDER_RADIUS_L),
      ),
      margin: const EdgeInsets.all(AppConstants.PADDING_S),
    ),
    dividerTheme: const DividerThemeData(
      color: textColorLight,
      thickness: 0.5,
      space: AppConstants.PADDING_M,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppConstants.PADDING_M,
        vertical: AppConstants.PADDING_S,
      ),
      dense: true,
      horizontalTitleGap: AppConstants.PADDING_M,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: textColorSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: primaryColor,
      unselectedLabelColor: textColorSecondary,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
      ),
    ),
    fontFamily: AppConstants.FONT_FAMILY,
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: Color(0xFF303030),
      background: Color(0xFF212121),
      error: errorColor,
    ),
    // Add more dark theme settings as needed
    fontFamily: AppConstants.FONT_FAMILY,
  );
}
