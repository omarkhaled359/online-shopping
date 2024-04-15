import 'package:hive/hive.dart';
import 'package:shopping/data/DataBase.dart';

import 'hive_db/customer_favorites.dart';

late Box customerFavoritesBox;

CustomerFavorites getCurrentCustomerFavorites() {
  return customerFavoritesBox.get(
      "C${DataBase.customer.id}",
      defaultValue: CustomerFavorites(customerId: DataBase.customer.id, favorites: [])
  );
}

bool isCurrentCustomerFavoriteThisProduct(int productId) {
  return getCurrentCustomerFavorites().favorites.contains(productId);
}

void addCurrentCustomerFavorite(int productId) {
  CustomerFavorites customerFavorites = getCurrentCustomerFavorites();
  customerFavorites.favorites.add(productId);
  customerFavoritesBox.put("C${DataBase.customer.id}", customerFavorites);
}

void removeCurrentCustomerFavorite(int productId) {
  CustomerFavorites customerFavorites = getCurrentCustomerFavorites();
  customerFavorites.favorites.remove(productId);
  customerFavoritesBox.put("C${DataBase.customer.id}", customerFavorites);
}