import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:shopping/custom_widgets/home_screen_widget.dart';
import 'package:shopping/custom_widgets/web_mobile_size.dart';
import 'package:shopping/main_navigator_controller.dart';

import '../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static String id = 'MyHomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _pageTitle = "WELCOME !";

  void _onItemTapped(int index) {
    if (index ==_selectedIndex) return;
    setState(() {
      switch(index) {
        case 0: {
          MainNavigatorController.homeStack.clear();
          MainNavigatorController.homeStack.add(MainNavigatorController.mainRootHomeScreen);
          _pageTitle = "WELCOME !";
        }
        case 1: {
          MainNavigatorController.favoriteStack.clear();
          MainNavigatorController.favoriteStack.add(MainNavigatorController.rootFavoriteScreen);
          _pageTitle = "FAVOURITE";
        }
        case 2: {
          MainNavigatorController.cardStack.clear();
          MainNavigatorController.cardStack.add(MainNavigatorController.rootCardScreen);
          _pageTitle = "CART";
        }
        case 3: {
          MainNavigatorController.profileStack.clear();
          MainNavigatorController.profileStack.add(MainNavigatorController.rootProfileScreen);
          _pageTitle = "PERSONAL ACCOUNT";
        }
        default : {
          MainNavigatorController.homeStack.clear();
          MainNavigatorController.homeStack.add(MainNavigatorController.mainRootHomeScreen);
        }
      }
      _selectedIndex = index;
    });
  }

  void _onBackPressed() {
    setState(() {
      switch(_selectedIndex) {
        case 0: {
          if (MainNavigatorController.homeStack.length > 1) {
            MainNavigatorController.popHomeStack();
          }
          else { _onItemTapped(0); }
        }
        case 1: {
          if (MainNavigatorController.favoriteStack.length > 1) {
            MainNavigatorController.popFavoriteStack();
          }
          else { _onItemTapped(0); }
        }
        case 2: {
          if (MainNavigatorController.cardStack.length > 1) {
            MainNavigatorController.popCardStack();
          }
          else { _onItemTapped(0); }
        }
        case 3: {
          if (MainNavigatorController.profileStack.length > 1) {
            MainNavigatorController.popProfileStack();
          }
          else { _onItemTapped(0); }
        }
        default: {
          if (MainNavigatorController.homeStack.length > 1) {
            MainNavigatorController.popHomeStack();
          }
          else { _onItemTapped(0); }
        }
      }
    });
  }

  bool _isBackPressed() => _selectedIndex == 0 && MainNavigatorController.homeStack.last == MainNavigatorController.mainRootHomeScreen;

  @override
  Widget build(BuildContext context) {

    return WebMobileSize(
      child: PopScope(
        canPop: _isBackPressed(),
        onPopInvoked: (canPop) {
          if (!canPop) {
            _onBackPressed();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            title: Center(child: Text(_pageTitle)),
          ),
          body: MainNavigatorController.getCurrentWidget(
              context,
              _selectedIndex,
              () => setState(() {})
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            // iconSize: 15,
            // backgroundColor: kMainColor,
            // elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                activeIcon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                activeIcon: Icon(Icons.shopping_cart),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}