// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// abstract class BaseController extends GetxController {
//   final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
//   final scrollController = ScrollController();

//   final _isLoading = false.obs;
//   final _message = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onReady() {
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     scrollController.dispose();
//     super.onClose();
//   }

//   bool get isLoading => _isLoading.value;

//   void showLoading() => _isLoading.value = true;

//   void hideLoading() => _isLoading.value = false;

//   String get message => _message.value;

//   void showMessage(String message) => _message.value = message;

//   void clearMessage() => _message.value = '';
// }
