// To parse this JSON data, do
//
//     final activePageSettingDataResponse = activePageSettingDataResponseFromJson(jsonString);

import 'dart:convert';

BannerDataResponse activePageSettingDataResponseFromJson(
        String str) =>
    BannerDataResponse.fromJson(json.decode(str));

String activePageSettingDataResponseToJson(
        BannerDataResponse data) =>
    json.encode(data.toJson());

class BannerDataResponse {
  String? code;
  bool? success;
  String? message;
  BannerData? data;

  BannerDataResponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory BannerDataResponse.fromJson(Map<String, dynamic> json) =>
      BannerDataResponse(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : BannerData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class BannerData {
  List<HomePageBanner>? homePageBanner;
  List<HomePageBanner>? homePageBanner2;
  List<HomePageBanner>? homePageTopBanner;
  List<HomePageBanner>? slider;

  BannerData({
    this.homePageBanner,
    this.homePageBanner2,
    this.homePageTopBanner,
    this.slider,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        homePageBanner: json["HomePageBanner"] == null
            ? []
            : List<HomePageBanner>.from(
                json["HomePageBanner"]!.map((x) => HomePageBanner.fromJson(x))),
        homePageBanner2: json["HomePageBanner-2"] == null
            ? []
            : List<HomePageBanner>.from(json["HomePageBanner-2"]!
                .map((x) => HomePageBanner.fromJson(x))),
        homePageTopBanner: json["HomePageTopBanner"] == null
            ? []
            : List<HomePageBanner>.from(json["HomePageTopBanner"]!
                .map((x) => HomePageBanner.fromJson(x))),
        slider: json["Slider"] == null
            ? []
            : List<HomePageBanner>.from(
                json["Slider"]!.map((x) => HomePageBanner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "HomePageBanner": homePageBanner == null
            ? []
            : List<dynamic>.from(homePageBanner!.map((x) => x.toJson())),
        "HomePageBanner-2": homePageBanner2 == null
            ? []
            : List<dynamic>.from(homePageBanner2!.map((x) => x.toJson())),
        "HomePageTopBanner": homePageTopBanner == null
            ? []
            : List<dynamic>.from(homePageTopBanner!.map((x) => x.toJson())),
        "Slider": slider == null
            ? []
            : List<dynamic>.from(slider!.map((x) => x.toJson())),
      };
}

class HomePageBanner {
  int? id;
  String? typeName;
  String? value1;
  String? value2;
  String? link;
  String? lang;
  int? sortOrder;
  int? statusId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imagePath;
  String? imagePathApp;

  HomePageBanner({
    this.id,
    this.typeName,
    this.value1,
    this.value2,
    this.link,
    this.lang,
    this.sortOrder,
    this.statusId,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.imagePathApp,
  });

  factory HomePageBanner.fromJson(Map<String, dynamic> json) => HomePageBanner(
        id: json["id"],
        typeName: json["typeName"],
        value1: json["value1"],
        value2: json["value2"],
        link: json["link"],
        lang: json["lang"],
        sortOrder: json["sortOrder"],
        statusId: json["statusId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        imagePath: json["imagePath"],
        imagePathApp: json["imagePathApp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "typeName": typeName,
        "value1": value1,
        "value2": value2,
        "link": link,
        "lang": lang,
        "sortOrder": sortOrder,
        "statusId": statusId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "imagePath": imagePath,
        "imagePathApp": imagePathApp,
      };
}
