import 'package:flutter/material.dart';
import 'package:mobile_development_lab/FINAL-FOODIEReview/model/food_model.dart';
import 'package:mobile_development_lab/FINAL-FOODIEReview/repositories/food_repo.dart';
import 'package:mobile_development_lab/FINAL-FOODIEReview/widgets/food_tile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final FoodRepository repository = FoodRepository();
  late Future<List<FoodItem>> _menuFuture;

  @override
  void initState() {
    super.initState();
    _loadMenu();
  }

  void _loadMenu() {
    setState(() {
      _menuFuture = repository.fetchMenu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodieReview Restaurant Menu"),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadMenu),
        ],
      ),

      body: FutureBuilder<List<FoodItem>>(
        future: _menuFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error Code: NO CONNECTIVITY\n${snapshot.error}"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No items available today."));
          }
            final menuItem = snapshot.data!;

            return ListView.builder(
              itemCount: menuItem.length,
              itemBuilder: (context,index) {
                final item = menuItem[index];
                return FoodTile(food: item, onTap: () async {
                  //Handle Navigation
                  final updated = await Navigator.push(context,MaterialPageRoute(builder: (ctx) => DetailScreen(food: item)));
                  if (updated == true) {
                    _loadMenu(); // Trigger state update if values altered inside nested routes
                  }
                });
              }
            )
        },
      ),
    );
  }
}
