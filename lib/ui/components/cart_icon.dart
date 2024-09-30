import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';

class CartIcon extends StatelessWidget {
  final CartController cartController = CartController();

  CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final int itemCount = cartController.itemCount;

    return (itemCount > 0)
        ? Badge(
            label: Text(
              itemCount.toString(),
              style: const TextStyle(
                fontSize: 12.0,
              ),
            ),
            textColor: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const Icon(Icons.shopping_cart),
          )
        : const Icon(Icons.shopping_cart);
  }
}
