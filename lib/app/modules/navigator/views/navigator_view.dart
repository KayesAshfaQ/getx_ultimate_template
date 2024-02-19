import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:sl_v4/app/gen/assets.gen.dart';

import '../../../core/base/base_view.dart';
import '../../../core/config/app_colors.dart';
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
    return MoltenBottomNavigationBar(
      selectedIndex: controller.selectedBottomNav.value,
      barColor: AppColors.primaryColor,
      domeCircleColor: AppColors.primaryColor.shade300,
      onTabChange: (clickedIndex) {
        controller.selectedBottomNav.value = clickedIndex;
      },
      tabs: [
        MoltenTab(
          icon: Assets.iconsHome.svg(
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        MoltenTab(
          icon: Assets.iconsChat.svg(
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        MoltenTab(
          icon: Assets.iconsCart.svg(
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
        MoltenTab(
          icon: Assets.iconsUser.svg(
            colorFilter: const ColorFilter.mode(
              AppColors.white,
              BlendMode.srcIn,
            ),
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}
