import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../model/auth_session.dart';
import '../../model/score.dart';
import '../services/auth_service.dart';

class ScoresRepository {
  static ScoresRepository instance = ScoresRepository();

  Future<List<Score>> getSCores(String accessToken) async {
    final Uri baseUri = Uri.parse("http://localhost:3000");
    final Uri scoresUri = baseUri.replace(path: "/scores");

    AuthSession? session = AuthenticationService.instance.session;
    if (session == null) {
      throw Exception("Cannot do without authentication");
    }

    final response = await http.get(
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      scoresUri,
    );
    //  If statusCode 200, decode the json body
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      // Convert the json to the lost of scores

      return jsonList.map((json) => Score.fromJSon(json)).toList();
    } else {
      throw Exception('Failed to load scores: ${response.statusCode}');
    }
  }
}
