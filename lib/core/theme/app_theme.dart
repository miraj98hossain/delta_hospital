import 'package:delta_hospital/core/theme/color_scheme.dart';
import 'package:delta_hospital/core/theme/primary_colors.dart';
import 'package:delta_hospital/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: lightTextTheme,
    primaryColor: ColorSchemes.colorSchemeLight.surface,
    scaffoldBackgroundColor: ColorSchemes.colorSchemeLight.surface,
    brightness: Brightness.light,
    colorScheme: ColorSchemes.colorSchemeLight,
    switchTheme: const SwitchThemeData(
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorSchemes.colorSchemeLight.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        overlayColor: Colors.black,
      ),
    ),
  );
  // static final ThemeData darkTheme = ThemeData(
  //   useMaterial3: true,
  //   textTheme: darkTextTheme,
  //   primaryColor: ColorSchemes.colorSchemeDark.surface,
  //   scaffoldBackgroundColor: ColorSchemes.colorSchemeDark.surface,
  //   brightness: Brightness.dark,
  //   colorScheme: ColorSchemes.colorSchemeDark,
  //   switchTheme: const SwitchThemeData(
  //     trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: ColorSchemes.colorSchemeDark.surface,
  //       overlayColor: Colors.black,
  //     ),
  //   ),
  // );
}

PrimaryColors get appTheme => PrimaryColors();
TextTheme get lightTextTheme => TextThemes.lightTextTheme();
TextTheme get darkTextTheme => TextThemes.darkTextTheme();
