// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/data/mock_grocery_data.dart';
import 'package:mobile_development_lab/W7/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

class GrecoryForm extends StatefulWidget {
  final void Function(GroceryItem item) addItem;

  const GrecoryForm({super.key, required this.addItem});

  @override
  State<GrecoryForm> createState() => _GrecoryFormState();
}

class _GrecoryFormState extends State<GrecoryForm> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.turn_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: inputDecoration.copyWith(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: inputDecoration.copyWith(labelText: 'Quantity'),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    //name controler
                    final name = nameController.text;
                    final quantity = int.parse(quantityController.text);
                    final id = (allGroceryItems.length + 1).toString();
                    final item = GroceryItem(
                      id: id,
                      name: name,
                      quantity: quantity,
                      category: GroceryCategory.fruit,
                    );
                    widget.addItem(item);
                  },
                  child: const Text('Add Item'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
