import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/print_log.dart';
import '../common_widgets/app_snackbars.dart';
import 'connection_type.dart';

class ConnectionManagerController extends GetxController {
  final isInternetConnected = true.obs;
  final connectionStatusMessage = "No Internet Connection".obs;

  final _connectivity = Connectivity();
  final connectionType = ConnectionType.wifi.obs;

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _getConnectivityType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateConnectivityState);
  }

  @override
  void onClose() {
    _streamSubscription.cancel();

    super.onClose();
  }

  Future<void> _getConnectivityType() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      printLog("PlatformException", error: e);

      return _updateConnectivityState(result);
    }
  }

  _updateConnectivityState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = ConnectionType.wifi;
        isInternetConnected.value = true;
        connectionStatusMessage.value = "Wifi Connected";
        break;
      case ConnectivityResult.mobile:
        connectionType.value = ConnectionType.mobileData;
        isInternetConnected.value = true;
        connectionStatusMessage.value = "Mobile Data Connected";
        break;
      case ConnectivityResult.none:
        connectionType.value = ConnectionType.noInternet;
        isInternetConnected.value = false;
        connectionStatusMessage.value = "No Internet Connection";
        break;
      default:
        AppSnackbars.showCustomToast(
          title: 'Error',
          message: 'Failed to get network connection type!',
          color: Colors.red,
        );
        break;
    }
  }
}
