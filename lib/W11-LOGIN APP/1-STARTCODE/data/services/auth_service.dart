import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../W11-LOGIN APP/1-STARTCODE/model/user.dart';
import '../../model/auth_session.dart';
import 'package:http/http.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationService {
  static AuthenticationService instance = AuthenticationService();

  AuthSession? session;

  bool get isLoggedIn => session != null;

  Future<void> login({required String name, required String password}) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri loginUrl = baseUri.replace(path: "/login");

    // 1- Create the JSON body with the name and password
    Map<String, dynamic> body = {"name": name, "password": password};
    // 2- Fetch the POST/login
    Response response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    // 3- Decode the json
    Map<String, dynamic> json = jsonDecode(response.body);
    print("Status: ${response.statusCode}");
    print("Body: ${response.body}");

    // 4 - If failed, throw a AuthException

    if (response.statusCode != 200) {
      String error = json["error"] ?? "Unknown error";
      throw AuthException(error);
    }

    // 5 -  Get the token

    String token = response.body;

    // 5 -  Get the user
    Map<String, dynamic> userJson = json["user"];
    User user = User.fromJson(userJson);
    // 6 - Update the session
    session = AuthSession(user: user, token: token);
  }

  Future<void> logout() async {
    session = null;
  }
}

class AuthException implements Exception {
  final String message;

  AuthException(this.message);
  @override
  String toString() {
    return message;
  }
}
