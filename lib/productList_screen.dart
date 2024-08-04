import 'package:flutter/material.dart';
import 'package:hello/models/categoryProducts_model.dart';
import 'dio/api_provider.dart';

class ProductListScreen extends StatefulWidget {
  final String category;

  const ProductListScreen({super.key, required this.category});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  CategoryProducts? _categoryProducts;
  bool _isLoading = true;

  final ApiProvider _apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final categoryProducts = await fetchProductsByCategory(widget.category);
    setState(() {
      _categoryProducts = categoryProducts;
      _isLoading = false;
    });
  }

  void _addToCart(int productId) async {
    await _apiProvider.addToCart(productId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff66A4E2),
        title: Text(widget.category,
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _categoryProducts?.products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = _categoryProducts?.products?[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      product?.title ?? 'No Title',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('\$${product?.price ?? 0.0}'),
                    leading: product?.thumbnail != null
                        ? Image.network(
                            product!.thumbnail!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : const SizedBox(),
                    trailing: IconButton(
                      icon: const Icon(Icons.shopping_cart,
                          color: Color.fromARGB(255, 196, 101, 101)),
                      onPressed: () {
                        if (product != null && product.id != null) {
                          _addToCart(product.id!);
                        }
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
