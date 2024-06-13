import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../values/const/app_values.dart';
import '../values/theme/app_colors.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  const BaseView({super.key});

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        annotatedRegion(context),
        Obx(() {
          if (controller.isLoading) {
            return showLoading();
          }
          return const SizedBox.shrink();
        }),
        pageScaffold(context),
      ],
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
      child: body(context),
      //  Column(
      //   children: [
      //     Obx(() {
      //       if (controller.message.isNotEmpty) {
      //         return showStatusMessage();
      //       }
      //       return const SizedBox.shrink();
      //     }),
      //     body(context),
      //   ],
      // ),
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
      color: AppColors.primary,
      padding: const EdgeInsets.all(AppValues.margin),
      child: Row(
        children: [
          Expanded(
            child: Text(
              controller.message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: controller.clearMessage,
          ),
        ],
      ),
    );
  }
}
