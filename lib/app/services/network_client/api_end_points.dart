class ApiEndPoints {
  // Auth Endpoints
  static const String login = 'auth/login';
  static const String register = 'auth/register';

  // Home Page Endpoints
  static const String activePageSettings = "page-settings/get-all";
  static const String popularCategories = "category/get-popular-categories";
  static const String allCategoryList = "category/get-all-category-list";
  static String getCategories( currentPage ,rowsPerPage) => "category/get-all?currentPage=$currentPage&rowsPerPage=$rowsPerPage";
  static String getBestShops(currentPage, rowsPerPage) => "product/product-stock/get-best-shops?currentPage=$currentPage&rowsPerPage=$rowsPerPage";
  static const String getMostPopularProducts = "product-badges/product-stocks";
  static String getJustForYou(currentPage, rowsPerPage) => "product/product-stock/get-only-for-you-products?currentPage=$currentPage&rowsPerPage=$rowsPerPage";
}
