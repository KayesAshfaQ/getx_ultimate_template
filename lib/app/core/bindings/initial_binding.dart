import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/bindings/repository_binding.dart';

import '../../services/internet_connection/internet_connection_checker.dart';

class InitialBinding extends Binding {
//   @override
//   void dependencies() {
//     //Get.lazyPut(() => InternetConnectionCheckService(), fenix: true);
//     Get.put(InternetConnectionCheckService(), permanent: true);

//     RepositoryBinding().dependencies();
//   }
// }
  @override
  List<Bind> dependencies() => [
    Bind.put(() => InternetConnectionCheckService(), permanent: true),
  ];
}