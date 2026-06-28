import 'package:flutter/material.dart';

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(child: Text("Green Screen")),
    );
  }
}

class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Center(child: Text("Red Screen")),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(child: Text("Blue Screen")),
    );
  }
}

enum AppTabs { red, green, blue }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTabs currentTab = AppTabs.green;

  void goToRed() {
    setState(() {
      currentTab = AppTabs.red;
    });
  }

  void goToBlue() {
    setState(() {
      currentTab = AppTabs.blue;
    });
  }

  void goToGreen() {
    setState(() {
      currentTab = AppTabs.green;
    });
  }

  Widget get getTab {
    switch (currentTab) {
      case AppTabs.red:
        return const RedScreen();
      case AppTabs.green:
        return const GreenScreen();
      case AppTabs.blue:
        return const BlueScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tabs Navigation")),
      body: getTab,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: goToRed,
              icon: const Icon(Icons.home, color: Colors.red),
            ),
            IconButton(
              onPressed: goToGreen,
              icon: const Icon(Icons.home, color: Colors.green),
            ),
            IconButton(
              onPressed: goToBlue,
              icon: const Icon(Icons.home, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
