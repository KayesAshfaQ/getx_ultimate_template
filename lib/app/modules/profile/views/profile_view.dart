import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/components/app_image_view.dart';
import 'package:sl_v4/app/core/components/app_scaffold.dart';
import 'package:sl_v4/app/core/components/common_appbar.dart';
import 'package:sl_v4/app/core/utils/misc.dart';

import '../../../core/components/app_text_field.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/localization/localization_service.dart';
import '../../../core/localization/strings_enum.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../controllers/profile_controller.dart';
import 'widgets/profile_row.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CommonAppBar(
        cartItemCount: 16,
        showBackButton: false,
      ),
      body: Padding(
        padding: REdgeInsets.only(bottom: 35, top: 24, right: 16, left: 16),
        child: Column(
          children: [
            ///Profile Upper Card
            Container(
              padding: REdgeInsets.only(left: 14, right: 14, top: 12, bottom: 12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 12,
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ///Image
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(4, 4),
                          blurRadius: 6.5,
                          color: Color.fromRGBO(56, 77, 108, 0.25),
                        ),
                      ],
                    ),
                    child: Container(
                      height: 90.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      margin: REdgeInsets.all(4),
                      child: ClipRRect(
                        child: AppImageView(
                          Assets.imagesNoPp.path, // TODO: Add user image
                        ),
                      ),
                    ),
                  ),
                  16.horizontalSpace,

                  ///Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'userName',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        2.verticalSpace,
                        Visibility(
                          visible: 'userEmail'.isNotEmpty,
                          child: Text(
                            'userEmail',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                        2.horizontalSpace,
                        Visibility(
                          visible: 'userPhone'.isNotEmpty,
                          child: Text(
                            'userPhone',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray,
                            ),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: AppImageView(
                            Assets.iconsHeart.path, // TODO: Add star icon
                          ),
                          label: Text(
                            "0 Points",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                          style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(Colors.transparent),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.grey), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))), backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(234, 234, 234, 1)), padding: MaterialStatePropertyAll(REdgeInsets.symmetric(horizontal: 16, vertical: 8))),
                          child: Text(
                            "Edit Profile",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.verticalSpace,

            ///Profile Tiles
            Expanded(
              child: SingleChildScrollView(
                padding: REdgeInsets.only(bottom: 50),
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 12,
                        color: Color.fromRGBO(0, 0, 0, 0.05),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsTrackOrdersIcon.path,
                        title: 'track_orders'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsPurchaseHistory.path,
                        title: 'profile_screen_purchase_history'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        hasCount: true,
                        icon: Assets.iconsMyWishList.path,
                        title: 'My Wishlist'.tr,
                        boxColor: const Color.fromRGBO(0, 76, 255, 0.18),
                        count: "03",
                        countColor: const Color.fromRGBO(0, 76, 255, 1),
                      ),
                      ProfileRow(
                        onTap: () {},
                        hasCount: true,
                        icon: Assets.iconsNotifications.path,
                        title: 'Notifications'.tr,
                        boxColor: const Color.fromRGBO(253, 233, 235, 1),
                        count: "02",
                        countColor: const Color.fromRGBO(239, 75, 97, 1),
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsPaymentMethod.path,
                        title: 'paymentMethod'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsRefundRequests.path,
                        title: 'Refund Requests'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsManageShippingAddress.path,
                        title: 'Manage Shipping Address'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsChangePassword.path,
                        title: 'Change password'.tr,
                      ),
                      ProfileRow(
                        onTap: () {
                          printLog('Changes Language Called!');
                          LocalizationService.updateLanguage(
                            LocalizationService.getCurrentLocal().languageCode == 'en' ? 'bn' : 'en',
                          );
                        },
                        icon: Assets.iconsChangeLanguage.path,
                        title: 'Change Language'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsSupportTicket.path,
                        title: 'Support Ticket'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsTermsConditions.path,
                        title: 'Terms & Conditions'.tr,
                      ),
                      ProfileRow(
                        onTap: () {},
                        icon: Assets.iconsSupportTicket.path,
                        title: 'Customer Support'.tr,
                      ),
                      ProfileRow(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Alert !',
                            titlePadding: const EdgeInsets.only(top: 15),
                            barrierDismissible: false,
                            content: Text('profile_logout_alert'.tr),
                            actions: [
                              TextButton(
                                  style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.grey[850]), backgroundColor: const MaterialStatePropertyAll(AppColors.primary), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black)))),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('common_no'.tr, style: const TextStyle(color: Colors.white))),
                              TextButton(
                                  style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.grey[850]), backgroundColor: const MaterialStatePropertyAll(AppColors.primary), shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5), side: const BorderSide(color: Colors.black)))),
                                  onPressed: () {
                                    // controller.logout();
                                  },
                                  child: Text(
                                    'common_yes'.tr,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            ],
                          );
                        },
                        icon: "assets/icons/logout.svg",
                        title: 'logout'.tr,
                        hasDivider: false,
                      ),
                      4.verticalSpace
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
