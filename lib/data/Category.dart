import 'package:shopping/data/CardProduct.dart';
import 'product.dart';

class Category {
  final int id;
  final String name;
  final String image;
  final List<int> subCategoriesIds;

Category({
    required this.id,
    required this.name,
    required this.image,
    required this.subCategoriesIds,
  });

  // Factory constructor for creating Card from a Map
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      subCategoriesIds: List<int>.from(map['subCategoriesIds']?.map((x) => x as int) ?? []),
    );
  }

  // Method to convert Card to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'subCategoriesIds': subCategoriesIds,
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, name $name, image $image, subCategoriesIds $subCategoriesIds)';
  }
}