import 'dart:convert';

import 'package:sl_v4/app/data/models/response/product.dart';



JustForYouProductsResponse justForYouProductsResponseFromJson(String str) =>
    JustForYouProductsResponse.fromJson(json.decode(str));

String justForYouProductsResponseToJson(JustForYouProductsResponse data) =>
    json.encode(data.toJson());

class JustForYouProductsResponse {
  final String? code;
  final bool? success;
  final String? message;
  final Data? data;

  JustForYouProductsResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory JustForYouProductsResponse.fromJson(Map<String, dynamic> json) =>
      JustForYouProductsResponse(
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
  final PageInfo? pageInfo;
  final List<Product>? items;

  Data({
    this.pageInfo,
    this.items,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
        items: json["items"] == null
            ? []
            : List<Product>.from(json["items"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo?.toJson(),
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class PageInfo {
  final int? totalCount;
  final int? rowsPerPage;
  final int? currentPage;
  final int? totalPageCount;
  final bool? hasNextPage;

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
