import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/values/resources/resources.dart';
import '../../../core/view/components/app_scaffold.dart';
import '../../../core/values/theme/app_colors.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/navigator_controller.dart';

class NavigatorView extends GetView<NavigatorController> {
  const NavigatorView({super.key});

  /// Creates bottom navigation tab item
  TabItem bottomTab({required String title, required String icon}) {
    return TabItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.text,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      ),
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Obx(
        () => controller.navPages[controller.selectedBottomNav],
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget? bottomNavigationBar() {
    return ConvexAppBar(
      color: AppColors.text,
      activeColor: AppColors.primary,
      backgroundColor: AppColors.white,
      curve: Curves.easeInOutQuad,
      onTap: (index) => controller.selectedBottomNav = index,
      style: TabStyle.react,
      items: [
        bottomTab(icon: AppIcons.home, title: Strings.home.tr),
        bottomTab(icon: AppIcons.chat, title: Strings.messages.tr),
        bottomTab(icon: AppIcons.cart, title: Strings.cart.tr),
        bottomTab(icon: AppIcons.user, title: Strings.profile.tr),
      ],
    );
  }
}
