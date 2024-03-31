import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/config/app_colors.dart';
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
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: Text('HomeView is working'),
          ),
        ],
      ),
    );
  }
}
