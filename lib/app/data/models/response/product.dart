// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int? id;
  final String? name;
  final List<String>? images;
  final String? thumbnail;
  final String? videoUrl;
  final int? discountAmt;
  final int? discountPercentage;
  final List<String>? tags;
  final String? slug;
  final bool? showStockQuantity;
  final bool? showTextOnly;
  final int? statusId;
  final int? productVariantId;
  final int? price;
  final int? currentStockQty;
  final bool? isVariantAvailable;
  final int? ratings;
  final int? totalRating;
  final bool? isBestSeller;
  final int? numberOfOrder;
  final int? homePageCategoryId;

  Product({
    this.id,
    this.name,
    this.images,
    this.thumbnail,
    this.videoUrl,
    this.discountAmt,
    this.discountPercentage,
    this.tags,
    this.slug,
    this.showStockQuantity,
    this.showTextOnly,
    this.statusId,
    this.productVariantId,
    this.price,
    this.currentStockQty,
    this.isVariantAvailable,
    this.ratings,
    this.totalRating,
    this.isBestSeller,
    this.numberOfOrder,
    this.homePageCategoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        thumbnail: json["thumbnail"],
        videoUrl: json["VideoUrl"],
        discountAmt: json["discountAmt"],
        discountPercentage: json["discountPercentage"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        slug: json["slug"],
        showStockQuantity: json["showStockQuantity"],
        showTextOnly: json["showTextOnly"],
        statusId: json["statusId"],
        productVariantId: json["productVariantId"],
        price: json["price"],
        currentStockQty: json["currentStockQty"],
        isVariantAvailable: json["isVariantAvailable"],
        ratings: json["ratings"],
        totalRating: json["totalRating"],
        isBestSeller: json["isBestSeller"],
        numberOfOrder: json["numberOfOrder"],
        homePageCategoryId: json["homePageCategoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail,
        "VideoUrl": videoUrl,
        "discountAmt": discountAmt,
        "discountPercentage": discountPercentage,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "slug": slug,
        "showStockQuantity": showStockQuantity,
        "showTextOnly": showTextOnly,
        "statusId": statusId,
        "productVariantId": productVariantId,
        "price": price,
        "currentStockQty": currentStockQty,
        "isVariantAvailable": isVariantAvailable,
        "ratings": ratings,
        "totalRating": totalRating,
        "isBestSeller": isBestSeller,
        "numberOfOrder": numberOfOrder,
        "homePageCategoryId": homePageCategoryId,
      };

  Product copyWith({
    int? id,
    String? name,
    List<String>? images,
    String? thumbnail,
    String? videoUrl,
    int? discountAmt,
    int? discountPercentage,
    List<String>? tags,
    String? slug,
    bool? showStockQuantity,
    bool? showTextOnly,
    int? statusId,
    int? productVariantId,
    int? price,
    int? currentStockQty,
    bool? isVariantAvailable,
    int? ratings,
    int? totalRating,
    bool? isBestSeller,
    int? numberOfOrder,
    int? homePageCategoryId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
      videoUrl: videoUrl ?? this.videoUrl,
      discountAmt: discountAmt ?? this.discountAmt,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      tags: tags ?? this.tags,
      slug: slug ?? this.slug,
      showStockQuantity: showStockQuantity ?? this.showStockQuantity,
      showTextOnly: showTextOnly ?? this.showTextOnly,
      statusId: statusId ?? this.statusId,
      productVariantId: productVariantId ?? this.productVariantId,
      price: price ?? this.price,
      currentStockQty: currentStockQty ?? this.currentStockQty,
      isVariantAvailable: isVariantAvailable ?? this.isVariantAvailable,
      ratings: ratings ?? this.ratings,
      totalRating: totalRating ?? this.totalRating,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      numberOfOrder: numberOfOrder ?? this.numberOfOrder,
      homePageCategoryId: homePageCategoryId ?? this.homePageCategoryId,
    );
  }
}
