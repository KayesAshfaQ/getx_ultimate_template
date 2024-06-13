import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/extensions/view_extension.dart';

import '../../values/const/app_values.dart';
import '../../values/theme/app_colors.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const ElevatedContainer({
    Key? key,
    required this.child,
    this.bgColor = AppColors.background,
    this.padding,
    this.borderRadius = AppValues.smallRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          Get.boxShadow1,
          // BoxShadow(
          //   color: AppColors.elevatedContainerColorOpacity,
          //   spreadRadius: 3,
          //   blurRadius: 8,
          //   offset: const Offset(0, 3), // changes position of shadow
          // ),
        ],
        color: AppColors.background,
      ),
      child: child,
    );
  }
}
