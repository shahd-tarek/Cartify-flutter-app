import 'package:flutter/material.dart';
import 'package:hello/about_screen.dart';
import 'package:hello/cart_screen.dart';
import 'package:hello/first_screen.dart';
import 'package:hello/profilepage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List pages = [
    const FirstScreen(),
    const CartScreen(),
    const AboutScreen(),
    const ProfilepageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: const Color(0xff66A4E2),
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                  color: Color(0xff66A4E2),
                )),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
              label: "Cart",
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Color(0xff66A4E2),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                color: Colors.grey,
              ),
              label: "About",
              activeIcon: Icon(
                Icons.info_outline,
                color: Color(0xff66A4E2),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                label: "Profile",
                activeIcon: Icon(
                  Icons.person,
                  color: Color(0xff66A4E2),
                )),
          ]),
    );
  }
}
