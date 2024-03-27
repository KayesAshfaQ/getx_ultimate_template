import 'package:get/get.dart';

import '../../services/internet_connection/internet_connection_checker.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut(() => InternetConnectionCheckService(), fenix: true);
    Get.put(InternetConnectionCheckService(), permanent: true);
  }
}
