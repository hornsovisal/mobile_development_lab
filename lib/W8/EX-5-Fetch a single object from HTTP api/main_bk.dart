import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri url = Uri.parse('https://fooapi.com/api/products');

  // 1- Get the request response
  Response response = await http.get(url);

  // 2- Check the responsae status
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
  }

  // 3- Parse the response
  Map<String, dynamic> json = jsonDecode(response.body);
  List<dynamic> jsonItems = json["data"];

  Map<String, dynamic> jsonItem = jsonItems[0];

  Product product = Product.fromJson(jsonItem);
  print(product);
}

class Product {
  final String title;
  final double price;

  Product({required this.title, required this.price});

  static Product fromJson(Map<String, dynamic> json) {
    const String titleKey = 'title';
    const String priceKey = 'price';

    assert(json[titleKey] is String);
    assert(json[priceKey] is double);

    String title = json[titleKey];
    double price = json[priceKey];
 
    return Product(title: title, price: price);
  }

  @override
  String toString() {
    return "Product $title - price= $price";
  }
}
