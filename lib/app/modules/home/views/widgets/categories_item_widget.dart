import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../core/config/app_colors.dart';
import '../../../../core/config/remote_config.dart';
import '../../../../core/utils/misc.dart';
import '../../../../data/models/response/popular_categories_response.dart';

class CategoriesItemWidget extends StatelessWidget {
  final PopularCategoriesData popularCategoriesWidgetList;
  final int index;

  const CategoriesItemWidget({
    required this.popularCategoriesWidgetList,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.toNamed(
        //   Routes.subCategoryProductList,
        //   arguments: NavigationArgModel(
        //     id: popularCategoriesWidgetList.id,
        //     title: popularCategoriesWidgetList.name,
        //   ),
        // );
      },
      child: SizedBox(
        width: 90.w,
        child: Column(
          children: [
            AppImageView(
              // imagePath: popularCategoriesWidgetList.icon,
              getImageURL(size: ImageSize.small, path: popularCategoriesWidgetList.icon),
              height: 90.h,
              width: 90.w,
            ),
            SizedBox(height: 3.h),
            SizedBox(
              width: 90.w,
              child: Text(
                //featuredCategory.name.toString(),
                popularCategoriesWidgetList.name.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
