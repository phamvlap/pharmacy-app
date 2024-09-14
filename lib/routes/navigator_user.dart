import 'package:flutter/material.dart';

import '../ui/cart_screen/cart_screen.dart';

class NavigatorUser extends StatelessWidget {
  const NavigatorUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const CartScreen();
          },
        );
      },
    );
  }
}
