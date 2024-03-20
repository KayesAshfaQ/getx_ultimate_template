import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/base/base_controller.dart';
import 'package:sl_v4/app/modules/cart/views/cart_view.dart';
import 'package:sl_v4/app/modules/home/views/home_view.dart';
import 'package:sl_v4/app/modules/home/views/home_view.dart';
import 'package:sl_v4/app/modules/message/views/message_view.dart';
import 'package:sl_v4/app/modules/profile/views/profile_view.dart';

class NavigatorController extends BaseController {
  final selectedBottomNav = 0.obs;

  final navPages = <Widget>[
    const HomeView(),
    const MessageView(),
    const CartView(),
    const ProfileView(),
  ];

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

  Widget setBody() {
    return navPages[selectedBottomNav.value];
  }
}
