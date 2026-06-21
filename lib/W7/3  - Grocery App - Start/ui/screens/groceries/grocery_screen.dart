import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_form.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/ui/screens/groceries/grocery_tile.dart';
import '../../../data/mock_grocery_data.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  void addItem(GroceryItem item) {
    setState(() {
      allGroceryItems.add(item);
    });
  }

  void onCreate() {
    showModalBottomSheet(
      context: context,
      builder: (context) => GrecoryForm(onCreated: addItem),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: allGroceryItems.length,
        itemBuilder: (context, index) {
          final item = allGroceryItems[index];
          return GroceryTile(groceryItem: item);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
