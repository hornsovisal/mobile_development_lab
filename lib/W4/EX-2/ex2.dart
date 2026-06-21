import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.iconData,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });
  final String label;
  final Icon iconData;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  Color get buttonColor {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  Widget get getIconPosition {
    if (iconPosition == IconPosition.left) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            //padding icon to the right
            padding: EdgeInsets.all(10),
            child: iconData,
          ),
          Text(label),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            //padding icon to the right
            padding: EdgeInsets.all(10),
            child: Text(label),
          ),
          iconData,
        ],
      );
    }
  }

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
              color: buttonColor,
            ),
            child: Center(
              //Layout Icon , Text in row
              child: getIconPosition,
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
              CustomButton(
                label: "Visal",
                iconData: Icon(Icons.person),
                buttonType: ButtonType.secondary,
              ),
              CustomButton(
                label: "Visal",
                iconData: Icon(Icons.person),
                iconPosition: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
