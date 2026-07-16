import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  Uri loginUri = Uri.parse("http://localhost:3000/login");

  Map<String, dynamic> body = {"username": "john", "password": "1234"};

  Response response = await http.post(
    loginUri,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(body),
  );

  Map<String, dynamic> json = jsonDecode(response.body);

  if (response.statusCode == 200) {
    //   Get the token
    String token = json["token"];
    print("Token retrieved : \n $token");
  } else {
    //   Get the error
    String error = json["error"];
    print("Error : \n $error");
  }
}
