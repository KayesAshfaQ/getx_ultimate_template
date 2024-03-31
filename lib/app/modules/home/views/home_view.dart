import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      useSafeArea: true,
      scaffoldKey: controller.scaffoldKey,
      statusBarColor: AppColors.primary,
      statusBarBrightness: Brightness.light,
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(Strings.home.tr),
        centerTitle: true,
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: Center(
              child: Text('HomeView is working'),
            ),
          ),
        ],
      ),
    );
  }
}
