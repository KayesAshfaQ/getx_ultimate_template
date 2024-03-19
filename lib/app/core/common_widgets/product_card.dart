// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/config/remote_config.dart';
import 'package:sl_v4/app/core/utils/misc.dart';

import '../../data/models/response/product.dart';
import '../../routes/app_pages.dart';
import '../components/app_image_view.dart';
import '../components/clipper_helper.dart';
import '../config/app_config.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.PRODUCT_DETAILS,
        arguments: product,
      ),
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.02),
              blurRadius: 16,
              spreadRadius: 0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  // ---------------- Product Image ----------------
                  AppImageView(
                    getImageURL(size: ImageSize.small, path: product.images?.first),
                    height: Get.height.h,
                    width: Get.width.w,
                    fit: BoxFit.cover,
                    // borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),

                  // ---------------- Best Seller Tag ----------------
                  Positioned(
                    top: 0,
                    child: product.isBestSeller ?? false
                        ? ClipPath(
                            clipper: CardBannerClipPath(),
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(9, 7, 9, 6).r,
                              decoration: BoxDecoration(
                                color: const Color(0xFF801EFE),
                                borderRadius: BorderRadius.all(const Radius.circular(4).r),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    offset: Offset(0, 3),
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                  ),
                                ],
                              ),
                              child: Text(
                                'Best Seller',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: 10.h, fontWeight: FontWeight.w500, fontFamily: 'inter'),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  // ---------------- Discount Tag ----------------
                  Positioned(
                    bottom: 2,
                    child: (product.discountPercentage ?? 0) > 0
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6).r,
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B5FC),
                              borderRadius: BorderRadius.all(const Radius.circular(4).r),
                            ),
                            child: Text(
                              '- ${product.discountPercentage}%',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'inter',
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            8.verticalSpace,

            // ---------------- Product Name ----------------
            Text(
              '${product.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'inter',
              ),
            ),
            8.verticalSpace,
            Row(
              children: [
                Text(
                  '৳${NumberFormat.decimalPattern('en_us').format(product.price ?? 0)}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF404040),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'inter',
                  ),
                ),
                if ((product.discountAmt ?? 0) > 0)
                  Text(
                    '৳${NumberFormat.decimalPattern('en_us').format((product.price ?? 0) - product.discountAmt!)}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Color(0xFF666666),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'inter',
                    ),
                  ),
              ],
            ),
            8.verticalSpace,
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: AppColors.primary,
                  size: 16.h,
                ),
                Text(
                  "${product.ratings ?? 0} (${product.totalRating ?? 0})",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
