import 'package:shopping/data/CardProduct.dart';

class Card {
  final List<CardProduct> cardProducts;
  final int userId;

  Card({
    required this.cardProducts,
    required this.userId,
  });

  // Factory constructor for creating Card from a Map
  factory Card.fromMap(Map<String, dynamic> map) {
    return Card(
      cardProducts: List<CardProduct>.from(map['cardProducts']?.map((x) => CardProduct.fromMap(x)) ?? []),
      userId: map['userId'],
    );
  }

  // Method to convert Card to a Map
  Map<String, dynamic> toMap() {
    return {
      'cardProducts': List<dynamic>.from(cardProducts.map((x) => x.toMap())),
      'userId': userId,
    };
  }

  @override
  String toString() {
    return 'Card(cardProducts: $cardProducts, userId $userId)';
  }
}