import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/localization/strings_enum.dart';
import '../../../core/values/resources/resources.dart';
import '../../explore/views/explore_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';
import '../models/nav_item.dart';

class NavigatorController extends GetxController {
  final _selectedNavItem = 0.obs;

  int get selectedNavItem => _selectedNavItem.value;

  set selectedNavItem(int value) {
    _selectedNavItem.value = value;
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final navItems = <NavItem>[
    NavItem(
      page: const HomeView(),
      label: Strings.home.tr,
      icon: AppIcons.home,
    ),
    NavItem(
      page: const ExploreView(),
      label: Strings.explore.tr,
      icon: AppIcons.explore,
    ),
    NavItem(
      page: const SettingsView(),
      label: Strings.settings.tr,
      icon: AppIcons.settingsOutline,
    ),
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
