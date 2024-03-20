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
          mainAxisSpacing: 8.w,
          childAspectRatio: 172 / 52,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppImageView(
                  Assets.imagesPromotionalDemo.path,
                  height: 52.w,
                  width: 172.w,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
