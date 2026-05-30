import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: "the Best Object Language",
    image: "assets/ex3/dart.png",
  ),

  flutter(
    title: "Flutter",
    description: "the best mobile widget library",
    image: "assets/ex3/flutter.png",
  ),

  firebase(
    title: "Firebase",
    description: "the best cloud database",
    image: "assets/ex3/firebase.png",
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(product.image, height: 120),

                    SizedBox(height: 16),

                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Product", style: TextStyle(fontSize: 20)),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}
