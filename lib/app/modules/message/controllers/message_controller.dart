import 'package:get/get.dart';
import 'package:sl_v4/app/core/base/base_controller.dart';

class MessageController extends BaseController {
  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
