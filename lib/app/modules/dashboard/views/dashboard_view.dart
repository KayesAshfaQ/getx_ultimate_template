import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

import '../../../core/base/base_view.dart';
import '../../../core/config/app_colors.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends BaseView<DashboardController> {
  const DashboardView({super.key});

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
      domeCircleColor: AppColors.primaryColor.shade200,
      onTabChange: (clickedIndex) {
        controller.selectedBottomNav.value = clickedIndex;
      },
      tabs: [
        MoltenTab(
          icon: const Icon(Icons.home),
        ),
        MoltenTab(
          icon: const Icon(Icons.message),
        ),
        MoltenTab(
          icon: const Icon(Icons.shopping_cart),
        ),
        MoltenTab(
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
