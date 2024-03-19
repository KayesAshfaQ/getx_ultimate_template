// To parse this JSON data, do
//
//     final allCategoryListResponse = allCategoryListResponseFromJson(jsonString);

import 'dart:convert';

AllCategoryListResponse allCategoryListResponseFromJson(String str) =>
    AllCategoryListResponse.fromJson(json.decode(str));

String allCategoryListResponseToJson(AllCategoryListResponse data) =>
    json.encode(data.toJson());

class AllCategoryListResponse {
  String? code;
  bool? success;
  String? message;
  AllCategoryData? data;

  AllCategoryListResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory AllCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      AllCategoryListResponse(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : AllCategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class AllCategoryData {
  PageInfo? pageInfo;
  List<AllCategoryListItem>? items;

  AllCategoryData({
    this.pageInfo,
    this.items,
  });

  factory AllCategoryData.fromJson(Map<String, dynamic> json) => AllCategoryData(
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromJson(json["pageInfo"]),
        items: json["items"] == null
            ? []
            : List<AllCategoryListItem>.from(json["items"]!.map((x) => AllCategoryListItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class AllCategoryListItem {
  int? id;
  int? parentId;
  String? icon;
  String? banner;
  bool? level;
  int? sortId;
  String? name;
  bool? top;
  bool? featured;
  bool? digital;
  String? slug;
  String? metaTitle;
  String? metaDescription;
  String? tags;
  int? statusId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? industryId;

  AllCategoryListItem({
    this.id,
    this.parentId,
    this.icon,
    this.banner,
    this.level,
    this.sortId,
    this.name,
    this.top,
    this.featured,
    this.digital,
    this.slug,
    this.metaTitle,
    this.metaDescription,
    this.tags,
    this.statusId,
    this.createdAt,
    this.updatedAt,
    this.industryId,
  });

  factory AllCategoryListItem.fromJson(Map<String, dynamic> json) => AllCategoryListItem(
        id: json["id"],
        parentId: json["parentId"],
        icon: json["icon"],
        banner: json["banner"],
        level: json["level"],
        sortId: json["sortId"],
        name: json["name"],
        top: json["top"],
        featured: json["featured"],
        digital: json["digital"],
        slug: json["slug"],
        metaTitle: json["metaTitle"],
        metaDescription: json["metaDescription"],
        tags: json["tags"],
        statusId: json["statusId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        industryId: json["industryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parentId": parentId,
        "icon": icon,
        "banner": banner,
        "level": level,
        "sortId": sortId,
        "name": name,
        "top": top,
        "featured": featured,
        "digital": digital,
        "slug": slug,
        "metaTitle": metaTitle,
        "metaDescription": metaDescription,
        "tags": tags,
        "statusId": statusId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "industryId": industryId,
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
