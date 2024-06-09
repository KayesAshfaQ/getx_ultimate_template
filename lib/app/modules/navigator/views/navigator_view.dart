import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          type: BottomNavigationBarType.shifting,
          currentIndex: controller.selectedBottomNav,
          onTap: (index) => controller.selectedBottomNav = index,
          items: [
            _bottomNavItem(
              icon: AppIcons.home,
              label: Strings.home.tr,
              backgroundColor: AppColors.primary,
            ),
            _bottomNavItem(
              icon: AppIcons.explore,
              label: Strings.explore.tr,
              backgroundColor: AppColors.primary,
            ),
            _bottomNavItem(
              icon: AppIcons.settingsOutline,
              label: Strings.settings.tr,
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavItem({
    required String icon,
    required String label,
    Color backgroundColor = AppColors.primary,
    Color iconColor = AppColors.white,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: backgroundColor,
      label: label,
      icon: AppImageView(
        icon,
        color: iconColor,
        height: 24,
      ),
    );
  }
}
