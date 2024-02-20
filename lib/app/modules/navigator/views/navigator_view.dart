import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/gen/assets.gen.dart';

import '../../../core/base/base_view.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/navigator_controller.dart';

class NavigatorView extends BaseView<NavigatorController> {
  const NavigatorView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return controller.setBody();
  }

  @override
  Widget? bottomNavigationBar() {
    return ConvexAppBar(
      color: AppColors.textColorSwatch,
      activeColor: AppColors.primaryColor,
      backgroundColor: AppColors.white,
      curve: Curves.easeInOutQuad,
      onTap: (index) => controller.selectedBottomNav.value = index,
      style: TabStyle.react,
      items: [
        bottomTab(icon: Assets.iconsHome.path, title: Strings.home.tr),
        bottomTab(icon: Assets.iconsChat.path, title: Strings.messages.tr),
        bottomTab(icon: Assets.iconsCart.path, title: Strings.cart.tr),
        bottomTab(icon: Assets.iconsUser.path, title: Strings.profile.tr),
      ],
    );
  }

  /// Creates bottom navigation tab item
  TabItem bottomTab({required String title, required String icon}) {
    return TabItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.textColorSwatch,
          BlendMode.srcIn,
        ),
      ),
      activeIcon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.primaryColor,
          BlendMode.srcIn,
        ),
      ),
      title: title,
    );
  }

  // @override
  // Widget? bottomNavigationBar() {
  //   return MoltenBottomNavigationBar(
  //     selectedIndex: controller.selectedBottomNav.value,
  //     barColor: AppColors.primaryColor,
  //     domeCircleColor: AppColors.primaryColor.shade300,
  //     onTabChange: (clickedIndex) {
  //       controller.selectedBottomNav.value = clickedIndex;
  //     },
  //     tabs: [
  //       MoltenTab(
  //         icon: Assets.iconsHome.svg(
  //           colorFilter: const ColorFilter.mode(
  //             AppColors.white,
  //             BlendMode.srcIn,
  //           ),
  //           fit: BoxFit.scaleDown,
  //         ),
  //       ),
  //       MoltenTab(
  //         icon: Assets.iconsChat.svg(
  //           colorFilter: const ColorFilter.mode(
  //             AppColors.white,
  //             BlendMode.srcIn,
  //           ),
  //           fit: BoxFit.scaleDown,
  //         ),
  //       ),
  //       MoltenTab(
  //         icon: Assets.iconsCart.svg(
  //           colorFilter: const ColorFilter.mode(
  //             AppColors.white,
  //             BlendMode.srcIn,
  //           ),
  //           fit: BoxFit.scaleDown,
  //         ),
  //       ),
  //       MoltenTab(
  //         icon: Assets.iconsUser.svg(
  //           colorFilter: const ColorFilter.mode(
  //             AppColors.white,
  //             BlendMode.srcIn,
  //           ),
  //           fit: BoxFit.scaleDown,
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
