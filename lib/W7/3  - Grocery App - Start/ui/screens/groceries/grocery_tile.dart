import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

class GroceryTile extends StatelessWidget {
  final GroceryItem groceryItem;

  const GroceryTile({super.key, required this.groceryItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 20,
        height: 20,
        color: groceryItem.category.color,
      ),
      title: Text(groceryItem.name),
      subtitle: Text('Quantity: ${groceryItem.quantity}'),
    );
  }
}
