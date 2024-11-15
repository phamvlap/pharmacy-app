import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';

class CartIcon extends StatefulWidget {
  const CartIcon({super.key});

  @override
  State<CartIcon> createState() => _CartIconState();
}

class _CartIconState extends State<CartIcon> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = context.watch<CartController>();
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
