import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../../controllers/controllers.dart';

import './screens.dart';

class ScreenRenderer extends StatelessWidget {
  const ScreenRenderer({
    String path = RouteNames.home,
    super.key,
  }) : pathName = path;

  final String pathName;

  static final Map<String, Widget> _screens = {
    RouteNames.home: HomeScreen(),
    RouteNames.consult: const ConsultScreen(),
    RouteNames.cart: CartScreen(),
    RouteNames.profile: const UserScreen(),
    RouteNames.login: const LoginScreen(),
    RouteNames.register: const RegisterScreen(),
  };

  static int pathToIndex(String path) {
    int index = _screens.keys.toList().indexOf(path);
    return index < 0 ? 0 : index;
  }

  static String indexToPath(int index) {
    if (index < 0 || index >= _screens.length) {
      return RouteNames.home;
    }
    String path = _screens.keys.toList()[index];
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final screen = _screens[pathName] ?? HomeScreen();
    return ChangeNotifierProvider(
      create: (context) => AuthController(),
      child: SafeArea(child: screen),
    );
  }
}
