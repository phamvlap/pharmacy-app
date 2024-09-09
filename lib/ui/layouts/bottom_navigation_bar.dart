import 'package:flutter/material.dart';

import './../home_screen/home_screen.dart';
import './../cart_screen/cart_screen.dart';
import './../user_screen/user_screen.dart';
import './../consult_screen/consult_screen.dart';

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const ConsultScreen(),
    const CartScreen(),
    const UserScreen(),
  ];

  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return _screens[index];
            },
            maintainState: false,
          ),
        );
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Trang chủ',
        ),
        NavigationDestination(
          icon: Icon(Icons.chat),
          label: 'Tư vấn',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_cart),
          label: 'Giỏ hàng',
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}
