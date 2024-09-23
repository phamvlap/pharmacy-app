import 'package:flutter/material.dart';

import './screens.dart';

class ScreenRenderer extends StatelessWidget {
  const ScreenRenderer({
    String path = HomeScreen.routeName,
    super.key,
  }) : pathName = path;

  final String pathName;

  static final Map<String, Widget> _screens = {
    HomeScreen.routeName: const HomeScreen(),
    ConsultScreen.routeName: const ConsultScreen(),
    CartScreen.routeName: CartScreen(),
    UserScreen.routeName: const UserScreen(),
  };

  static int pathToIndex(String path) {
    int index = _screens.keys.toList().indexOf(path);
    return index < 0 ? 0 : index;
  }

  static String indexToPath(int index) {
    if (index < 0 || index >= _screens.length) {
      return HomeScreen.routeName;
    }
    String path = _screens.keys.toList()[index];
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return _screens[pathName] ?? const HomeScreen();
  }
}
