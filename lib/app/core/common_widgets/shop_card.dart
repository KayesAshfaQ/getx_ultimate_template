import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';
import 'package:sl_v4/app/core/extensions/view_extension.dart';
import 'package:sl_v4/app/core/utils/misc.dart';
import 'package:sl_v4/app/gen/fonts.gen.dart';

import '../../data/models/response/best_shop_list_response.dart';
import '../components/clipper_helper.dart';
import '../config/remote_config.dart';

class ShopCard extends StatelessWidget {
  final BestShop? bestShop;

  const ShopCard({super.key, this.bestShop});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return InkWell(
      onTap: () {
        // SlRoutes.to(
        //     context,
        //     ProductDetailsView(
        //       productDetails: widget.dProductDetails,
        //       id: widget.id,
        //     ));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 12).r,
        height: 255.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8).r,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [Get.bexShadow2],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, bottom: 0, right: 0, left: 0).r,
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(0),
                        bottom: Radius.zero,
                      ),

                      child: AppImageView(
                        //'$baseImageURL/${bestShop!.shopLogo!}',
                        getImageURL(path: bestShop!.shopLogo!, type: ImageType.product, size: ImageSize.medium),
                        height: Get.height,
                        width: Get.width,
                        fit: BoxFit.contain,
                      ),

                      // child: CachedNetworkImage(
                      //   height: Get.height.h,
                      //   width: Get.width.w,
                      //   imageUrl: '${AppConfig.imageBasePathMedium}${widget.bestShop!.shopLogo!}',
                      //   placeholder: (context, url) => Image.asset(
                      //     Assets.assetsPlaceholder,
                      //     fit: BoxFit.cover,
                      //   ),
                      //   errorWidget: (context, url, error) => Image.asset(
                      //     Assets.imagesNoImageFound,
                      //     fit: BoxFit.cover,
                      //   ),
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    child: ClipPath(
                      clipper: CardBannerClipPath(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6).r,
                        decoration: BoxDecoration(
                          color: bestShop!.sellerTypeName!.contains("verified") ? Colors.green : AppColors.gray,
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
                          bestShop!.sellerTypeName!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontFamily.inter,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            8.verticalSpace,

            ///name
            Container(
              height: 25.h,
              padding: const EdgeInsets.only(
                left: 10,
                right: 8,
              ).r,
              child: Text(
                bestShop!.shopName!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: FontFamily.inter,
                ),
              ),
            ),
            bestShop!.followers?.toInt() == null
                ? const SizedBox()
                : Visibility(
                    visible: true,
                    child: Container(
                      height: 20.h,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 8,
                      ).r,
                      child: Text(
                        "${bestShop!.followers!} Followers",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'inter',
                        ),
                      ),
                    )),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bestShop!.totalRating?.toInt() == null
                    ? const SizedBox()
                    : Visibility(
                        visible: true, //widget.bestShop!.totalRating!.toInt() > 0,
                        child: Container(
                          height: 16.h,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 8,
                          ).r,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16.h,
                              ),
                              Text(
                                "${bestShop!.averageRating!}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Color(0xFF414141),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.inter,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                const Spacer(),
                bestShop!.totalProductSold?.toInt() == null
                    ? const SizedBox()
                    : Visibility(
                        visible: true,
                        //widget.bestShop!.totalProductSold!.toInt() > 0,
                        child: Container(
                          height: 20.h,
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 8,
                          ).r,
                          child: Text(
                            "(${bestShop!.totalProductSold!} sold)",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(color: Color(0xFF414141), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'inter'),
                          ),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
