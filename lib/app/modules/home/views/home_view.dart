import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sl_v4/app/core/components/app_scaffold.dart';
import 'package:sl_v4/app/core/components/collapsible.dart';

import '../../../core/common_widgets/sl_search_bar.dart';
import '../../../core/components/app_image_view.dart';
import '../../../core/config/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../controllers/home_controller.dart';
import 'widgets/best_shop_widget.dart';
import 'widgets/categories_item_widget.dart';
import 'widgets/category_widget.dart';
import 'widgets/item_widget.dart';
import 'widgets/just_for_you_widget.dart';
import 'widgets/most_popular_widget.dart';

class HomeView2 extends GetView<HomeController> {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        // endDrawer: GestureDetector(
        //   onHorizontalDragEnd: (details) {
        //     if (details.primaryVelocity! > 0) {
        //       _scaffoldKey.currentState?.openEndDrawer();
        //     }
        //   },
        //   child: CustomSearchFilter(
        //     warranties: controller.warrenties(),
        //     rettings: controller.rattings(),
        //   ),
        // ),
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: controller.onRefresh,
                    child: CustomScrollView(
                      // child: SingleChildScrollView(
                      controller: controller.scrollController,
                      physics: const ClampingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.imagesHomeHeaderBg.path),
                                // Replace 'assets/background_image.jpg' with your image path
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h, bottom: 10.h, left: 16.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      //Get.to(ReviewView());
                                    },
                                    child: AppImageView(
                                      Assets.logoShoploverLogo.path,
                                      height: 20.h,
                                      //width: 165.w,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                              ],
                            ),
                          ),
                        ),
                        SliverPersistentHeader(
                          pinned: true,
                          delegate: SearchBoxDelegate(),
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              /// Sliding Banners
                              /// shimmer
                              if (controller.isLoading.value == true) ...[
                                Stack(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  children: [
                                    Positioned(
                                      bottom: 80.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: Container(
                                        height: 215.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            bottom: const Radius.circular(24).r,
                                          ),
                                        ),
                                        child: AppImageView(
                                          Assets.imagesHomeHeaderBg.path,
                                          height: 215.h,
                                          fit: BoxFit.fill,
                                          width: MediaQuery.of(context).size.width,
                                          // width: 390.w,
                                          // borderRadius: BorderRadius.vertical(
                                          //   bottom: const Radius.circular(24).r,
                                          // ),
                                          // alignment: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  10.w,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: AppColors.gray.withOpacity(0.08),
                                                    spreadRadius: 2,
                                                    blurRadius: 2,
                                                    offset: const Offset(
                                                      0,
                                                      6,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                                              child: Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                color: AppColors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(
                                                    10.w,
                                                  ),
                                                ),
                                                child: Container(
                                                  width: Get.width,
                                                  padding: EdgeInsets.all(8.w),
                                                  child: Stack(
                                                    alignment: Alignment.bottomCenter,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 150.h,
                                                            width: Get.width,
                                                            child: Shimmer.fromColors(
                                                                baseColor: Colors.grey[300]!,
                                                                highlightColor: Colors.grey[100]!,
                                                                child: Container(
                                                                  height: 150.h,
                                                                  width: Get.width,
                                                                  color: Colors.green[200],
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                          ],
                                        )),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        // margin: EdgeInsets.fromLTRB(16.w, 130.h, 16.w, 0),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 38.w,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: AppColors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.black.withOpacity(0.08),
                                              spreadRadius: 2.w,
                                              blurRadius: 2.w,
                                              offset: const Offset(0, 2),
                                            ),
                                          ],
                                        ),

                                        // child: Row(
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     ShimmerHelper().buildBasicShimmer(
                                        //       height: 20.h,
                                        //       width: Get.width / 1.45,
                                        //     ),
                                        //   ],
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 180.h,
                                  padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 25.h),
                                  child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.only(
                                      right: 5.w,
                                      //left: 5.w,
                                    ),
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      //mainAxisExtent: 70.v,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 5.w,
                                      //childAspectRatio: 1,
                                      crossAxisSpacing: 5.h,
                                    ),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          //color: Colors.red,
                                          height: 90.h,
                                          width: 55.w,
                                          child: Column(
                                            children: [
                                              // SizedBox(
                                              //     //height: 141.h,
                                              //     //width: 124.w,
                                              //     //child: ShimmerHelper().buildBasicShimmer(
                                              //   height: 56.h,
                                              //   width: 56.w,
                                              // )),
                                              SizedBox(height: 2.h),
                                              SizedBox(
                                                width: 45.h,
                                                child: Shimmer.fromColors(
                                                  baseColor: AppColors.shimmerBase,
                                                  highlightColor: AppColors.shimmerHighlight,
                                                  child: const Text(
                                                    '...',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 11.0,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16.h),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(
                                      right: 1.w,
                                      left: 0,
                                    ),
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 53.h,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 12.w,
                                      crossAxisSpacing: 12.w,
                                    ),
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8.h,
                                          ),
                                        ),
                                        child: SizedBox(
                                            //height: 141.h,
                                            //width: 124.w,
                                            // child: ShimmerHelper().buildBasicShimmer(
                                            //   height: 52.h,
                                            //   width: 173.w,
                                            // ),
                                            ),
                                      );
                                    },
                                  ),
                                ),
                              ],

                              ///shimmer shesh

                              if (controller.isLoading.value == false) ...[
                                Container(
                                  color: AppColors.white,
                                  child: Column(
                                    children: [
                                      controller.bannerOneItems.isNotEmpty
                                          //true
                                          ? _bannerStackWidget(context)
                                          : const SizedBox(),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      controller.popularCategories.isNotEmpty ? _itemWidgetList(context) : const SizedBox(),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      _fourItemBannerWidgetList(context),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                              ],

                              // ------------------- most popular items -------------------
                              MostPopularWidget(
                                types: controller.mostPopularProducts,
                              ),
                              8.verticalSpace,

                              // ------------------- Category -------------------
                              CategoryWidget(allCategories: controller.allCategories),
                              8.verticalSpace,

                              // ------------------- Best Shops -------------------
                              BestShopWidget(bestShops: controller.bestShops),
                              8.verticalSpace,

                              buildBannerRowOne(),
                              buildBannerRowTwo(),
                              8.verticalSpace,

                              // ------------------- just for you items -------------------
                              JustForYouWidget(
                                products: controller.justForYouProducts,
                                isLoading: controller.showProductLoading.value,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _bannerStackWidget(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned(
          bottom: 80.h,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: 215.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: const Radius.circular(24).r,
              ),
            ),
            child: AppImageView(
              Assets.imagesHomeHeaderBg.path,
              height: 215.h,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              // width: 390.w,
              // borderRadius: BorderRadius.vertical(
              //   bottom: const Radius.circular(24).r,
              // ),
              // alignment: Alignment.center,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              // buildAppBar(context),

              /* Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 10.h, left: 0),
                    child: CustomImageView(
                      imagePath: Assets.svgShoploverLogoForHome,
                      height: 20.h,
                      width: 165.w,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),
              SlSearchBar(),
              SizedBox(height: 12.h),*/

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.w,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.08),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(
                        0,
                        6,
                      ),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.w,
                    ),
                  ),
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(8.w),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            buildHomeCarousel(context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 38.w,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.08),
                      spreadRadius: 2.w,
                      blurRadius: 2.w,
                      offset: const Offset(
                        0,
                        2,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8.w,
                        //top: 3.h,
                      ),
                      child: SizedBox(
                        width: ScreenUtil.defaultSize.width.w - 145.w,
                        //width: double.maxFinite,
                        child: Text(
                            // userAddress.$,
                            "Set your Default location ",
                            style: TextStyle(
                              color: AppColors.gray.shade700,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    Row(
                      children: [
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
                        Container(
                          alignment: Alignment.centerRight,
                          height: 16.h,
                          width: 16.w,
                          margin: EdgeInsets.only(top: 3.h, bottom: 2.h, left: 10.w),
                          child: SvgPicture.asset(
                            Assets.iconsCart.path,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ],
    );
  }

  buildHomeCarousel(context) {
    if (controller.isCarouselInitial.value && controller.bannerOneItems.isEmpty) {
      return Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: Container(
          height: 150.h,
          width: double.maxFinite,
          color: Colors.white,
        ),
      );
    } else if (controller.bannerOneItems.isNotEmpty) {
      return Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          CarouselSlider.builder(
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
                  controller.currentSlider.value = index;
                }),
            itemCount: controller.bannerOneItems.length,
            // itemCount: 10,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () async {
                  // logger.e("${controller.carouselList[index].value2}  id : ${controller.carouselList[index].id}  Full Path: ${controller.carouselList[index].link}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      7.w,
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color.fromRGBO(0, 0, 0, 0.2),
                    //     blurRadius: 4,
                    //     spreadRadius: 0,
                    //     offset: Offset(0, 2),
                    //   ),
                    // ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      7.w,
                    ),
                    child: AppImageView(
                      "${controller.bannerOneItems[index].imagePathApp}",
                      fit: BoxFit.fill,
                      width: Get.width,
                      // cachedNetHeight: 150.h,
                      // cachedNetWidth: double.infinity,
                      // borderRadius: BorderRadius.circular(
                      //   10.w,
                      // ),
                      // alignment: Alignment.center,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.bannerOneItems.map((url) {
                int index = controller.bannerOneItems.indexOf(url);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 8.w,
                    width: 8.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      shape: BoxShape.circle,
                      color: controller.currentSlider.value == index ? Colors.white : Colors.transparent,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 4.0),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
    } else if (!controller.isCarouselInitial.value && controller.bannerOneItems.isEmpty) {
      return const SizedBox();
    } else {
      // should not be happening
      return Container(
        height: 100,
      );
    }
  }

  Widget _itemWidgetList(BuildContext context) {
    return controller.popularCategories.isNotEmpty
        ? Container(
            // height:
            //     /* controller.popularCategoriesWidgetList.length < 6
            // ? 160.h / 2
            // : */
            //     350.h,
            width: Get.width,
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h, bottom: 0
                // vertical: 11.h,
                ),
            child: Center(
              child: GridView.builder(
                //scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 120.r,
                  crossAxisCount: 5,
                  // controller.popularCategoriesWidgetList.length < 6 ? 1 : 2,
                  //mainAxisSpacing: 20,
                  //childAspectRatio: 1,
                  //crossAxisSpacing: 50,
                ),
                physics: NeverScrollableScrollPhysics(),
                //itemCount: controller.popularCategoriesWidgetList.length,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ItemWidget("", "");
                },
              ),
            ),
          )
        : SizedBox();
  }

  Widget _fourItemBannerWidgetList(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.h),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(
          right: 1.w,
          left: 0,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 53.h,
          crossAxisCount: 2,
          mainAxisSpacing: 12.w,
          crossAxisSpacing: 12.w,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.scaffoldKey.currentState?.openEndDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
              child: AppImageView(
                "assets/temp/4item.png",
                height: 52.h,
                // width: 56.w,
                // cachedNetWidth: 173.w,
                // cachedNetHeight: 52.h,
                // boxFit: BoxFit.fill,
                // borderRadius: BorderRadius.circular(
                //   8,
                // ).r,
              ),
            ),
          );
        },
      ),
    );
  }

  _suggestCategoriesWidget(context) {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        //width: 358.w,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'home_screen_featured_categories'.tr,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Suggested For You",
                        style: TextStyle(
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      //Get.toNamed(Routes.category, arguments: true);
                    },
                    child: Container(
                      width: 98.w,
                      margin: EdgeInsets.only(
                        top: 5.h,
                        bottom: 8.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 1.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppColors.primary.shade100,
                          width: 1.w,
                        ),
                      ),
                      child: Center(
                        child: Text("see_more".tr, style: TextStyle(color: AppColors.primary.shade100, fontSize: 12, fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                //right: 7,
                bottom: 8.h,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: controller.popularCategories.isNotEmpty
                    ? buildCategoriesWidget()
                    : SizedBox(
                        height: 264.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 100.h,
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.h,
                            crossAxisSpacing: 6.w,
                          ),
                          //physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Expanded(
                              child: SizedBox(),
                              //  child: Padding(padding: const EdgeInsets.only(right: 8.0), child: ShimmerHelper().buildBasicShimmer(height: 90.h, width: 90.w)),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCategoriesWidget() {
    return SizedBox();
    // return min(12, controller.popularCategoriesWidgetList.length) < 6
    //     ? SizedBox(
    //         height: 264.h / 2,
    //         child: GridView.builder(
    //           //padding: EdgeInsets.only(right: 8.h),
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             mainAxisExtent: 100.h,
    //             crossAxisCount: 1,
    //             mainAxisSpacing: 12.h,
    //             crossAxisSpacing: 12.w,
    //           ),
    //           //physics: NeverScrollableScrollPhysics(),
    //           itemCount: min(12, controller.popularCategoriesWidgetList.length),
    //           itemBuilder: (context, index) {
    //             return CategoriesItemWidget(popularCategoriesWidgetList: controller.popularCategoriesWidgetList[index] ,index:  index);
    //           },
    //         ),
    //       )
    //     : SizedBox(
    //         height: 264.h,
    //         child: GridView.builder(
    //           shrinkWrap: true,
    //           scrollDirection: Axis.horizontal,
    //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //             mainAxisExtent: 100.h,
    //             crossAxisCount: 2,
    //             mainAxisSpacing: 8.h,
    //             crossAxisSpacing: 6.w,
    //           ),
    //           //physics: NeverScrollableScrollPhysics(),
    //           itemCount: min(12, controller.popularCategoriesWidgetList.length),
    //           itemBuilder: (context, index) {
    //             return CategoriesItemWidget(controller.popularCategoriesWidgetList[index], index);
    //           },
    //         ),
    //       );
  }

  buildBannerRowOne() {
    if (controller.bannerTwoItems.isEmpty || controller.isLoading.value == true) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 164.h,
          child: ListView.separated(
              itemCount: controller.bannerTwoItems.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {},
                  child: Container(
                    width: Get.width - (Get.width * .13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: AppImageView(
                        "${controller.bannerTwoItems[index].imagePath}",
                        fit: BoxFit.fill,

                        //todo lomba image
                        // width: double.maxFinite,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
  }

  buildBannerRowTwo() {
    if (controller.bannerThreeItems.isEmpty || controller.isLoading.value == true) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 164.h,
          child: ListView.separated(
              itemCount: controller.bannerThreeItems.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {},
                  child: Container(
                    width: Get.width - (Get.width * .13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: AppImageView(
                        "${controller.bannerThreeItems[index].imagePath}",
                        fit: BoxFit.fill,
                        // placeholder: (context, url) => Image.asset(placeHolderDeals),
                        // errorWidget: (context, url, error) => Image.asset(noImageFound),
                        //todo lomba image
                        // width: double.maxFinite,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      elevation: 1,
      systemOverlayStyle: (Platform.isIOS)
          ? SystemUiOverlayStyle.light
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
      title: Obx(() {
        return GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return Filter();
            // }));
          },
          child: /*controller.isLoading.value
              ? ShimmerHelper().buildAppBarShimmer(
                  height: 38.h,
                )
              :*/
              const SlSearchBar(),
        );
      }),
      centerTitle: true,
    );
  }
}

class SearchBoxDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // final bool isCollapsed = shrinkOffset >= maxExtent - minExtent;
    final double percentage = shrinkOffset / maxExtent;
    final double searchBarOpacity = 1 - percentage.clamp(0.0, 1.0);
    return Container(
      //height: 40.h,
      width: Get.width,
      decoration: (searchBarOpacity == 0)
          ? const BoxDecoration(
              color: Colors.transparent,
            )
          : BoxDecoration(
              image: DecorationImage(
                opacity: searchBarOpacity,
                image: AssetImage(Assets.imagesHomeHeaderBg.path),
                // Replace 'assets/background_image.jpg' with your image path
                fit: BoxFit.cover,
              ),
            ),
      child: const SlSearchBar(),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
