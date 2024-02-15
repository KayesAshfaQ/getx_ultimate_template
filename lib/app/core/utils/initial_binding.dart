import 'package:get/get.dart';

import '../connection_manager/connection_manager_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionManagerController(), fenix: true);
  }
}
