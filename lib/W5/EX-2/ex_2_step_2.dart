import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key, this.isFavorite = false});
  final bool isFavorite;
  Color get iconColor {
    if (isFavorite) {
      return Colors.red;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("description"),
              ],
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: iconColor),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Favorite cards")),
        body: Column(
          children: const [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
          ],
        ),
      ),
    ),
  );
}
