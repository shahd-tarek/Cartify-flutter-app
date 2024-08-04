import 'package:flutter/material.dart';
import 'package:hello/dio/api_provider.dart';
import 'package:hello/models/cartproducts_model.dart'; 

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartProducts? _cartProducts;
  bool _isLoading = true;

  final ApiProvider _apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    _fetchCart();
  }

  Future<void> _fetchCart() async {
    try {
      final cartProducts = await _apiProvider.fetchCartProducts();
      setState(() {
        _cartProducts = cartProducts;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching cart: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff66A4E2),
        title: const Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cartProducts?.carts?.length ?? 0,
              itemBuilder: (context, index) {
                final cart = _cartProducts?.carts?[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      'Cart ${cart?.id ?? 'N/A'}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Total: \$${cart?.total ?? 0.0}'),
                    trailing: Text('Items: ${cart?.totalProducts ?? 0}'),
                  ),
                );
              },
            ),
    );
  }
}