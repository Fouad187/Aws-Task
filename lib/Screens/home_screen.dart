import 'package:aws_task/Screens/cart_tap.dart';
import 'package:aws_task/Screens/home_tap.dart';
import 'package:aws_task/Screens/products_tap.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'account_tap.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taps=[
    HomeTap(),
    ProductsTap(),
    CartTap(),
    AccountTap(),
  ];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {return Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.orange,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            print(index);
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.category,
            label: 'Products',
          ),
          FFNavigationBarItem(
            iconData: Icons.shopping_cart,
            label: 'Cart',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle,
            label: 'Account',
          ),
        ],
      ),
      body: taps[selectedIndex],
    );
  }
}
