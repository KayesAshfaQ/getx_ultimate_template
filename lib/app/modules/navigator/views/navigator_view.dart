import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../core/values/resources/resources.dart';
import '../../../core/view/components/app_image_view.dart';
import '../../../core/view/components/app_scaffold.dart';
import '../../../core/values/theme/app_colors.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/navigator_controller.dart';

class NavigatorView extends GetView<NavigatorController> {
  const NavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Obx(
        () => controller.navPages[controller.selectedBottomNav],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.background,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
          currentIndex: controller.selectedBottomNav,
          onTap: (index) => controller.selectedBottomNav = index,
          items: [
            _bottomNavItem(
              icon: AppIcons.home,
              label: Strings.home.tr,
            ),
            _bottomNavItem(
              icon: AppIcons.explore,
              label: Strings.explore.tr,
            ),
            _bottomNavItem(
              icon: AppIcons.settingsOutline,
              label: Strings.settings.tr,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required String icon,
    required String label,
    Color selectedIconColor = AppColors.primary,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: AppImageView(
        icon,
        color: selectedIconColor,
        height: 24,
      ),
    );
  }
}
