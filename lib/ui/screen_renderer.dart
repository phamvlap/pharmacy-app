import 'package:flutter/material.dart';

import '../../utils/utils.dart';

import './screens.dart';

class ScreenRenderer extends StatelessWidget {
  const ScreenRenderer({
    String path = RouteNames.home,
    super.key,
  }) : pathName = path;

  final String pathName;

  static final Map<String, Widget> _screens = {
    RouteNames.home: const HomeScreen(),
    RouteNames.consult: const ConsultScreen(),
    RouteNames.cart: const CartScreen(),
    RouteNames.profile: const UserScreen(),
    RouteNames.login: const LoginScreen(),
    RouteNames.register: const RegisterScreen(),
    RouteNames.myOrderDetail: const MyOrderDetailScreen(),
    RouteNames.userInformation: const UserInformationScreen(),
    RouteNames.editUserInformation: const EditUserInformationScreen(),
    RouteNames.checkout: const CheckoutScreen(),
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
    final screen = _screens[pathName] ?? const HomeScreen();
    return SafeArea(child: screen);
  }
}
