import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../core/components/app_text_field.dart';
import '../../../../core/components/ripple_view.dart';
import '../../../../core/config/app_colors.dart';
import '../../../../core/localization/strings_enum.dart';
import '../../../../data/models/response/banner_data_response.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../routes/app_pages.dart';

class CollapsibleHeader extends StatelessWidget {
  const CollapsibleHeader({
    super.key,
    required this.bannerItems,
  });

  final List<HomePageBanner> bannerItems;

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
                  Container(
                    height: 168.h,
                    width: Get.width,
                    margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
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
                    child: bannerItems.isEmpty
                        ? const SizedBox()
                        : CarouselSlider.builder(
                            itemCount: bannerItems.length,
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
                                  bannerItems[index].imagePathApp ?? '',
                                  height: 168.h,
                                  width: Get.width,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                  ),
                  Container(
                    height: 40.h,
                    width: Get.width - (80.w), // remove margin width of both side
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        8.horizontalSpace,
                        Text(
                          Strings.setDeliveryLocation.tr,
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
            ],
          ),
        ],
      ),
    );
  }

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
              color: AppColors.gray.shade300,
            ),
            textStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w500,
              color: AppColors.gray.shade700,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            prefixIcon: Assets.iconsSearch.path,
            prefixIconSize: 20,
            prefixIconColor: AppColors.gray.shade300,
          ),
        ),
      );
}
