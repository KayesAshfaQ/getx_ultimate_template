import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/ripple_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../gen/assets.gen.dart';

class FeaturedCategories extends StatelessWidget {
  const FeaturedCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: REdgeInsets.fromLTRB(16, 0, 16, 8),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          //mainAxisExtent: 104.h,
          crossAxisSpacing: 6.w,
          childAspectRatio: 1.w / 1.55.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return RippleView(
            onTap: () async {},
            padding: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImageView(
                  Assets.imagesHomeHeaderBg.path,
                  height: 56.h,
                  isImageCircular: true,
                ),
                Get.gapVertical(2.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Fashion House label',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.text.shade400,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
