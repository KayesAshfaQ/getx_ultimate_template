import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/components/common_appbar.dart';
import 'package:sl_v4/app/core/components/ripple_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';
import 'package:sl_v4/app/modules/home/views/widgets/best_shop_widget.dart';
import 'package:sl_v4/app/modules/home/views/widgets/category_widget.dart';
import 'package:sl_v4/app/modules/home/views/widgets/just_for_you_widget.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/utils/misc.dart';
import '../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';
import 'widgets/featuread_category.dart';
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
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          // ------------------- header -------------------
          Obx(
            () => CollapsibleHeader(
              bannerItems: controller.bannerOneItems,
              onBannerSelected: (index, reason) {
                printLog('index: $index, reason: $reason');
                controller.currentSlider.value = index;
              },
              selectedBannerIndex: controller.currentSlider.value,
            ),
          ),
          //Get.gapVerticalSliver(16),

          // ------------------- featured categories -------------------
          const FeaturedCategories(),
          Get.gapVerticalSliver(16),

          // ------------------- offers section -------------------
          const OffersSection(),
          Get.gapVerticalSliver(16),

          // ------------------- most popular items -------------------
          MostPopularWidget(types: controller.mostPopularProducts),
          Get.gapVerticalSliver(16),

          // ------------------- category section -------------------
          CategoryWidget(allCategories: controller.allCategories),
          Get.gapVerticalSliver(16),

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
