import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About Us",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff66A4E2),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Development Team",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "We are a passionate team of developers committed to creating high-quality mobile applications. Our team consists of:\n"
                "1. Shahd Tarek - Flutter Developer\n",
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "About the App",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Our app is designed to provide an easy and intuitive shopping experience. You can browse products by categories, view detailed product information, and manage your favorite items. We strive to offer the best user experience with a clean and modern design.\n",
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                "Version",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Version 1.0.0",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 16),
              Text(
                "Contact Us",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "For any inquiries or support, please contact us at:\n"
                "Email: shahdT321@gmail.com\n"
                "Phone: +201146938444",
                style: TextStyle(fontSize: 20, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
