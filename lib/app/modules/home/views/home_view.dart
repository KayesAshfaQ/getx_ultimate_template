import 'package:flutter/material.dart';
import 'package:getx_ultimate_template/app/core/utils/misc.dart';

import '../../../core/base/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text('HomeView'),
      centerTitle: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
          TextButton(
            onPressed: () {
              printLog('Click Me');
              controller.showLoading();
              Future.delayed(const Duration(seconds: 2), () {
                controller.hideLoading();
              });
            },
            child: const Text('show loading'),
          ),
          TextButton(
            onPressed: () {
              controller.showMessage('Hello World');
            },
            child: const Text('show message'),
          ),
        ],
      ),
    );
  }
}
