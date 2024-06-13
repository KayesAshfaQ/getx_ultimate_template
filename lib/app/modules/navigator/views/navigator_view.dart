import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/base/base_view.dart';

import '../../../core/view/components/app_image_view.dart';
import '../../../core/values/theme/app_colors.dart';
import '../controllers/navigator_controller.dart';

class NavigatorView extends BaseView<NavigatorController> {
  const NavigatorView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(
      () => selectedPage(),
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        currentIndex: controller.selectedNavItem,
        onTap: (index) => controller.selectedNavItem = index,
        items: _bottomNavItems(
          unselectedIconColor: AppColors.grey.shade600,
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return AppScaffold(
  //     useSafeArea: true,
  //     scaffoldKey: controller.scaffoldKey,
  //     statusBarColor: AppColors.primary,
  //     statusBarBrightness: Brightness.light,
  //     backgroundColor: AppColors.background,
  //     body: Obx(
  //       () => selectedPage(),
  //     ),
  //     bottomNavigationBar: Obx(
  //       () => BottomNavigationBar(
  //         type: BottomNavigationBarType.fixed,
  //         backgroundColor: AppColors.white,
  //         selectedItemColor: AppColors.primary,
  //         unselectedItemColor: Colors.grey.shade600,
  //         selectedLabelStyle: const TextStyle(
  //           fontWeight: FontWeight.w500,
  //         ),
  //         currentIndex: controller.selectedNavItem,
  //         onTap: (index) => controller.selectedNavItem = index,
  //         items: _bottomNavItems(
  //           unselectedIconColor: AppColors.grey.shade600,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Returns the selected page based on the selectedNavItem
  Widget selectedPage() => controller.navItems[controller.selectedNavItem].page;

  List<BottomNavigationBarItem> _bottomNavItems({
    Color selectedIconColor = AppColors.primary,
    Color unselectedIconColor = AppColors.grey,
  }) {
    List<BottomNavigationBarItem> items = [];

    for (var i = 0; i < controller.navItems.length; i++) {
      items.add(
        _bottomNavItem(
          controller.navItems[i].icon,
          controller.navItems[i].label,
          controller.selectedNavItem == i ? selectedIconColor : unselectedIconColor,
        ),
      );
    }

    return items;
  }

  BottomNavigationBarItem _bottomNavItem(
    String icon,
    String label,
    Color iconColor,
  ) =>
      BottomNavigationBarItem(
        label: label,
        icon: AppImageView(
          icon,
          color: iconColor,
          height: 24,
        ),
      );
}
