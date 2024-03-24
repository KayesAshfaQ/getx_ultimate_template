import 'package:sl_v4/app/data/models/response/banner_data_response.dart';

import '../../services/api_client.dart';
import '../../services/api_end_points.dart';
import '../models/response/all_category_list_response.dart';
import '../models/response/best_shop_list_response.dart';
import '../models/response/just_for_you_products_response.dart';
import '../models/response/most_popular_products_response.dart';
import '../models/response/popular_categories_response.dart';

class HomePageRepository {
  static Future<BannerDataResponse?> getBannerSliders() async {
    final res = await ApiClient.call(
      ApiEndPoints.activePageSettings,
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isLogRequired: true,
      isErrorToastRequired: false,
      isCacheRequired: false,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return BannerDataResponse.fromJson(res.value.data!);
    }
    return null;
  }

  Future<PopularCategoriesResponse?> getPopularCategories() async {
    final res = await ApiClient.call(
      ApiEndPoints.popularCategories,
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return PopularCategoriesResponse.fromJson(res.value.data!);
    }
    return null;
  }

  Future<AllCategoryListResponse?> getMainCategories() async {
    final res = await ApiClient.call(
      ApiEndPoints.allCategoryList,
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return AllCategoryListResponse.fromJson(res.value.data!);
    }
    return null;
  }

  Future<AllCategoryListResponse?> getAllCategories(currentPage, rowsPerPage) async {
    final res = await ApiClient.call(
      ApiEndPoints.getCategories(currentPage, rowsPerPage),
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isLogRequired: true,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return AllCategoryListResponse.fromJson(res.value.data!);
    }
    return null;
  }

  // get best shops
  Future<BestShopListResponse?> getBestShops(currentPage, rowsPerPage) async {
    final res = await ApiClient.call(
      ApiEndPoints.getBestShops(currentPage, rowsPerPage),
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return BestShopListResponse.fromJson(res.value.data!);
    }
    return null;
  }

  // get most popular products
  Future<MostPopularProductsResponse?> getMostPopularProducts() async {
    final res = await ApiClient.call(
      ApiEndPoints.getMostPopularProducts,
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return MostPopularProductsResponse.fromJson(res.value.data!);
    }
    return null;
  }

  // get just for you products
  Future<JustForYouProductsResponse?> getJustForYouProducts(currentPage, rowsPerPage) async {
    final res = await ApiClient.call(
      ApiEndPoints.getJustForYou(currentPage, rowsPerPage),
      RequestType.get,
      isAuthorizationRequired: false,
      isRetryRequired: false,
      isErrorToastRequired: false,
      isCacheRequired: true,
    );

    if (res.isSuccess && res.value.data != null) {
      // convert response to SignInResponse
      return JustForYouProductsResponse.fromJson(res.value.data!);
    }
    return null;
  }
}
