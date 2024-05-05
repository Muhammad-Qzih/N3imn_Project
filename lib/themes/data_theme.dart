import 'package:flutter/material.dart';

import 'package:n3imn_project_team/themes/colors_theme.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      // ignore: prefer_const_constructors
      //appBarTheme
      textTheme: const TextTheme(
        displayLarge:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        displaySmall:
            TextStyle(fontSize: 16, color: AppColor.TEXT_SECONDARY_LIGHT),
        titleLarge: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        titleMedium:
            TextStyle(fontSize: 16, color: AppColor.TEXT_SECONDARY_LIGHT),
        titleSmall:
            TextStyle(fontSize: 14, color: AppColor.TEXT_SECONDARY_LIGHT),
        bodyLarge:
            TextStyle(fontSize: 18, color: AppColor.TEXT_SECONDARY_LIGHT),
        bodyMedium:
            TextStyle(fontSize: 17, color: AppColor.TEXT_SECONDARY_LIGHT),
        bodySmall:
            TextStyle(fontSize: 16, color: AppColor.TEXT_SECONDARY_LIGHT),
      ),

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColor.PRIMARY,
        secondary: AppColor.SECONDARY,
        onSecondary: AppColor.SECONDARY,
        error: Colors.red,
        background: AppColor.PRIMARY,
      ),
    );
  }
}
