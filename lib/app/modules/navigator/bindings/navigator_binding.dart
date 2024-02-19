import 'package:get/get.dart';
import 'package:sl_v4/app/modules/cart/bindings/cart_binding.dart';
import 'package:sl_v4/app/modules/home/bindings/home_binding.dart';
import 'package:sl_v4/app/modules/message/bindings/message_binding.dart';
import 'package:sl_v4/app/modules/profile/bindings/profile_binding.dart';

import '../controllers/navigator_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(
      () => NavigatorController(),
    );
    HomeBinding().dependencies();
    MessageBinding().dependencies();
    CartBinding().dependencies();
    ProfileBinding().dependencies();
  }
}
