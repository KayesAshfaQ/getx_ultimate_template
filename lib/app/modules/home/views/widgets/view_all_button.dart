
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';

import '../../../../core/components/ripple_view.dart';
import '../../../../core/config/app_colors.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RippleView(
      onTap: onTap,
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
          Get.gapHorizontal(8),
          ClipRRect(
            borderRadius: BorderRadius.circular(3.r),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: Padding(
                padding: REdgeInsets.all(4),
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
    );
  }
}
