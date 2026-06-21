import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W6/EXERCISE-3/ui/screens/end_screen.dart';
import 'package:mobile_development_lab/W6/EXERCISE-3/ui/screens/temperature_screen.dart';
import 'package:mobile_development_lab/W6/EXERCISE-3/ui/screens/welcome_screen.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

enum ScreenType { welcome, converter, bybye }

class _TemperatureAppState extends State<TemperatureApp> {
  ScreenType currentScreen = ScreenType.welcome;

  void goToWelcome() {
    setState(() {
      currentScreen = ScreenType.welcome;
    });
  }

  void goToConverter() {
    setState(() {
      currentScreen = ScreenType.converter;
    });
  }

  void goToBybye() {
    setState(() {
      currentScreen = ScreenType.bybye;
    });
  }

  Widget getContent() {
    switch (currentScreen) {
      case ScreenType.welcome:
        return WelcomeScreen(onNext: goToConverter);

      case ScreenType.converter:
        return TemparatureScreen(onNext: goToBybye);

      case ScreenType.bybye:
        return ByeByeScreen();
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: getContent(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
