import 'package:flutter/material.dart';
import 'package:hello/dio/api_provider.dart';
import 'package:hello/productList_screen.dart';
import 'categoryImage.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<String> _categories = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final categories = await fetchCategoryList();
    setState(() {
      _categories = categories;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF3F3F3),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Hi",
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.notification_add_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Container(
              height: 50,
              width: 380,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 226, 222, 222),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 8),
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text("search",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      String category = _categories[index];
                      String imageUrl =
                          categoryImages[category] ?? "images/beauty.png";

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductListScreen(category: category),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFFBCDEFF),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                imageUrl,
                                fit: BoxFit.contain,
                                width: 80,
                                height: 80,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
