import 'package:flutter/material.dart';

import '../../../models/todo.dart';
import '../../theme/app_screen.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo, required this.onTap});

  final Todo todo;
  final ValueChanged<Todo> onTap;

  // If completed => line through
  // If not completed => normal text
  TextDecoration? get textDecoration {
    if (todo.completed) {
      return TextDecoration.lineThrough;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(todo),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: AppTheme.yellowColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CheckBox(checked: todo.completed),
                const SizedBox(width: 10),
                Text(
                  todo.title,
                  style: AppTheme.paragraph.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBox extends StatelessWidget {
  const CheckBox({super.key, required this.checked});

  final bool checked;

  // If checked => no border
  // If not checked => show border
  BoxBorder? get border {
    if (checked) {
      return null;
    }

    return Border.all(width: 2, color: AppTheme.greenColor);
  }

  // If checked => green background
  // If not checked => transparent background
  Color? get backgroundColor {
    if (checked) {
      return AppTheme.greenColor;
    }

    return Colors.transparent;
  }

  // If checked => show check icon
  // If not checked => show nothing
  Widget? get innerIcon {
    if (checked) {
      return const Icon(Icons.check, color: Colors.white);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: innerIcon,
    );
  }
}
