import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/app_colors.dart';

class RippleView extends StatelessWidget {
  final Widget child;
  final double elevation;
  final double padding;
  final bool isCircular;

  /// child background color
  final Color color;
  final VoidCallback? onTap;

  const RippleView({
    super.key,
    required this.child,
    this.padding = 8,
    this.elevation = 0,
    this.isCircular = false,
    this.color = AppColors.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final widget = Material(
      elevation: elevation,
      color: color,
      borderRadius: BorderRadius.circular(4.r),
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primary.withOpacity(0.25),
        highlightColor: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
        child: Container(
          padding: REdgeInsets.all(padding),
          child: child,
        ),
      ),
    );

    return isCircular
        ? ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: widget,
          )
        : widget;
  }
}
