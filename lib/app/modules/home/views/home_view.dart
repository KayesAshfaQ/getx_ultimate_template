import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/base_view.dart';
import '../../../core/localization/strings_enum.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(Strings.home.tr),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return const SizedBox();
  }
}
