import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/auth_repository.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/auth_repository_impl.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/search_repository.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/search_repository_impl.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<SearchRepository>(() => SearchRepositoryImpl());
  }
}
