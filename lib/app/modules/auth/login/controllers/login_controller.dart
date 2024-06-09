import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/data/repository/auth_repository_impl.dart';

import '../../../../core/utils/analytics_helper.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;

  @override
  void onInit() {
    if (kDebugMode) {
      emailController.text = 'shishir@gmail.com';
      passwordController.text = 'Usb123456@';
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onPressLogin() async {

    final repo = Get.find<AuthRepository>();
    final res = await repo.login(emailController.text, passwordController.text);

    if (res != null) {
      // send event to analytics
      AnalyticsHelper.logEvent(
        'login',
        parameters: {'email': emailController.text},
      );

      Get.offAllNamed(Routes.NAVIGATOR);
    }
  }
}
