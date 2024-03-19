// To parse this JSON data, do
//
//     final bestShopListResponse = bestShopListResponseFromJson(jsonString);

import 'dart:convert';

BestShopListResponse bestShopListResponseFromJson(String str) => BestShopListResponse.fromJson(json.decode(str));

String bestShopListResponseToJson(BestShopListResponse data) => json.encode(data.toJson());

class BestShopListResponse {
  String? code;
  bool? success;
  String? message;
  Data? data;

  BestShopListResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory BestShopListResponse.fromJson(Map<String, dynamic> json) => BestShopListResponse(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  PageInfo? pageInfo;
  List<BestShop>? items;

  Data({
    this.pageInfo,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    items: json["items"] == null ? [] : List<BestShop>.from(json["items"]!.map((x) => BestShop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pageInfo": pageInfo?.toJson(),
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class BestShop {
  int? id;
  String? shopName;
  String? shopLogo;
  int? totalRating;
  num? averageRating;
  int? sellerType;
  String? sellerTypeName;
  int? totalProductSold;
  int? followers;

  BestShop({
    this.id,
    this.shopName,
    this.shopLogo,
    this.totalRating,
    this.averageRating,
    this.sellerType,
    this.sellerTypeName,
    this.totalProductSold,
    this.followers,
  });

  factory BestShop.fromJson(Map<String, dynamic> json) => BestShop(
    id: json["id"],
    shopName: json["shopName"],
    shopLogo: json["shopLogo"],
    totalRating: json["totalRating"],
    averageRating: json["averageRating"],
    sellerType: json["sellerType"],
    sellerTypeName: json["sellerTypeName"],
    totalProductSold: json["totalProductSold"],
    followers: json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shopName": shopName,
    "shopLogo": shopLogo,
    "totalRating": totalRating,
    "averageRating": averageRating,
    "sellerType": sellerType,
    "sellerTypeName": sellerTypeName,
    "totalProductSold": totalProductSold,
    "followers": followers,
  };
}

class PageInfo {
  int? totalCount;
  int? rowsPerPage;
  int? currentPage;
  int? totalPageCount;
  bool? hasNextPage;

  PageInfo({
    this.totalCount,
    this.rowsPerPage,
    this.currentPage,
    this.totalPageCount,
    this.hasNextPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalCount: json["totalCount"],
    rowsPerPage: json["rowsPerPage"],
    currentPage: json["currentPage"],
    totalPageCount: json["totalPageCount"],
    hasNextPage: json["hasNextPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalCount": totalCount,
    "rowsPerPage": rowsPerPage,
    "currentPage": currentPage,
    "totalPageCount": totalPageCount,
    "hasNextPage": hasNextPage,
  };
}
