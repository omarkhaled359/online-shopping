import 'Product.dart';

class CardProduct {
  final Product product;
  final int quantity;

  CardProduct({
    required this.product,
    required this.quantity,
  });

  // Factory constructor for creating Product from a Map
  factory CardProduct.fromMap(Map<String, dynamic> map) {
    return CardProduct(
      product: map['product'],
      quantity: map['quantity'],
    );
  }

  // Method to convert Product to a Map
  Map<String, dynamic> toMap() {
    return {
      'product': product,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return 'CardProduct(product: $product, quantity: $quantity)';
  }
}