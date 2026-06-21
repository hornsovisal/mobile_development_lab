import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool selected = false;

  String get buttonText {
    if (selected) {
      return "Selected";
    }
    return "Not selected";
  }

  Color get textColor {
    if (selected) {
      return Colors.white;
    }
    return Colors.black;
  }

  Color get backgroundColor {
    if (selected) {
      return Colors.blue[500]!;
    }
    return Colors.blue[50]!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            if (selected) {
              selected = false;
            } else {
              selected = true;
            }
          }),
        },
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(
          child: Text(buttonText, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            CustomButton(),
            CustomButton(),
            CustomButton(),
            CustomButton(),
          ],
        ),
      ),
    ),
  ),
);
