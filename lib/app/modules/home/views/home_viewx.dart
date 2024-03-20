import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/components/common_appbar.dart';
import 'package:sl_v4/app/core/components/ripple_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

import '../../../core/components/app_scaffold.dart';
import '../../../core/utils/misc.dart';
import '../../../data/models/response/banner_data_response.dart';
import '../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: controller.scaffoldKey,
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
              minHeight: 60.0, // You can adjust this value as needed
              maxHeight: 350.h,
            ),
          ),
          // SliverToBoxAdapter(
          //     child: controller.isHeaderCollapsed.value
          //         ? const CommonAppBar(
          //             showBackButton: false,
          //             showCartButton: false,
          //             backgroundColor: Colors.transparent,
          //             showElevation: false,
          //           )
          //         : HeaderWidget()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354.h,
      child: Stack(
        children: [
          AppImageView(
            Assets.imagesHomeHeaderBg.path,
            height: 253.h,
            width: Get.width,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              16.verticalSpace,
              Row(
                children: [
                  16.horizontalSpace,
                  AppImageView(
                    Assets.logoShoploverLogo.path,
                    height: 28.2.h,
                    width: 128.61.w,
                  ),
                  Spacer(),
                  RippleView(
                    rippleColor: AppColors.white,
                    isCircular: true,
                    onTap: () {
                      //Get.toNamed(Routes.searchResultPage);
                    },
                    child: AppImageView(
                      Assets.iconsSearch.path,
                      height: 24.w,
                      color: AppColors.white,
                    ),
                  ),
                  8.horizontalSpace,
                  RippleView(
                    rippleColor: AppColors.white,
                    isCircular: true,
                    onTap: () {
                      //Get.toNamed(Routes.cartPage);
                    },
                    child: AppImageView(
                      Assets.iconsCart.path,
                      height: 24.w,
                      color: AppColors.white,
                    ),
                  ),
                  16.horizontalSpace,
                ],
              ),
              //8.verticalSpace,
              const CommonAppBar(
                showBackButton: false,
                showCartButton: false,
                backgroundColor: Colors.transparent,
                showElevation: false,
              ),
              4.verticalSpace,
              Container(
                height: 168.h,
                width: Get.width,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.08),
                      spreadRadius: 0.01,
                      blurRadius: 0.01,
                    ),
                  ],
                ),
                child: /*bannerItems.isEmpty
                      ? const SizedBox()
                      :*/
                    CarouselSlider.builder(
                  //itemCount: bannerItems.length,
                  itemCount: 3,
                  options: CarouselOptions(
                      //aspectRatio: 2.77,
                      //height: 150.h,
                      //height: 135.h,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                      autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        //controller.currentSlider.value = index;
                      }),
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: AppImageView(
                        'https://fakeimg.pl/600x400/4449db/909090',
                        //bannerItems[index].imagePathApp ?? '',
                        height: 168.h,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            height: 40.h,
            margin: EdgeInsets.fromLTRB(40.w, 260.h, 40.w, 0),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  // create a hard shadow effect
                  color: AppColors.black.withOpacity(0.08),
                  spreadRadius: 0.01,
                  blurRadius: 0.01,
                ),
              ],
            ),
            child: Row(
              children: [
                8.horizontalSpace,
                Text(
                  // userAddress.$,
                  "Set your Default location ",
                  style: TextStyle(
                    color: AppColors.gray.shade700,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: SizedBox(
                    height: 17.h,
                    child: VerticalDivider(
                      width: 1.w,
                      thickness: 1.h,
                      color: AppColors.gray,
                      indent: 2.h,
                    ),
                  ),
                ),
                8.horizontalSpace,
                AppImageView(
                  Assets.iconsCart.path,
                  height: 16.h,
                  width: 16.w,
                  color: AppColors.gray.shade700,
                ),
                8.horizontalSpace
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    //return  SizedBox.expand(child: child);

    final progress = shrinkOffset / maxExtent;

    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: progress,
            child: const CommonAppBar(
              showBackButton: false,
              showCartButton: false,
              backgroundColor: Colors.transparent,
              showElevation: false,
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1 - progress,
            child: const HeaderWidget(),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight;
  }
}
