import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../core/components/app_dialogue.dart';
import '../../core/utils/misc.dart';

class InternetConnectionCheckService extends GetxService {
  late StreamSubscription _streamSubscription;

  bool isInternetConnected = true;

  Future<void> checkStatus() async {
    isInternetConnected = await InternetConnectionChecker().hasConnection;
  }

  void _onStatusChange(InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        printLog('Data connection is available.');
        isInternetConnected = true;

        // if a dialog is already open, close it
        // if (_alertKey.currentContext != null) {
        //   Get.back(closeOverlays: true);
        // }

        Get.back(closeOverlays: true);

        break;
      case InternetConnectionStatus.disconnected:
        printLog('You are disconnected from the internet.');
        isInternetConnected = false;
        showNoInternetConnectionDialog();
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = InternetConnectionChecker().onStatusChange.listen(_onStatusChange);
  }

  @override
  void onClose() {
    _streamSubscription.cancel();

    super.onClose();
  }
}
