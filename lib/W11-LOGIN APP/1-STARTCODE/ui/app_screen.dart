import 'package:flutter/material.dart';

import '../data/services/auth_service.dart';
import 'auth_screen.dart';
import 'scores_screen.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  void onLogin() {
    setState(() {});
  }

  Widget get content {
    final bool user = AuthenticationService.instance.isLoggedIn;

    print("AppScreen: isLoggedIn = $user");

    if (user) {
      return ScoresScreen();
    }

    return AuthScreen(onLogin: onLogin);
  }

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
