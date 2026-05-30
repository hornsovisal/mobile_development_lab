import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   const MyButton({super.key, required this.label, required this.background});

//   final String label;
//   final Color background;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: background,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Center(
//         child: Text(label, style: TextStyle(color: Colors.white, fontSize: 40)),
//       ),
//     );
//   }

class GradiantButton extends StatelessWidget {
  const GradiantButton({
    super.key,
    required this.label,
    required this.start,
    required this.end,

    required this.height,
    required this.width,
  });

  final String label;
  final Color start;
  final Color end;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: height,
      width: width,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [start, end])),
      child: Center(
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            GradiantButton(
              label: "Visal",
              start: Colors.blue,
              end: Colors.red,
              height: 50,
              width: 500,
            ),

            GradiantButton(
              label: "Visal G1",
              start: Colors.red,
              end: Colors.yellow,
              height: 50,
              width: 500,
            ),
          ],
        ),
      ),
    ),
  );
}
