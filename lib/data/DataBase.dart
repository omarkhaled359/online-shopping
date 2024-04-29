import 'package:shopping/data/Customer.dart';
import 'package:shopping/data/DebitCard.dart';
import 'package:shopping/data/Product.dart';
import 'package:shopping/data/Category.dart';
import 'package:shopping/data/SubCategory.dart';

import 'Card.dart';

class DataBase {
  static String imgLink = "https://th.bing.com/th/id/OIP.YAXlTjvtEKchdMVc5laZhwHaE8?rs=1&pid=ImgDetMain";

  static String imgManLink = "https://th.bing.com/th/id/OIP.K1ISx-9IRbQlDioApXONTQAAAA?rs=1&pid=ImgDetMain";
  static String imgWomanLink = "https://th.bing.com/th/id/OIP.RNpTpm3_QV9XLFiTjc1deQAAAA?rs=1&pid=ImgDetMain";
  static String imgKidsLink = "https://th.bing.com/th/id/OIP.T8EAz0aixHZnQ-nVK-EKHQHaFj?rs=1&pid=ImgDetMain";
  static String imgMakeUpLink = "https://th.bing.com/th/id/OIP.bqOVRab_TmG8xqoM_ErIEQHaHa?rs=1&pid=ImgDetMain";

  static bool isInitialized = false;
  static List<DebitCard> debitCards = [];
  static List<Product> products = [];
  static List<Category> categories = [];
  static List<SubCategory> subCategories = [];
  static Customer customer = Customer(
      id: 3, firstName: "Sherif", lastName: "Salah",
      state: "Egypt", city: "Zagazig", pinCode: '44511',
      email: "sherif.salah@shopping.com", password: "12345678"
  );

  static Card card = Card(cardProducts: [], userId: customer.id);

  static void init() {
    if (isInitialized) return;

    debitCards.add(DebitCard(id: 1, promoCode: "3325D", type: "V", value: 150.5));
    debitCards.add(DebitCard(id: 2, promoCode: "74H9N", type: "P", value: 15.7));

    products.add(Product(id: 1, name: "P1-Sherif-Salah-El-dien112 product", price: 100, status: "Avail", image: "https://", categoryId: 1, subCategoryId: 1));
    products.add(Product(id: 2, name: "P2", price: 99, status: "Avail", image: "https://", categoryId: 1, subCategoryId: 1));
    products.add(Product(id: 3, name: "P3", price: 198, status: "Avail", image: "https://", categoryId: 1, subCategoryId: 3));
    products.add(Product(id: 4, name: "P4", price: 188, status: "Avail", image: "https://", categoryId: 1, subCategoryId: 3));
    products.add(Product(id: 5, name: "P5", price: 115, status: "Avail", image: "https://", categoryId: 1, subCategoryId: 6));
    products.add(Product(id: 6, name: "P6", price: 304, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 2));
    products.add(Product(id: 7, name: "P7", price: 45, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 2));
    products.add(Product(id: 8, name: "P8", price: 320, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 3));
    products.add(Product(id: 9, name: "P9", price: 32, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 3));
    products.add(Product(id: 10, name: "P10", price: 777, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 6));
    products.add(Product(id: 11, name: "P11", price: 557, status: "Avail", image: "https://", categoryId: 2, subCategoryId: 6));
    products.add(Product(id: 12, name: "P12", price: 165, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 1));
    products.add(Product(id: 13, name: "P13", price: 990, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 1));
    products.add(Product(id: 14, name: "P14", price: 152, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 3));
    products.add(Product(id: 15, name: "P15", price: 325, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 3));
    products.add(Product(id: 16, name: "P16", price: 382, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 4));
    products.add(Product(id: 17, name: "P17", price: 842, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 4));
    products.add(Product(id: 18, name: "P18", price: 756, status: "Avail", image: "https://", categoryId: 3, subCategoryId: 5));
    products.add(Product(id: 19, name: "P19", price: 122, status: "Avail", image: "https://", categoryId: 4, subCategoryId: 5));

    categories.add(Category(id: 1, name: "Man", image: imgManLink , subCategoriesIds: [1, 3, 6]));
    categories.add(Category(id: 2, name: "Woman", image: imgWomanLink , subCategoriesIds: [2, 3, 6]));
    categories.add(Category(id: 3, name: "Children", image: imgKidsLink , subCategoriesIds: [1, 3, 4, 5]));
    categories.add(Category(id: 4, name: "Make Up", image: imgMakeUpLink , subCategoriesIds: [1, 3, 4, 5]));

    subCategories.add(SubCategory(id: 1, name: "shirts"));
    subCategories.add(SubCategory(id: 2, name: "dress"));
    subCategories.add(SubCategory(id: 3, name: "pants"));
    subCategories.add(SubCategory(id: 4, name: "bags"));
    subCategories.add(SubCategory(id: 5, name: "accessories"));
    subCategories.add(SubCategory(id: 6, name: "shoes"));

    isInitialized = true;
  }
}