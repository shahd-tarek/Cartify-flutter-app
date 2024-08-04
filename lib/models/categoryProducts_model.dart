// To parse this JSON data, do
//
//     final categoryProducts = categoryProductsFromJson(jsonString);

import 'dart:convert';

CategoryProducts categoryProductsFromJson(String str) => CategoryProducts.fromJson(json.decode(str));

String categoryProductsToJson(CategoryProducts data) => json.encode(data.toJson());

class CategoryProducts {
    final List<Product>? products;
    final int? total;
    final int? skip;
    final int? limit;

    CategoryProducts({
        this.products,
        this.total,
        this.skip,
        this.limit,
    });

    factory CategoryProducts.fromJson(Map<String, dynamic> json) => CategoryProducts(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "thumbnail": thumbnail,
      };
}

enum AvailabilityStatus {
    IN_STOCK,
    OUT_OF_STOCK
}

final availabilityStatusValues = EnumValues({
    "In Stock": AvailabilityStatus.IN_STOCK,
    "Out of Stock": AvailabilityStatus.OUT_OF_STOCK
});

enum Category {
    SMARTPHONES
}

final categoryValues = EnumValues({
    "smartphones": Category.SMARTPHONES
});

class Dimensions {
    final double? width;
    final double? height;
    final double? depth;

    Dimensions({
        this.width,
        this.height,
        this.depth,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
    };
}

class Meta {
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? barcode;
    final String? qrCode;

    Meta({
        this.createdAt,
        this.updatedAt,
        this.barcode,
        this.qrCode,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
    };
}

class Review {
    final int? rating;
    final String? comment;
    final DateTime? date;
    final String? reviewerName;
    final String? reviewerEmail;

    Review({
        this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
