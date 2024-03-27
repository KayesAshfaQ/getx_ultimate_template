import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

import '../../../../core/components/app_image_view.dart';
import '../../../../gen/assets.gen.dart';

class OffersSection extends StatelessWidget {
  const OffersSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.white,
        padding: REdgeInsets.all(16),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.w,
            mainAxisSpacing: 6.w,
            childAspectRatio: 1.w / 0.309.h,
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
      ),
    );
  }
}
