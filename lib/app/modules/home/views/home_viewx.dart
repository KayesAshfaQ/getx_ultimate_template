import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: HeaderDelegate(
              bannerItems: controller.bannerOneItems,
            ),
          ),
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

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<HomePageBanner> bannerItems;

  const HeaderDelegate({
    required this.bannerItems,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
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
            child: AnimatedContainer(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesHomeHeaderBg.path),
                  fit: BoxFit.cover,
                ),
              ),
              duration: const Duration(milliseconds: 100),
              // padding: EdgeInsets.lerp(
              //   EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              //   EdgeInsets.only(bottom: 16),
              //   progress,
              // ),
              // alignment: Alignment.lerp(
              //   Alignment.bottomLeft,
              //   Alignment.bottomCenter,
              //   progress,
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  16.verticalSpace,
                  Row(
                    children: [
                      16.horizontalSpace,
                      AppImageView(
                        Assets.logoShoploverLogo.path,
                        height: 32.w,
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
                  8.verticalSpace,
                  const CommonAppBar(
                    showBackButton: false,
                    showCartButton: false,
                    backgroundColor: Colors.transparent,
                    showElevation: false,
                  ),
                  Obx(
                    () => Container(
                      color: AppColors.white,
                      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                      child: bannerItems.isEmpty
                          ? const SizedBox()
                          : CarouselSlider.builder(
                              itemCount: bannerItems.length,
                              options: CarouselOptions(
                                  aspectRatio: 2.77,
                                  // height: 164,
                                  //height: 135.h,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5),
                                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                                  autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                                  enlargeCenterPage: true,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    //controller.currentSlider.value = index;
                                  }),
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                                  child: Image.network(
                                    bannerItems[index].imagePathApp ?? '',
                                    height: 164.h,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  stemp() {
    return GestureDetector(
      onTap: () {
        //Get.toNamed(Routes.searchResultPage);
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 0),
          // width: Get.width - 32.w,
          // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          height: 40.h,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              // border: Border.all(color: Colors.red, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.08),
                  spreadRadius: 0.01,
                  blurRadius: 0.01,
                ),
              ],
            ),
            child: TextField(
              onTap: () {},
              enabled: false,
              decoration: InputDecoration(
                isDense: true,
                // important line
                contentPadding: const EdgeInsets.fromLTRB(0, 11, 0, 0),
                // control your hints text size
                border: InputBorder.none,
                fillColor: const Color.fromRGBO(241, 241, 241, 1),
                filled: true,
                hintText: "home_screen_search".tr,
                hintStyle: const TextStyle(fontFamily: 'iregular', color: Color.fromRGBO(99, 99, 99, 1), fontSize: 14),
                // suffixIconColor: Colors.grey,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                // CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   child: SvgPicture.asset(
                //     'assets/icons/search.svg',
                //     height: 14.h,
                //     width: 14.h,
                //   ),
                // ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(
                    //color: Color.fromRGBO(241, 241, 241, 1),
                    color: Colors.red, width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
