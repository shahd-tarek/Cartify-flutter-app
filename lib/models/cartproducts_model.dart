// To parse this JSON data, do
//
//     final cartProducts = cartProductsFromJson(jsonString);

import 'dart:convert';

CartProducts cartProductsFromJson(String str) => CartProducts.fromJson(json.decode(str));

String cartProductsToJson(CartProducts data) => json.encode(data.toJson());

class CartProducts {
    final List<Cart>? carts;
    final int? total;
    final int? skip;
    final int? limit;

    CartProducts({
        this.carts,
        this.total,
        this.skip,
        this.limit,
    });

    factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
        carts: json["carts"] == null ? [] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "carts": carts == null ? [] : List<dynamic>.from(carts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Cart {
    final int? id;
    final List<Products>? products;
    final double? total;
    final double? discountedTotal;
    final int? userId;
    final int? totalProducts;
    final int? totalQuantity;

    Cart({
        this.id,
        this.products,
        this.total,
        this.discountedTotal,
        this.userId,
        this.totalProducts,
        this.totalQuantity,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        products: json["products"] == null ? [] : List<Products>.from(json["products"]!.map((x) => Products.fromJson(x))),
        total: json["total"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
    };
}

class Products {
    final int? id;
    final String? title;
    final double? price;
    final int? quantity;
    final double? total;
    final double? discountPercentage;
    final double? discountedTotal;
    final String? thumbnail;

    Products({
        this.id,
        this.title,
        this.price,
        this.quantity,
        this.total,
        this.discountPercentage,
        this.discountedTotal,
        this.thumbnail,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedTotal": discountedTotal,
        "thumbnail": thumbnail,
    };
}