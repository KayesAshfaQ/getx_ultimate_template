import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/extensions/view_extension.dart';
import 'package:getx_ultimate_template/app/core/view/components/ripple_view.dart';

import '../values/const/app_values.dart';
import '../values/theme/app_colors.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  const BaseView({super.key});

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          annotatedRegion(context),
          pageScaffold(context),
        ],
      ),
    );
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor(), //Status bar color for android
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      key: key,
      backgroundColor: pageBackgroundColor(), //sets ios status bar color
      appBar: appBar(context),
      body: pageContent(context),
      drawer: drawer(),
      bottomSheet: bottomSheet(),
      bottomNavigationBar: bottomNavigationBar(),
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              controller.message.isNotEmpty ? showStatusMessage() : const SizedBox.shrink(),
              Expanded(
                child: body(context),
              ),
            ],
          ),
          controller.isLoading ? showLoading() : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Color pageBackgroundColor() {
    return AppColors.background;
  }

  Color statusBarColor() {
    return AppColors.primary;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? bottomSheet() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget showLoading() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(AppValues.margin),
        child: const CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget showStatusMessage() {
    return Container(
      margin: const EdgeInsets.all(AppValues.smallMargin),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(AppValues.smallRadius),
        ),
        padding: const EdgeInsets.all(AppValues.halfPadding),
        child: Row(
          children: [
            Get.gapHorizontal(AppValues.halfPadding),
            Expanded(
              child: Text(
                controller.message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            RippleView(
              onTap: controller.clearMessage,
              isCircular: true,
              padding: 2,
              rippleColor: Colors.white,
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
