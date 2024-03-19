import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';
import '../../../../core/components/app_button.dart';
import '../../../../core/components/app_text_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppTextField(
                  hint: 'Enter your email',
                  label: 'Email',
                  controller: controller.emailController,
                  textFieldType: AppTextFieldType.email,
                ),
                12.verticalSpace,
                Obx(
                  () => AppTextField(
                    hint: 'Enter your password',
                    label: 'Password',
                    controller: controller.passwordController,
                    textFieldType: AppTextFieldType.password,
                    suffixClick: () => controller.isPasswordVisible.toggle(),
                    isObscure: controller.isPasswordVisible.value,
                  ),
                ),
                24.verticalSpace,
                AppButton(
                  buttonText: 'Login',
                  buttonTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                      ),
                  onTap: () async {
                    //controller.onPressLogin();
                    Get.offAllNamed(Routes.NAVIGATOR);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
