import 'package:apppp/Screens/Home%20Page/homePage.dart';
import 'package:apppp/Screens/cart/cart_screen.dart';
import 'package:apppp/Screens/Proudcts/products_screen.dart';
import 'package:apppp/Screens/profile/my_account_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homepage(),
    ProductsScreen(),
    CartScreen(),
    MyAccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'المنتجات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'السلة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'حسابي',
            ),
          ],
        ),
      ),
    );
  }
}
