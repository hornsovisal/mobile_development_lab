import 'package:flutter/material.dart';

import '../data/services/auth_service.dart';
import 'theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String? errorMessage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // The password shall be strong (6 characters, 2 upper cases, 2 special characters)
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onLoginPressed() async {
    try {
      final name = nameController.text.trim();
      final password = passwordController.text;

      if (name.isEmpty || password.isEmpty) {
        throw AuthException("Name and password fields cannot be empty.");
      }

      await AuthenticationService.instance.login(
        name: name,
        password: password,
      );
      setState(() {
        errorMessage = null;
      });

      // Notify parent to swap to ScoresScreen
      widget.onLogin();
    } on AuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    } catch (e) {
      print("FATAL ERROR: $e");
      setState(() {
        errorMessage = "System Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            const SizedBox(height: 20),

            // Login image
            Image.asset("assets/auth/login.jpg", height: 250),

            const SizedBox(height: 40),

            // Username
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            // Password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 30),

            // Login button
            GestureDetector(
              onTap: onLoginPressed,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text("LOGIN", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),

            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
