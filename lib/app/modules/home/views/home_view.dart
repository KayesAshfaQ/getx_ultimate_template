import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:sl_v4/app/core/base/base_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

import '../../../core/localization/localization_service.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('HomeView'),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //----------------Language Button----------------//
          InkWell(
            onTap: () => LocalizationService.updateLanguage(
              LocalizationService.getCurrentLocal().languageCode == 'ar' ? 'en' : 'ar',
            ),
            child: Ink(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.language,
                    size: 30,
                  ),
                  10.horizontalSpace,
                  Text(
                    LocalizationService.getCurrentLocal().languageCode == 'en' ? 'English' : 'العربية',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),

          10.verticalSpace,

          Text(
            '${Strings.goodMorning.tr} ,${Strings.hello.tr}',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
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
          icon: const Icon(Icons.search),
        ),
        MoltenTab(
          icon: const Icon(Icons.home),
        ),
        MoltenTab(
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
