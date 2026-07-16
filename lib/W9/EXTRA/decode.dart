import 'package:jwt_decoder/jwt_decoder.dart';

void main() {
  var token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpvaG4iLCJyb2xlIjoic3R1ZGVudCIsImlhdCI6MTg4MzQxNTEyNywiZXhwIjoxODgzNDE4NzI3fQ.RzajF1CF2CPDyi_DrW8raamnULaOnh4BqSm_YIir0Lg";

  Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

  // print(decodedToken);

  var exp = DateTime.fromMillisecondsSinceEpoch(decodedToken['exp'] * 1000);

  print("User: ${decodedToken["username"]} (role ${decodedToken["role"]})");
  print("Expiration Date: $exp");
  print("Token: $token");
}
