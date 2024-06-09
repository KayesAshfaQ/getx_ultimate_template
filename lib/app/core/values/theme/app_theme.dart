import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../const/font_family.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData provideAppTheme() {
    return ThemeData(
      useMaterial3: false,
      primarySwatch: AppColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: FontFamily.inter,
      primaryIconTheme: const IconThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.primary,
        elevation: 3,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        toolbarTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black, size: 26),
        actionsIconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 60,
      ),
    );
  }
}
