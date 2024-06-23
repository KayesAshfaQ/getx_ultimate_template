import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_ultimate_template/app/core/utils/misc.dart';
import 'package:getx_ultimate_template/app/core/view/components/app_snackbars.dart';

import '../../../data/models/remote/response/search_repo_response.dart';
import '../../../data/repository/remote/search_repository.dart';

class HomeController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final ScrollController scrollController = ScrollController();
  final repositories = <Repository>[].obs;
  int page = 1;
  int perPage = 20;
  String sort = 'stars';
  String order = 'desc';
  String query = '';
  bool isLastPage = false;

  final double _boundaryOffset = 0.7;

  @override
  void onInit() {
    super.onInit();

    // call api in the first time
    fetchRepositories();

    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    printLog('scrollListener');
    if (scrollController.offset >= scrollController.position.maxScrollExtent * _boundaryOffset) {
      // check if it's the last page
      if (isLastPage || isLoading) return;

      printLog('scrollListener x');

      // increase page number
      page++;

      // call api
      fetchRepositories();
    }
  }

  Future<void> fetchRepositories() async {
    // show loading
    showLoading();

    final repo = Get.find<SearchRepository>();
    final res = await repo.search(
      query: 'flutter',
      page: page,
      perPage: perPage,
      sort: sort,
      order: order,
    );

    if (res.isError) {
      final err = res.error;
      // show error message
      AppSnackbars.showError(title: '${err.statusCode}', message: err.message);
    } else if (res.isSuccess) {
      final data = searchRepositoryFromJson(res.value.toString());
      repositories.addAll(data.items!);

      if (repositories.length >= data.totalCount!) {
        isLastPage = true;
      }
    }

    // hide loading
    hideLoading();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    super.onClose();
  }

  void showLoading() {
    _isLoading.value = true;
  }

  void hideLoading() {
    _isLoading.value = false;
  }
}
