import 'package:flutter/material.dart';

import '../../models/models.dart';

import './cart_item_card.dart';

class CartItemList extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartItemList(
    this.cartItems, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: CartItemCard(cartItems[index]),
        );
      },
    );
  }
}
