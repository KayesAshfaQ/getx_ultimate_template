import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../message/views/message_view.dart';
import '../../profile/views/profile_view.dart';

class NavigatorController extends GetxController {
  final _selectedBottomNav = 0.obs;

  int get selectedBottomNav => _selectedBottomNav.value;

  set selectedBottomNav(int value) {
    _selectedBottomNav.value = value;
  }

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
}
