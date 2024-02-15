import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/app_colors.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  const BaseView({super.key});

  PreferredSizeWidget? appBar(BuildContext context);

  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => FocusScope.of(context).unfocus(), // making issue on textField focus and sliver is doing unwanted behavior
      child: Obx(() {
        return Scaffold(
            backgroundColor: AppColors.white,
            key: controller.globalKey,
            appBar: appBar(context),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
            drawer: drawer(context),
            body: pageScaffold(context));
      }),
    );
  }

  // widgets
  Widget pageScaffold(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Column(
        children: [
          controller.connectionController.isInternetConnected.value
              ? const SizedBox()
              : connectionStatusView() ?? const SizedBox(),
          Expanded(child: body(context)),
        ],
      ),
    );
  }



  //optional
  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? connectionStatusView() {
    return Visibility(
      visible: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
          width: double.infinity,
          height: 30,
          color: AppColors.black,
          child: Center(
            child: Text(
              controller.connectionController.connectionStatusMessage.value,
            ),
          ),
        ),
      ),
    );
  }
}
