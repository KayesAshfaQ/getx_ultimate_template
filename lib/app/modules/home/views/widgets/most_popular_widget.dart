import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

import '../../../../core/common_widgets/product_card.dart';
import '../../../../data/models/response/most_popular_products_response.dart';

class MostPopularWidget extends StatelessWidget {
  final List<MostPopularType> types;

  const MostPopularWidget({
    super.key,
    required this.types,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: types.length,
      separatorBuilder: (_, __) => SizedBox(height: 8.h),
      itemBuilder: (BuildContext context, int index) {
        final productType = types[index];

        return (productType.products ?? []).isEmpty
            ? const SizedBox.shrink()
            : Container(
                height: 548.h,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                color: const Color(0xFFFEF4EF),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        16.horizontalSpace,
                        Text(
                          '${productType.categoryName}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.gray.shade800,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.r),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 8.r,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        16.horizontalSpace,
                      ],
                    ),
                    16.verticalSpace,
                    Expanded(
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 8.0, // spacing between columns
                          childAspectRatio: 234 / 159, // aspect ratio of each item (width/height)
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w), // padding around the grid
                        itemCount: productType.products!.length, // total number of items
                        itemBuilder: (context, index) {
                          final product = productType.products![index];

                          return ProductCard(product: product);
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
