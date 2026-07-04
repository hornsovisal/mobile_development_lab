import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
  // 1- Get the request response
  Response response = await http.get(url);

  // 2- Check the responsae status
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch products (HTTP ${response.statusCode})');
  }

  // 3- Parse the response
  Map<String, dynamic> json = jsonDecode(response.body);

  User user = User.fromJson(json);

  print(user);
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Map<String, dynamic> address;
  final String phone;
  final String website;
  final Map<String, dynamic> company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  static User fromJson(Map<String, dynamic> json) {
    //key of our json file
    const String idKey = 'id';
    const String nameKey = 'name';
    const String usernameKey = 'username';
    const String emailKey = 'email';
    const String addressKey = 'address';
    const String phoneKey = 'phone';
    const String websiteKey = 'website';
    const String companyKey = 'company';

    //assertion to make sure it right data struct
    assert(json[idKey] is int);
    assert(json[nameKey] is String);
    assert(json[usernameKey] is String);
    assert(json[emailKey] is String);
    assert(json[addressKey] is Map<String, dynamic>);
    assert(json[phoneKey] is String);
    assert(json[websiteKey] is String);
    assert(json[companyKey] is Map<String, dynamic>);

    int id = json[idKey];
    String name = json[nameKey];
    String username = json[usernameKey];
    String email = json[emailKey];
    Map<String, dynamic> address = json[addressKey];
    String phone = json[phoneKey];
    String website = json[websiteKey];
    Map<String, dynamic> company = json[companyKey];

    return User(
      id: id,
      name: name,
      username: username,
      email: email,
      address: address,
      phone: phone,
      website: website,
      company: company,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, username: $username, email: $email, phone: $phone, address: $address, website: $website)';
  }
}
