import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../controllers/controllers.dart';

import './cart_item_card.dart';

class CartItemList extends StatelessWidget {
  final bool selectedOnly;
  final bool showCartItemCheckbox;
  final bool fixedQuantity;
  final bool unCheckItemOnRemove;
  const CartItemList({
    super.key,
    this.selectedOnly = false,
    this.showCartItemCheckbox = true,
    this.fixedQuantity = false,
    this.unCheckItemOnRemove = false,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        final cartItems = selectedOnly
            ? cartController.selectedCartItems
            : cartController.cartItems;
        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final CartItem cartItem = cartItems[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: CartItemCard(
                cartItem,
                showCheckbox: showCartItemCheckbox,
                fixedQuantity: fixedQuantity,
                uncheckOnRemove: unCheckItemOnRemove,
              ),
            );
          },
        );
      },
    );
  }
}
