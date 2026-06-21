import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  final String title;
  final Icon icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
            ),
            child: Center(
              //Layout Icon , Text in row
              child: Row(
                children: [
                  Padding(
                    //padding icon to the right
                    padding: EdgeInsetsGeometry.all(10),
                    child: icon,
                  ),
                  Text(title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              //1 card
              HobbyCard(
                title: "Class",
                icon: Icon(Icons.class_outlined),
                backgroundColor: Colors.green,
              ),

              HobbyCard(
                title: "Class",
                icon: Icon(Icons.class_outlined),
                backgroundColor: Colors.blue,
              ),

              HobbyCard(
                title: "Class",
                icon: Icon(Icons.class_outlined),
                backgroundColor: Colors.yellowAccent,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
