import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shopping/boxes.dart';
import 'package:shopping/data/DataBase.dart';
import 'package:shopping/hive_db/customer_favorites.dart';
import 'package:shopping/main_navigator_controller.dart';
import 'package:shopping/provider/ModelHub.dart';
import 'package:shopping/screens/category_screen.dart';
import 'package:shopping/screens/congratulation_screen.dart';
import 'package:shopping/screens/home_screen.dart';
import 'package:shopping/screens/login_screen.dart';
import 'package:shopping/screens/my_home_page.dart';
import 'package:shopping/screens/product_screen.dart';
import 'package:shopping/screens/shopping_screen.dart';
import 'package:shopping/screens/sign_up_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerFavoritesAdapter());
  customerFavoritesBox = await Hive.openBox<CustomerFavorites>('CustomerFavoritesBox');
  DataBase.init();
  MainNavigatorController.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHub>(
      create: (BuildContext context) => ModelHub(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyHomePage.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          CategoryScreen.id: (context) => const CategoryScreen(),
          ProductScreen.id: (context) => const ProductScreen(),
          MyHomePage.id: (context) => const MyHomePage(),
          CongratulationScreen.id: (context) => const CongratulationScreen(),
        },
      ),
    );
  }
}
