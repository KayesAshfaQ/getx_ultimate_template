import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    
    //navigate();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.NAVIGATOR);
    });
  }
}
