import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hello/models/cartProducts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class CartModel with ChangeNotifier {
  final List<Products> _cartItems = [];
  List<Products> get cartItems => _cartItems;

  void addProduct(Products product) async {
    try {
      _cartItems.add(product);
     notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userToken = prefs.getString('userToken');
      if (userToken == null) {
        print('Error adding product to cart: User token not found.');
        return;
      }

      Map<String, dynamic> data = {
        "products": [
          {
            "id": product.id,
            "quantity": product.quantity
          }
        ]
      };

      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $userToken";
      Response response = await dio.post(
        'https://dummyjson.com/carts',
        data: data,
      );

      if (response.statusCode == 200) {
        _cartItems.add(product);
        notifyListeners();
      } else {
        print('Error adding product to cart: ${response.data}');
      }
    } catch (e) {
      print('Error adding product to cart: $e');
    }
  }
}



