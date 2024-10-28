import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/auth_repository.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/auth_repository_impl.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/search_repository.dart';
import 'package:getx_ultimate_template/app/data/repository/remote/search_repository_impl.dart';

class RepositoryBinding extends Binding {
  @override
  List<Bind> dependencies() => [
        Bind.lazyPut<AuthRepository>(() => AuthRepositoryImpl()),
        Bind.lazyPut<SearchRepository>(() => SearchRepositoryImpl()),
      ];
  // Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
  // Get.lazyPut<SearchRepository>(() => SearchRepositoryImpl());
}
