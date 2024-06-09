import 'package:get/get.dart';

import '../controllers/navigator_controller.dart';
import '../../home/bindings/home_binding.dart';
import '../../explore/bindings/explore_binding.dart';
import '../../settings/bindings/settings_binding.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(
      () => NavigatorController(),
    );
    HomeBinding().dependencies();
    ExploreBinding().dependencies();
    SettingsBinding().dependencies();
  }
}
