import 'package:dio/dio.dart';
import 'package:hello/models/UserFirebasemodel.dart';
import 'package:hello/models/cartproducts_model.dart';
import 'package:hello/models/categoryProducts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiProvider {
  final Dio dio = Dio();
  Future userLogin({required String username, required String password}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      FormData userData =
          FormData.fromMap({"username": username, "password": password});

      Response response =
          await Dio().post("https://dummyjson.com/auth/login", data: userData);
      await prefs.setString("userToken", response.data["token"]);
      print(response.data);

      String? userToken = prefs.getString("userToken");
      print("User Token =>$userToken");
      return "Login succes";
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data["message"]);
        return e.response?.data["message"];
      }
    }
  }

  Future<void> addToCart(int productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userToken = prefs.getString("userToken");

    if (userToken == null) {
      print("User is not logged in");
      return;
    }

    try {
      final response = await dio.post(
        'https://dummyjson.com/carts',
        data: {
          "productId": productId,
          "quantity": 1,
        },
        options: Options(headers: {"Authorization": "Bearer $userToken"}),
      );
      print("Product added to cart: ${response.data}");
    } catch (e) {
      if (e is DioException) {
        print("Error adding product to cart: ${e.response?.data}");
      } else {
        print("Unexpected error: $e");
      }
    }
  }

  Future<CartProducts> fetchCartProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/carts');
      if (response.statusCode == 200) {
        return CartProducts.fromJson(response.data);
      } else {
        throw Exception('Failed to load cart products');
      }
    } catch (e) {
      print('Error fetching cart products: $e');
      throw e;
    }
  }
}

Future<List<String>> fetchCategoryList() async {
  try {
    final dio = Dio();
    final response =
        await dio.get('https://dummyjson.com/products/category-list');

    if (response.statusCode == 200) {
      return List<String>.from(response.data);
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    print(e);
    return [];
  }
}

Future<CategoryProducts> fetchProductsByCategory(String category) async {
  try {
    final dio = Dio();
    final response =
        await dio.get('https://dummyjson.com/products/category/$category');

    if (response.statusCode == 200) {
      return CategoryProducts.fromJson(response.data);
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    print(e);
    return CategoryProducts();
  }
}

UserFirebasemodel? userFirebasemodel;
Future<UserFirebasemodel?> readFirebaseUsers() async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc("")
      .get()
      .then((value) {
    print("*****");
    print(value.data());
  });
  return userFirebasemodel;
}
