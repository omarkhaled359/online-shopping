class Product {
  final int id;
  final String name;
  final double price;
  final String status;
  final String image;
  final int categoryId;
  final int subCategoryId;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
    required this.image,
    required this.categoryId,
    required this.subCategoryId,
  });

  // Factory constructor for creating Product from a Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      status: map['status'],
      image: map['image'],
      categoryId: map['categoryId'],
      subCategoryId: map['subCategoryId'],
    );
  }

  // Method to convert Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'status': status,
      'image': image,
      'categoryId': categoryId,
      'subCategoryId': subCategoryId,
    };
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, status: $status, image: $status, categoryId $categoryId, subCategoryId $subCategoryId)';
  }
}