import 'package:flutter/material.dart';

import '../../models/cart_item.dart';

import 'cart_item_card.dart';

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
        return CartItemCard(cartItems[index]);
      },
    );
  }
}
