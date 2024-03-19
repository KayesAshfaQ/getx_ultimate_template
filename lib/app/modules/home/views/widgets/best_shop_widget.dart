import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';


import '../../../../core/common_widgets/shop_card.dart';
import '../../../../data/models/response/best_shop_list_response.dart';

class BestShopWidget extends StatelessWidget {
  const BestShopWidget({
    super.key,
    required this.bestShops,
    this.isLoading = false,
  });

  final List<BestShop> bestShops;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return bestShops.isEmpty
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
                      'Best Shops',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
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
                    childAspectRatio: 159 / 208, // aspect ratio of each item (width/height)
                  ),
                  // padding: const EdgeInsets.all(8.0), // padding around the grid
                  itemCount: bestShops.length, // total number of items
                  itemBuilder: (context, index) => ShopCard(
                    bestShop: bestShops[index],
                  ),
                ),
                8.verticalSpace,
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
