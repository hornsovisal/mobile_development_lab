import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_development_lab/FINAL-FOODIEReview/model/food_model.dart';

class FoodRepository {
  final String baseUrl = "http://localhost:3000/foods";

  // Read: Fetch data with a Future
  Future<List<FoodItem>> fetchMenu() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map<FoodItem>((item) => FoodItem.fromJson(item)).toList();
      } else {
        throw Exception("Server returned error code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(
        "Failed to connect to network perimeter perimeter server.",
      );
    }
  }

  //Update item
  Future<bool> toggleAvailability(String id, bool status) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'isAvailable': status}),
    );
    return response.statusCode == 200;
  }

  //Create ITEM

  Future<bool> addReview(String foodId, String reviewText) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$foodId/reviews'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"review": reviewText}),
    );

    return response.statusCode == 201;
  }
}
