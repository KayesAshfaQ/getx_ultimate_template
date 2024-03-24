import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../gen/assets.gen.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6.w,
          mainAxisSpacing: 6.w,
          childAspectRatio: 1 / 0.31,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AppImageView(
                Assets.imagesPromotionalDemo.path,
                height: 52.h,
                width: 172.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
