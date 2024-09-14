import 'package:flutter/material.dart';

import '../ui/cart_screen/cart_screen.dart';

class NavigatorCart extends StatelessWidget {
  const NavigatorCart({super.key});

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
