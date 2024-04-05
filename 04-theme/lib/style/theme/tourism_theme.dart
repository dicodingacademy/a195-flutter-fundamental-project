import 'package:flutter/material.dart';
import 'package:tourism_app/style/colors/tourism_colors.dart';
import 'package:tourism_app/style/typography/tourism_text_styles.dart';

// todo-04: create a TourismTheme
class TourismTheme {
  // todo-07: add theme for light and dark theme
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: TourismColors.blue.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: TourismColors.blue.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  // todo-05: add static value for textTheme and others
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: TourismTextStyles.displayLarge,
      displayMedium: TourismTextStyles.displayMedium,
      displaySmall: TourismTextStyles.displaySmall,
      headlineLarge: TourismTextStyles.headlineLarge,
      headlineMedium: TourismTextStyles.headlineMedium,
      headlineSmall: TourismTextStyles.headlineSmall,
      titleLarge: TourismTextStyles.titleLarge,
      titleMedium: TourismTextStyles.titleMedium,
      titleSmall: TourismTextStyles.titleSmall,
      bodyLarge: TourismTextStyles.bodyLargeBold,
      bodyMedium: TourismTextStyles.bodyLargeMedium,
      bodySmall: TourismTextStyles.bodyLargeRegular,
      labelLarge: TourismTextStyles.labelLarge,
      labelMedium: TourismTextStyles.labelMedium,
      labelSmall: TourismTextStyles.labelSmall,
    );
  }

  // todo-06: add static value for app bar theme and others
  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }
}
