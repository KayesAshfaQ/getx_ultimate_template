import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/misc.dart';
import '../../../data/models/response/all_category_list_response.dart';
import '../../../data/models/response/best_shop_list_response.dart';
import '../../../data/models/response/most_popular_products_response.dart';
import '../../../data/models/response/banner_data_response.dart';
import '../../../data/models/response/popular_categories_response.dart';
import '../../../data/models/response/product.dart';
import '../../../data/repository/home_page_repository.dart';

class HomeController extends GetxController {
  final _paginateController = ScrollController();
  ScrollController get paginateController => _paginateController;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  int currentPage = 1;
  bool hasNextPage = false;

  final isLoading = true.obs;
  final isDrawerOpen = false.obs;
  final currentSlider = 0.obs;
  final showProductLoading = false.obs;
  final isCarouselInitial = true.obs;

  final bannerOneItems = <HomePageBanner>[].obs;
  final bannerTwoItems = <HomePageBanner>[].obs;
  final bannerThreeItems = <HomePageBanner>[].obs;
  final allCategories = <AllCategoryListItem>[].obs;
  final bestShops = <BestShop>[].obs;
  final mostPopularProducts = <MostPopularType>[].obs;
  final justForYouProducts = <Product>[].obs;
  final popularCategories = <PopularCategoriesData>[].obs;

  @override
  void onInit() {
    initFetch();

    paginateController.addListener(() async {
      // scroll controller activates when 70% of the scroll is reached
      if (paginateController.offset >= (paginateController.position.maxScrollExtent * 0.7) && showProductLoading.value == false && hasNextPage) {
        printLog('current offset: ${paginateController.offset}\n,showProductLoading value: ${showProductLoading.value}\nmaxScrollExtent: ${paginateController.position.maxScrollExtent}\n70% of maxScrollExtent: ${paginateController.position.maxScrollExtent * 0.7}');
        currentPage++;
        await fetchJustForYou();
      }
    });
    super.onInit();
  }

/*  void toggleDrawer() {
    isDrawerOpen.toggle();
    if (isDrawerOpen.value) {
      Get.to(CustomSearchFilter());
    } else {
      Get.back();
    }
  }*/

  initFetch() {
    fetchCarouseImagesList();
    // fetchPopularCategoriesWidgetList();
    // fetchAllCategoriesWidgetList("", 10, 1, "", "", 1);
    // fetchBestShops();
    // fetchMostPopular();
    // fetchJustForYou();
  }

  Future<void> fetchCarouseImagesList() async {
    isLoading.value = true;
    final carouselResponse = await HomePageRepository.getBannerSliders();

    

    if (carouselResponse != null && carouselResponse.success == true) {
      bannerOneItems.value = carouselResponse.data!.slider ?? <HomePageBanner>[];
      print('bannerOneItems: ${bannerOneItems.length}');
    }

    isCarouselInitial.value = false;
    bannerOneItems.refresh();
    isLoading.value = false;
  }

  Future<void> fetchPopularCategoriesWidgetList() async {
    isLoading.value = true;
    final itemWidgetResponse = await HomePageRepository().getPopularCategories();

    if (itemWidgetResponse != null && itemWidgetResponse.success == true) {
      popularCategories.value = itemWidgetResponse.data ?? <PopularCategoriesData>[];
    }
    isLoading.value = false;
  }

  Future<void> fetchBestShops() async {
    final itemWidgetResponse = await HomePageRepository().getBestShops(1, 100);

    if (itemWidgetResponse != null && itemWidgetResponse.success == true) bestShops.value = itemWidgetResponse.data!.items!;
    bestShops.refresh();
  }

  Future<void> fetchMostPopular() async {
    final response = await HomePageRepository().getMostPopularProducts();

    if (response != null && response.success == true) {
      mostPopularProducts.addAll(response.types!);
    }
  }

  Future<void> fetchJustForYou({int page = 1, int itemPerPage = 10}) async {
    showProductLoading.value = true;

    final response = await HomePageRepository().getJustForYouProducts(currentPage, itemPerPage);

    if (response != null && response.success == true && response.data != null && response.data!.items != null && response.data!.items!.isNotEmpty) {
      justForYouProducts.addAll(response.data!.items!);

      hasNextPage = response.data?.pageInfo?.hasNextPage ?? false;
    }

    await Future.delayed(250.milliseconds).then(
      (value) => showProductLoading.value = false,
    );
  }

  Future<void> fetchAllCategoriesWidgetList(searchQuery, rowsPerPage, currentPage, sortField, sortOrder, statusId) async {
    var response = await HomePageRepository().getAllCategories(searchQuery, rowsPerPage, currentPage, sortField, sortOrder, statusId);
    allCategories.clear();

    if (response != null && response.success == true) {
      allCategories.addAll(response.data?.items?.toList() ?? []);
    }
  }

  Future<void> onRefresh() async {
    bannerOneItems.clear();
    bannerTwoItems.clear();
    bannerThreeItems.clear();
    bestShops.clear();
    mostPopularProducts.clear();
    justForYouProducts.clear();

    currentPage = 1;

    initFetch();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final warrenties = [
    "1 year ",
    "2 year Warranty",
    "3 year ",
    "5 year Warranty",
    "10 year ",
    "1 year ",
    "2 year Warranty",
    "3 year ",
    "5 year Warranty",
    "10 year",
  ].obs;

  final rattings = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ].obs;
}
