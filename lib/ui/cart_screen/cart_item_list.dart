import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../controllers/controllers.dart';

import './cart_item_card.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return ListView.builder(
          itemCount: cartController.itemCount,
          itemBuilder: (context, index) {
            final CartItem cartItem = cartController.cartItems[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: CartItemCard(cartItem),
            );
          },
        );
      },
    );
  }
}
