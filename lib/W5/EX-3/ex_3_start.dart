import 'package:flutter/material.dart';

class ImageApp extends StatefulWidget {
  const ImageApp({super.key});

  @override
  State<ImageApp> createState() => _ImageAppState();
}

class _ImageAppState extends State<ImageApp> {
  List<String> images = [
    "assets/w4-s2/bird.jpg",
    "assets/w4-s2/bird2.jpg",
    "assets/w4-s2/insect.jpg",
    "assets/w4-s2/girl.jpg",
    "assets/w4-s2/man.jpg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => {
              setState(() {
                currentIndex = currentIndex - 1;
                if (currentIndex < 0) {
                  currentIndex = images.length - 1;
                }
              }),
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => {
                setState(() {
                  currentIndex = currentIndex + 1;
                  if (currentIndex == images.length) {
                    currentIndex = 0;
                  }
                }),
              },
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, //to not show the debug in the left /
      home: ImageApp(),
    ),
  );
}
