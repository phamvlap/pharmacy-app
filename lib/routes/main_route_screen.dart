import 'package:flutter/material.dart';

import 'navigator_home.dart';
import 'navigator_consult.dart';
import 'navigator_cart.dart';
import 'navigator_user.dart';

class MainRouteScreen extends StatefulWidget {
  const MainRouteScreen({super.key});

  @override
  State<MainRouteScreen> createState() => _MainRouteScreenState();
}

class _MainRouteScreenState extends State<MainRouteScreen> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  final List<Widget> _navigatorScreens = <Widget>[
    const NavigatorHome(),
    const NavigatorConsult(),
    const NavigatorCart(),
    const NavigatorUser(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _navigatorScreens.map(
          (screen) {
            return Navigator(
              key: _navigatorKeys[_navigatorScreens.indexOf(screen)],
              onGenerateRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) {
                    return screen;
                  },
                );
              },
            );
          },
        ).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
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
      ),
    );
  }
}
