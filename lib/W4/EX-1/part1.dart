import 'package:flutter/material.dart';

void main() {
  runApp(
    //a card
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: Center(
                  //Layout Icon , Text in row
                  child: Row(
                    children: [
                      Padding(
                        //padding icon to the right
                        padding: EdgeInsetsGeometry.all(10),
                        child: Icon(Icons.travel_explore_outlined),
                      ),
                      Text("Travelling"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
