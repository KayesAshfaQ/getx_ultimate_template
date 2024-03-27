import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';
import 'package:sl_v4/app/modules/home/views/widgets/best_shop_widget.dart';
import 'package:sl_v4/app/modules/home/views/widgets/category_widget.dart';
import 'package:sl_v4/app/modules/home/views/widgets/just_for_you_widget.dart';

import '../../../core/components/app_scaffold.dart';
import '../controllers/home_controller.dart';
import 'widgets/featured_category.dart';
import 'widgets/collapsible_header.dart';
import 'widgets/most_popular_widget.dart';
import 'widgets/offer_widget.dart';

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
        slivers: [
          // ------------------- header -------------------
          CollapsibleHeader(controller: controller),

          // ------------------- featured categories -------------------
          const FeaturedCategories(),

          // ------------------- offers section -------------------
          const OffersSection(),

          // ------------------- most popular items -------------------
          MostPopularWidget(types: controller.mostPopularProducts),

          // ------------------- category section -------------------
          CategoryWidget(allCategories: controller.allCategories),

          // ------------------- best shop section -------------------
          BestShopWidget(bestShops: controller.bestShops),
          Get.gapVerticalSliver(16),

          // ------------------- Just For You -------------------
          JustForYouWidget(products: controller.justForYouProducts),
          Get.gapVerticalSliver(16),
        ],
      ),
    );
  }
}
