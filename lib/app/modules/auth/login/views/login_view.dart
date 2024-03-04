import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/common_widgets/app_button.dart';
import 'package:sl_v4/app/core/common_widgets/app_text_field.dart';

import '../../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

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
                  onTap: () {
                    Get.offAllNamed(Routes.NAVIGATOR);

                    EasyLoading.show(status: 'loading...');

                    // EasyLoading.instance.backgroundColor = Colors.green;
                    // EasyLoading.showInfo(
                    //   'Login Successful',
                    // );
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
