import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  Color get iconColor {
    if (isFavorite) {
      return Colors.red;
    }
    return Colors.grey;
  }

  IconData get iconType {
    if (isFavorite) {
      return Icons.favorite;
    }
    return Icons.favorite_border;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onPressed: () {
              setState(() {
                if (isFavorite) {
                  isFavorite = false;
                } else {
                  isFavorite = true;
                }
              });
            },
            icon: Icon(iconType, color: iconColor),
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
        body: Column(children: [FavoriteCard(), FavoriteCard()]),
      ),
    ),
  );
}
