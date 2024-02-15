import 'package:get/get.dart';
import 'package:sl_v4/app/modules/cart/bindings/cart_binding.dart';
import 'package:sl_v4/app/modules/home/bindings/home_binding.dart';
import 'package:sl_v4/app/modules/message/bindings/message_binding.dart';
import 'package:sl_v4/app/modules/profile/bindings/profile_binding.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    HomeBinding().dependencies();
    MessageBinding().dependencies();
    CartBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
