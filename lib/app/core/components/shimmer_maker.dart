import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

class ShimmerMaker extends StatelessWidget {
  const ShimmerMaker({
    super.key,
    required this.child,
    this.baseColor = AppColors.shimmerBase,
    this.highlightColor = AppColors.shimmerHighlight,
  });

  final Widget child;
  final Color baseColor, highlightColor;

  @override
  Widget build(Object context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}
