class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  bool isAvaliable;
  final List<String> reviews;
  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    this.isAvaliable = true,
    required this.reviews,
  });

  //json passing
  static fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      isAvaliable: json['isAvailable'] as bool? ?? true,
      reviews: List<String>.from(json['reviews'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'isAvailable': isAvaliable,
      'reviews': reviews,
    };
  }
}
