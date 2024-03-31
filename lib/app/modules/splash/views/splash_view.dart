import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
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
        color: AppColors.primary,
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
