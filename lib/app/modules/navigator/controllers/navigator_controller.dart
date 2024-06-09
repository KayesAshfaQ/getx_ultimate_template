import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';

class NavigatorController extends GetxController {
  final _selectedBottomNav = 0.obs;

  int get selectedBottomNav => _selectedBottomNav.value;

  set selectedBottomNav(int value) {
    _selectedBottomNav.value = value;
  }

  final navPages = <Widget>[
    const HomeView(),
    const ExploreView(),
    const SettingsView(),
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
