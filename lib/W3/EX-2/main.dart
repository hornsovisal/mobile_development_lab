import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      //Outer Box
      home: Container(
        //Margine = Outter Space , Padding = Inner Space
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(20),
        //color of box
        color: Colors.blue[300],

        //Container Inner Box
        child: Container(
          //set color rand radius of box
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[600],
          ),

          //text in inner box
          child: Center(
            child: Text(
              "CADT STUDENT",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
// Answer:
// In this exercise, we do not use the Scaffold widget because we only need
// to create a box layout.

// The purpose of the Scaffold widget is to provide the structure
// of a Material app screen, such as:
// - AppBar
// - Body
// - Drawer
