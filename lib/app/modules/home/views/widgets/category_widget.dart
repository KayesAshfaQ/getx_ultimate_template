import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../data/models/response/all_category_list_response.dart';
import '../../../../gen/assets.gen.dart';

class CategoryWidget extends StatelessWidget {
  final List<AllCategoryListItem> allCategories;

  const CategoryWidget({required this.allCategories, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(
        () => allCategories.isEmpty
            ? const SizedBox.shrink()
            : Container(
                height: allCategories.length > 3 ? 331.h : 205.h,
                width: Get.width,
                color: AppColors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.gray,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Recommended For You",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray.shade400,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              //Get.to(ReviewView());
                            },
                            child: Row(
                              children: [
                                const Text(
                                  "View All",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(3.r),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.r),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 8.r,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: allCategories.length > 3 ? 244.h : 122.h,
                      width: Get.width,
                      padding: EdgeInsets.only(left: 16.r),
                      child: GridView.builder(
                        itemCount: allCategories.length,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.all(0.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: allCategories.length > 3 ? 2 : 1,
                          childAspectRatio: 1,
                          crossAxisSpacing: 0.r,
                          mainAxisSpacing: 0.r,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 120.h,
                            width: 105.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: AppColors.gray,
                              ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 12.r),
                                AppImageView(
                                  allCategories[index].icon!.isNotEmpty ? "${allCategories[index].icon}" : Assets.imagesNoImageFound.path,
                                  fit: BoxFit.cover,
                                  isImageCircular: true,
                                  width: 55.w,
                                  height: 55.w,
                                ),
                                SizedBox(height: 10.r),
                                Text(
                                  allCategories[index].name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.gray,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
