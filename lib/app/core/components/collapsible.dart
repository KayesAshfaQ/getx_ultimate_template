import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';

class CollapsibleWidget extends StatelessWidget {
  final Widget body;
  final bool showSolidColorOnCollapsed;
  final String? imageUrl;
  final String placeHolderImagePath;

  const CollapsibleWidget({
    super.key,
    required this.body,
    this.showSolidColorOnCollapsed = false,
    required this.imageUrl,
    required this.placeHolderImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            "Tours",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              //fontWeight: FontWeight.w600,
            ),
          ),
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onPressed: () {
              Get.back();
            },
            splashRadius: 24.r,
          ),
          expandedHeight: 124.h,
          pinned: true,
          flexibleSpace: showSolidColorOnCollapsed
              ? FlexibleSpaceBar(
                  background: imageUrl == null
                      ? Image.asset(
                          placeHolderImagePath,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          imageUrl!,
                          fit: BoxFit.fill,
                        ),
                )
              : Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: imageUrl == null
                          ? Image.asset(
                              placeHolderImagePath,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ],
                ),
        ),
        SliverToBoxAdapter(
          child: body,
        ),
      ],
    );
  }
}
