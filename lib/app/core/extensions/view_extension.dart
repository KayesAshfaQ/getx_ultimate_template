import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension EmailValidator on GetInterface {
  Widget gapVertical(double value) {
    return value.verticalSpace;
  }

  Widget gapHorizontal(double value) {
    return value.horizontalSpace;
  }

  Widget gapVerticalSliver(double value) {
    return SliverToBoxAdapter(
      child: value.verticalSpace,
    );
  }

  Widget gapHorizontalSliver(double value) {
    return SliverToBoxAdapter(
      child: value.horizontalSpace,
    );
  }
}
