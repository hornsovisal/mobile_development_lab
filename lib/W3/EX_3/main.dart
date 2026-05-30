import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            //box 1
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //box 2
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[300],
              ),
              child: Center(
                child: Text(
                  "DART",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //box 3
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[300]!, Colors.blue[900]!],
                ),
              ),
              child: Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
