// To parse this JSON data, do
//
//     final popularCategoriesResponse = popularCategoriesResponseFromJson(jsonString);

import 'dart:convert';

PopularCategoriesResponse popularCategoriesResponseFromJson(String str) =>
    PopularCategoriesResponse.fromJson(json.decode(str));

String popularCategoriesResponseToJson(PopularCategoriesResponse data) =>
    json.encode(data.toJson());

class PopularCategoriesResponse {
  String? code;
  bool? success;
  String? message;
  List<PopularCategoriesData>? data;

  PopularCategoriesResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory PopularCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      PopularCategoriesResponse(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PopularCategoriesData>.from(
                json["data"]!.map((x) => PopularCategoriesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PopularCategoriesData {
  int? id;
  int? parentId;
  String? name;
  String? icon;
  String? banner;
  String? slug;
  String? tags;
  int? productCount;

  PopularCategoriesData({
    this.id,
    this.parentId,
    this.name,
    this.icon,
    this.banner,
    this.slug,
    this.tags,
    this.productCount,
  });

  factory PopularCategoriesData.fromJson(Map<String, dynamic> json) =>
      PopularCategoriesData(
        id: json["id"],
        parentId: json["parentId"],
        name: json["name"],
        icon: json["icon"],
        banner: json["banner"],
        slug: json["slug"],
        tags: json["tags"],
        productCount: json["product_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "name": name,
        "icon": icon,
        "banner": banner,
        "slug": slug,
        "tags": tags,
        "product_count": productCount,
      };
}
