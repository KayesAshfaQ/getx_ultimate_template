import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import '../../../../data/models/response/banner_data_response.dart';
import '../../../../gen/assets.gen.dart';
import '../../controllers/home_controller.dart';

class BannerStackWidget extends StatelessWidget {
  final List<HomePageBanner> bannerItems;

  const BannerStackWidget(this.bannerItems, {super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: AppColors.shadow.withOpacity(0.08),
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
    if (bannerItems.isEmpty) {
      return Shimmer.fromColors(
        baseColor: AppColors.shimmerBase,
        highlightColor: AppColors.shimmerHighlight,
        child: Container(
          height: 150.h,
          width: double.maxFinite,
          color: Colors.white,
        ),
      );
    } else if (bannerItems.isNotEmpty) {
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
                  // controller.currentSlider.value = index;
                }),
            itemCount: bannerItems.length,
            // itemCount: 10,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () async {
                  //logger.e("${controller.carouselList[index].value2}  id : ${controller.carouselList[index].id}  Full Path: ${controller.carouselList[index].link}");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                      7.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      7.w,
                    ),
                    child: AppImageView(
                      "${bannerItems[index].imagePathApp}",
                      fit: BoxFit.fill,
                      width: Get.width,
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerItems.map((url) {
                int index = bannerItems.indexOf(url);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 8.w,
                    width: 8.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 4.0),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      );
    } else if (bannerItems.isEmpty) {
      return const SizedBox();
    } else {
      // should not be happening
      return Container(
        height: 100,
      );
    }
  }
}
