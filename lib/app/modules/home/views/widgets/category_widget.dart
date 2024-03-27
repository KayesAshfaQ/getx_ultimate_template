import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/components/ripple_view.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../data/models/response/all_category_list_response.dart';
import '../../../../gen/assets.gen.dart';
import 'view_all_button.dart';

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
                      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                          const ViewAllButton(),
                        ],
                      ),
                    ),
                    Container(
                      height: allCategories.length > 5 ? 244.h : 122.h,
                      width: Get.width,
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        itemCount: allCategories.length,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: allCategories.length > 5 ? 2 : 1,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 120.h,
                            width: 105.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.gray.shade200, width: 0.25),
                            ),
                            child: Column(
                              children: [
                                Get.gapVertical(8),
                                AppImageView(
                                  (allCategories[index].icon != null && allCategories[index].icon!.isNotEmpty) ? "${allCategories[index].icon}" : Assets.imagesNoImageFound.path,
                                  fit: BoxFit.cover,
                                  isImageCircular: true,
                                  width: 55.w,
                                  height: 55.w,
                                ),
                                Get.gapVertical(8),
                                Text(
                                  allCategories[index].name!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.text,
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
