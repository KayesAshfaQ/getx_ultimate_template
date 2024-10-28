import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/services/internet_connection/internet_connection_checker.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Get.find<InternetConnectionCheckService>().onInit();

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
