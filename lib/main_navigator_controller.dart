import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:shopping/custom_widgets/favorite_screen_widget.dart';
import 'package:shopping/custom_widgets/product_screen_widget.dart';
import 'package:shopping/custom_widgets/shopping_screen_widget.dart';
import 'package:shopping/screens/shopping_screen.dart';
import 'custom_widgets/card_screen_widget.dart';
import 'custom_widgets/category_screen_widget.dart';
import 'custom_widgets/home_screen_widget.dart';
import 'custom_widgets/profile_screen_widget.dart';

class MainNavigatorController {
  static bool isInitialized = false;
  static const String mainRootHomeScreen = 'Main_Root_Home_Screen';
  static const String homeCategoryScreen = 'Home_Category_Screen';
  static const String homeProductScreen = 'Home_Product_Screen';
  static const String rootFavoriteScreen = 'Root_Favorite_Screen';
  static const String favoriteProductScreen = 'favorite_Product_Screen';
  static const String rootCardScreen = 'Root_Card_Screen';
  static const String cardProductScreen = 'Card_Product_Screen';
  static const String cardPaymentScreen = 'Card_Payment_Screen';
  static const String rootProfileScreen = 'Root_Profile_Screen';
  static List<String> homeStack = [];
  static List<String> favoriteStack = [];
  static List<String> cardStack = [];
  static List<String> profileStack = [];
  static HashMap<String, int> arguments = HashMap<String, int>();
  static const String categoryScreenArgument = 'Category_Screen_Argument';
  static const String productScreenArgument = 'Product_Screen_Argument';

  static void init() {
    if (isInitialized) return;

    homeStack.add(mainRootHomeScreen);
    favoriteStack.add(rootFavoriteScreen);
    cardStack.add(rootCardScreen);
    profileStack.add(rootProfileScreen);

    arguments[categoryScreenArgument] = 0;
    arguments[productScreenArgument] = 0;

    isInitialized = true;
  }

  static void pushHomeStack(String screen) => homeStack.add(screen);
  static void pushFavoriteStack(String screen) => favoriteStack.add(screen);
  static void pushCardStack(String screen) => cardStack.add(screen);
  static void pushProfileStack(String screen) => profileStack.add(screen);

  static void popHomeStack() => homeStack.removeLast();
  static void popFavoriteStack() => favoriteStack.removeLast();
  static void popCardStack() => cardStack.removeLast();
  static void popProfileStack() => profileStack.removeLast();

  static Widget getCurrentWidget(
      BuildContext context,
      int index,
      Function setStatAction
  ) {
    switch(index) {
      case 0: {
        switch(homeStack.last) {
          case mainRootHomeScreen: return HomeScreenWidget(
            onNavigateAction: (categoryId) {
              pushHomeStack(homeCategoryScreen);
              arguments[categoryScreenArgument] = categoryId;
              setStatAction();
            }
          );
          case homeCategoryScreen: return CategoryScreenWidget(
              onNavigateAction: (productId) {
                pushHomeStack(homeProductScreen);
                arguments[productScreenArgument] = productId;
                setStatAction();
              },
              onCategoryTabAction: (categoryId) {
                popHomeStack();
                pushHomeStack(homeCategoryScreen);
                arguments[categoryScreenArgument] = categoryId;
                setStatAction();
              },
              onAllTabAction: () {
                popHomeStack();
                setStatAction();
              },
          );
          case homeProductScreen: return const ProductScreenWidget();
          default: return HomeScreenWidget(
              onNavigateAction: (categoryId) {
                pushHomeStack(homeProductScreen);
                arguments[categoryScreenArgument] = categoryId;
                setStatAction();
              }
          );
        }
      }
      case 1: {
        switch(favoriteStack.last) {
          case rootFavoriteScreen: return FavoriteScreenWidget(
              onNavigateAction: (productId) {
                pushFavoriteStack(favoriteProductScreen);
                arguments[productScreenArgument] = productId;
                setStatAction();
              }
          );
          case favoriteProductScreen: return const ProductScreenWidget();
          default: return FavoriteScreenWidget(
              onNavigateAction: (productId) {
                pushFavoriteStack(favoriteProductScreen);
                arguments[productScreenArgument] = productId;
                setStatAction();
              }
          );
        }
      }
      case 2: {
        switch(cardStack.last) {
          case rootCardScreen: return CardScreenWidget(
              onNavigateAction: (productId) {
                pushCardStack(cardProductScreen);
                arguments[productScreenArgument] = productId;
                setStatAction();
              },
              onConfirmAction: () {
                pushCardStack(cardPaymentScreen);
                setStatAction();
              }
          );
          case cardProductScreen: return const ProductScreenWidget();
          case cardPaymentScreen: return ShoppingScreenWidget(
            onRefreshAction: () {
              popCardStack();
              setStatAction();
            }
          );
          default: return CardScreenWidget(
              onNavigateAction: (productId) {
                pushCardStack(cardProductScreen);
                arguments[productScreenArgument] = productId;
                setStatAction();
              },
              onConfirmAction: () {
                pushCardStack(cardPaymentScreen);
                setStatAction();
              }
          );
        }
      }
      case 3: {
        switch(profileStack.last) {
          case rootProfileScreen: return ProfileScreenWidget(
            onNavigateAction: () {}, onConfirmAction: () {},
          );
          default: return ProfileScreenWidget(
            onNavigateAction: () {}, onConfirmAction: () {},
          );
        }
      }
    }
    return const Center();
  }
}