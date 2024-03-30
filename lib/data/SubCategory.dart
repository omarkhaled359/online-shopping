import 'package:shopping/data/CardProduct.dart';
import 'product.dart';

class SubCategory {
  final int id;
  final String name;

  SubCategory({
    required this.id,
    required this.name,
  });

  // Factory constructor for creating Card from a Map
  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id'],
      name: map['name'],
    );
  }

  // Method to convert Card to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, name $name)';
  }
}