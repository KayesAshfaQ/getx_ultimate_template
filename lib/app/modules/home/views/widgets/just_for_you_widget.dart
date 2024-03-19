import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';



import '../../../../core/common_widgets/product_card.dart';
import '../../../../data/models/response/product.dart';

class JustForYouWidget extends StatelessWidget {
  final List<Product> products;
  final bool isLoading;

  const JustForYouWidget({
    super.key,
    required this.products,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Just For You',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.gray.shade800,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    8.horizontalSpace,
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
                  ],
                ),
                16.verticalSpace,
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // number of items in each row
                    mainAxisSpacing: 8.0, // spacing between rows
                    crossAxisSpacing: 8.0, // spacing between columns
                    childAspectRatio: 173 / 234, // aspect ratio of each item (width/height)
                  ),
                  // padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: products.length, // total number of items
                  itemBuilder: (context, index) => ProductCard(product: products[index]),
                ),
                16.verticalSpace,
                if (isLoading)
                  const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                8.verticalSpace,
              ],
            ),
          );
  }
}
