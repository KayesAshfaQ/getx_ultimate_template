import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/config/app_colors.dart';

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
            // color: Colors.amberAccent,
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8).r,
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ]),
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
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.zero),

                      child: AppImageView(
                        '$baseImageURL/${bestShop!.shopLogo!}',
                        height: 150.h,
                        width: 150.w,
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
                    top: 10,
                    child: ClipPath(
                      clipper: CardBannerClipPath(),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(9, 7, 9, 6).r,
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
                          style: TextStyle(color: Colors.white, fontSize: 10.h, fontWeight: FontWeight.w500, fontFamily: 'inter'),
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
                style: TextStyle(color: AppColors.black, fontSize: 14.h, fontWeight: FontWeight.w500, fontFamily: 'inter'),
              ),
            ),
            bestShop!.followers?.toInt() == null
                ? const SizedBox()
                : Visibility(
                    visible: true, //widget.bestShop!.followers!.toInt() > 0,
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
                        style: const TextStyle(color: Color(0xFF414141), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'inter'),
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
                                style: const TextStyle(color: Color(0xFF414141), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'inter'),
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
