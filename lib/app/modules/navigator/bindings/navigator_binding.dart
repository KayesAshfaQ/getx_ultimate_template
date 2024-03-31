import 'package:get/get.dart';
import '../../cart/bindings/cart_binding.dart';
import '../../home/bindings/home_binding.dart';
import '../../message/bindings/message_binding.dart';
import '../../profile/bindings/profile_binding.dart';
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
