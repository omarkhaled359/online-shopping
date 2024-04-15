import 'package:hive_flutter/adapters.dart';

part 'customer_favorites.g.dart';

@HiveType(typeId: 1)
class CustomerFavorites {
  CustomerFavorites({required this.customerId, required this.favorites});

  @HiveField(0)
  int customerId;

  @HiveField(1)
  List<int> favorites;
}