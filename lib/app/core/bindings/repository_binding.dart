import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/data/repository/auth_repository.dart';
import 'package:getx_ultimate_template/app/data/repository/auth_repository_impl.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
  }
}
