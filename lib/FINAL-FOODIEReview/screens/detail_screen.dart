import 'package:flutter/material.dart';
import '../food_model.dart';
import '../food_repository.dart';

class DetailScreen extends StatefulWidget {
  final FoodItem food;
  const DetailScreen({super.key, required this.food});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final FoodRepository _repository = FoodRepository();
  final TextEditingController _reviewController = TextEditingController();
  bool _isSending = false;

  void _toggleStock(bool newStatus) async {
    bool success = await _repository.toggleAvailability(
      widget.food.id,
      newStatus,
    );
    if (success) {
      setState(() {
        widget.food.isAvailable = newStatus;
      });
    }
  }

  void _submitReview() async {
    if (_reviewController.text.trim().isEmpty) return;

    setState(() {
      _isSending = true;
    });

    bool success = await _repository.addReview(
      widget.food.id,
      _reviewController.text.trim(),
    );

    setState(() {
      _isSending = false;
    });

    if (success) {
      setState(() {
        widget.food.reviews.add(_reviewController.text.trim());
        _reviewController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Review uploaded successfully!")),
      );
    }
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(
            context,
            true,
          ), // Return true using pop to alert changes
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.food.category.toUpperCase(),
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(widget.food.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Switch widget demonstration (UI Events and state mutations)
            Row(
              mainAxisAlignment: MainAxisAlignment.between,
              children: [
                const Text(
                  "In Stock Availability:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(value: widget.food.isAvailable, onChanged: _toggleStock),
              ],
            ),
            const Divider(),
            const Text(
              "Customer Reviews",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Render Review Items conditionally or inside expanded list builder
            Expanded(
              child: widget.food.reviews.isEmpty
                  ? const Text(
                      "No reviews yet. Be the first to express opinion!",
                    )
                  : ListView.builder(
                      itemCount: widget.food.reviews.length,
                      itemBuilder: (ctx, idx) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.food.reviews[idx]),
                        ),
                      ),
                    ),
            ),

            // Form integration row section
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _reviewController,
                    decoration: const InputDecoration(
                      hintText: "Write a quick review...",
                    ),
                  ),
                ),
                _isSending
                    ? const CircularProgressIndicator()
                    : IconButton(
                        icon: const Icon(Icons.send, color: Colors.blue),
                        onPressed: _submitReview,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
