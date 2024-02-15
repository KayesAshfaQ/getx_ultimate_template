import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.navigate();
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: AppColors.primaryColor,
        child: const Center(
          child: Text(
            'SPLASH VIEW',
            style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
