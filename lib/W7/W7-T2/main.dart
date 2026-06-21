import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController titleController = TextEditingController();
  void onPressed() {
    print(titleController.text);
  }

  @override
  void dispose() {
    super.dispose();
    // when the view close, dispose the controler
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DEMO TEXTFIELD")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(label: Text("Enter title")),
              ),

              SizedBox(height: 40),
              ElevatedButton(onPressed: onPressed, child: Text("SUBMIT")),
            ],
          ),
        ),
      ),
    );
  }
}