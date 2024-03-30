import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/data/DataBase.dart';
import 'package:shopping/provider/ModelHub.dart';
import 'package:shopping/screens/category_screen.dart';
import 'package:shopping/screens/home_screen.dart';
import 'package:shopping/screens/login_screen.dart';
import 'package:shopping/screens/nav.dart';
import 'package:shopping/screens/product_screen.dart';
import 'package:shopping/screens/sign_up_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    DataBase.init();
    return ChangeNotifierProvider<ModelHub>(
      create: (BuildContext context) => ModelHub(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          CategoryScreen.id: (context) => const CategoryScreen(),
          ProductScreen.id: (context) => const ProductScreen(),
          MyHomePage.id: (context) => const MyHomePage(),
        },
      ),
    );
  }
}
