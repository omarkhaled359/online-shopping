class SubCategory {
  final int id;
  final String name;
  final String image;

  SubCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  // Factory constructor for creating Card from a Map
  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['id'],
      name: map['name'],
      image: map['image'],
    );
  }

  // Method to convert Card to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, name $name, image $image)';
  }
}