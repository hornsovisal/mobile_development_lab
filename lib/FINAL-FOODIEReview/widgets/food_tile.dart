import 'package:flutter/material.dart';
import '../food_model.dart';

class FoodTile extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        title: Text(
          food.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          food.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${food.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Conditional Rendering status label
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: food.isAvailable
                    ? Colors.blue.shade100
                    : Colors.red.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                food.isAvailable ? "Available" : "Sold Out",
                style: TextStyle(
                  fontSize: 10,
                  color: food.isAvailable
                      ? Colors.blue.shade900
                      : Colors.red.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
