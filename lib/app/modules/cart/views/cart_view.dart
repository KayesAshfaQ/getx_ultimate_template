import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sl_v4/app/core/base/base_view.dart';
import 'package:sl_v4/app/core/utils/permission_helper.dart';

import '../../../core/localization/strings_enum.dart';
import '../controllers/cart_controller.dart';

class CartView extends BaseView<CartController> {
  const CartView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Strings.cart.tr),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          PermissionHelper.requestPermission(
            Permission.storage,
            onGranted: () {
              Get.snackbar('Permission Granted', 'You can now use the camera');
            },
            // onDenied: () {
            //   Get.snackbar('Permission Denied', 'You cannot use the camera');
            // },
            // onPermanentlyDenied: () {
            //   Get.snackbar('Permission Permanently Denied', 'You cannot use the camera');
            // },
            // onRestricted: () {
            //   Get.snackbar('Permission Restricted', 'You cannot use the camera');
            // },
          );
        },
        child: Text(
          'CartView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
