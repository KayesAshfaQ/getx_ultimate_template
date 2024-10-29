import 'package:flutter/material.dart';

import '../const/font_family.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData provideAppTheme() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: AppColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: FontFamily.inter,
      primaryIconTheme: const IconThemeData(color: AppColors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.primary,
        surfaceTintColor: AppColors.transparent,
        elevation: 3,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
        toolbarTextStyle: TextStyle(color: AppColors.white),
        iconTheme: IconThemeData(color: AppColors.white, size: 20),
        actionsIconTheme: IconThemeData(color: AppColors.white),
      ),
    );
  }
}
