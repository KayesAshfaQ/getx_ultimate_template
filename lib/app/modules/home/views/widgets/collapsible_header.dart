import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';
import 'package:sl_v4/app/modules/home/controllers/home_controller.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../core/components/app_text_field.dart';
import '../../../../core/components/ripple_view.dart';
import '../../../../core/config/app_colors.dart';
import '../../../../core/localization/strings_enum.dart';
import '../../../../core/utils/misc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../routes/app_pages.dart';

class CollapsibleHeader extends StatelessWidget {
  const CollapsibleHeader({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      backgroundColor: AppColors.transparent,
      expandedHeight: 320.h,
      floating: false,
      pinned: true,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        background: _header(),
        title: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return constraints.maxHeight < 64 ? _searchBar() : const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _header() {
    return SizedBox(
      height: 340.h,
      child: Stack(
        children: [
          // ------------------- header background -------------------
          AppImageView(
            Assets.imagesHomeHeaderBg.path,
            height: 232.h,
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

                  // ------------------- appbar logo -------------------
                  AppImageView(
                    Assets.logoShoploverMono.path,
                    height: 28.2.h,
                    width: 128.61.w,
                  ),
                  const Spacer(),

                  // ------------------- notification button -------------------
                  RippleView(
                    rippleColor: AppColors.white,
                    isCircular: true,
                    onTap: () {
                      //Get.toNamed(Routes.searchResultPage);
                    },
                    child: AppImageView(
                      Assets.iconsNotificationOutline.path,
                      height: 24.w,
                      color: AppColors.white,
                    ),
                  ),
                  8.horizontalSpace,

                  // ------------------- setting button -------------------
                  RippleView(
                    rippleColor: AppColors.white,
                    isCircular: true,
                    onTap: () {
                      //Get.toNamed(Routes.cartPage);
                    },
                    child: AppImageView(
                      Assets.iconsSettingsOutline.path,
                      height: 24.w,
                      color: AppColors.white,
                    ),
                  ),
                  16.horizontalSpace,
                ],
              ),
              _searchBar(),
              4.verticalSpace,
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // ------------------- carousel -------------------
                  Container(
                    height: 168.h,
                    width: Get.width,
                    margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        Get.boxShadow4,
                      ],
                    ),
                    child: Obx(
                      () => controller.bannerOneItems.isEmpty
                          ? const SizedBox()
                          : CarouselSlider.builder(
                              itemCount: controller.bannerOneItems.length,
                              options: CarouselOptions(
                                //aspectRatio: 2.77,
                                //height: 150.h,
                                //height: 135.h,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                autoPlayAnimationDuration: const Duration(milliseconds: 1200),
                                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  printLog('index: $index, reason: $reason');
                                  controller.currentSlider.value = index;
                                },
                              ),
                              itemBuilder: (context, index, realIndex) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child: AppImageView(
                                    controller.bannerOneItems[index].imagePathApp ?? '',
                                    height: 168.h,
                                    width: Get.width,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // ------------------- location bar -------------------
                      Container(
                        margin: EdgeInsets.only(top: 16.h),
                        height: 40.h,
                        width: Get.width - (80.w), // remove margin width of both side
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [Get.boxShadow4],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            16.horizontalSpace,
                            Expanded(
                              child: Text(
                                Strings.setDeliveryLocation.tr,
                                style: TextStyle(
                                  color: AppColors.gray.shade700,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: SizedBox(
                                height: 16.h,
                                child: VerticalDivider(
                                  width: 1.w,
                                  thickness: 1,
                                  color: AppColors.gray,
                                ),
                              ),
                            ),
                            AppImageView(
                              Assets.iconsLocation.path,
                              height: 16.h,
                              width: 16.w,
                            ),
                            16.horizontalSpace
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,

                        // ------------------- dot indicator -------------------
                        child: Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.bannerOneItems.length,
                              (index) => Container(
                                margin: EdgeInsets.only(right: 4.w),
                                height: 8.w,
                                width: 8.w,
                                decoration: controller.currentSlider.value == index
                                    ? const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      )
                                    : BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white, // Border color
                                          width: 1.0, // Border width
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// search bar of the header
  Widget _searchBar() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: GestureDetector(
          onTap: () => Get.toNamed(Routes.SEARCH_RESULT),
          child: AppTextField(
            isEnable: false,
            hint: Strings.search.tr,
            textFieldType: AppTextFieldType.none,
            radius: 6.r,
            disabledBorderColor: AppColors.primary.shade300,
            defaultBorderWidth: 1,
            filledColor: AppColors.white,
            hintStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w500,
              color: AppColors.gray.shade400,
            ),
            textStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w500,
              color: AppColors.gray.shade700,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            prefixIcon: Assets.iconsSearch.path,
            prefixIconSize: 20,
            prefixIconConstraints: BoxConstraints.tight(const Size(40, 20)), // prefix icon container size
            prefixIconColor: AppColors.gray.shade400,
          ),
        ),
      );
}
