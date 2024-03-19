

import 'dart:convert';

import 'product.dart';

MostPopularProductsResponse mostPopularProductsResponseFromJson(String str) =>
    MostPopularProductsResponse.fromJson(json.decode(str));

String mostPopularProductsResponseToJson(MostPopularProductsResponse data) =>
    json.encode(data.toJson());

class MostPopularProductsResponse {
  final String? code;
  final bool? success;
  final String? message;
  final List<MostPopularType>? types;

  MostPopularProductsResponse({
    this.code,
    this.success,
    this.message,
    this.types,
  });

  factory MostPopularProductsResponse.fromJson(Map<String, dynamic> json) =>
      MostPopularProductsResponse(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        types: json["data"] == null
            ? []
            : List<MostPopularType>.from(json["data"]!.map((x) => MostPopularType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": types == null ? [] : List<dynamic>.from(types!.map((x) => x.toJson())),
      };
}

class MostPopularType {
  final String? categoryName;
  final List<Product>? products;

  MostPopularType({
    this.categoryName,
    this.products,
  });

  factory MostPopularType.fromJson(Map<String, dynamic> json) => MostPopularType(
        categoryName: json["categoryName"],
        products: json["products"] == null
            ? []
            : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryName": categoryName,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
