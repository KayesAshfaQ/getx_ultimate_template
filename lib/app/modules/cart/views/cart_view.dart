import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sl_v4/app/core/base/base_view.dart';

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
    return const Center(
      child: Text(
        'CartView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
