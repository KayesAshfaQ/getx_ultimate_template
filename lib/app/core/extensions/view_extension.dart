import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

extension Gaps on GetInterface {
  Widget gapVertical(double value) {
    return RSizedBox.vertical(value);
  }

  Widget gapHorizontal(double value) {
    return RSizedBox.horizontal(value);
  }

  Widget gapVerticalSliver(double value) {
    return SliverToBoxAdapter(
      child: RSizedBox.vertical(value),
    );
  }

  Widget gapHorizontalSliver(double value) {
    return SliverToBoxAdapter(
      child: RSizedBox.horizontal(value),
    );
  }
}

extension Shadows on GetInterface {
  BoxShadow get boxShadow1 => BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      );

  BoxShadow get bexShadow2 => BoxShadow(
        color: Colors.black.withOpacity(0.08),
        offset: const Offset(0, 2),
        blurRadius: 4,
      );

  BoxShadow get boxShadow3 => BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 5,
        offset: const Offset(0, 3), // changes position of shadow
      );

  BoxShadow get boxShadow4 => BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 3), // changes position of shadow
      );
}
