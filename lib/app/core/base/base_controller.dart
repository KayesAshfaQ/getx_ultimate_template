import 'package:flutter/material.dart' show GlobalKey, ScaffoldState;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../connection_manager/connection_manager_controller.dart';
import 'page_state.dart';

abstract class BaseController extends GetxController {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  final isInternetConnected = true.obs;
  final isAuthenticated = false.obs;
  final isTopBgRequired = false.obs;

  final _pageSateController = PageState.defaultState.obs;
  PageState get pageState => _pageSateController.value;

  final connectionController = Get.find<ConnectionManagerController>();

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.defaultState);

  showLoading() => updatePageState(PageState.loading);

  hideLoading() => resetPageState();

  @override
  void onInit() {
    internetConnectionCheck();
    super.onInit();
  }

  internetConnectionCheck() async {
    ConnectivityResult? previous;

    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      isInternetConnected.value = false;
      update();
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult conResult) {
      if (conResult == ConnectivityResult.none) {
        isInternetConnected.value = false;
        update();
      } else if (previous == ConnectivityResult.none) {
        isInternetConnected.value = true;
        update();
      }

      previous = conResult;
    });
  }

// // ----------drawer control -- start----------
//
//  openNavDrawer(){
//     globalKey.currentState!.openDrawer();
//  }
//
//  closeNavDrawer(){
//    globalKey.currentState!.closeDrawer();
//  }
//
// // ----------drawer control -- end----------
}
