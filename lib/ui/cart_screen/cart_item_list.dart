import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../controllers/controllers.dart';

import './cart_item_card.dart';

class CartItemList extends StatefulWidget {
  final bool selectedOnly;
  final bool showCartItemCheckbox;
  final bool fixedQuantity;
  final bool unCheckItemOnRemove;
  final void Function()? closeAlertDialog;

  const CartItemList({
    super.key,
    this.selectedOnly = false,
    this.showCartItemCheckbox = true,
    this.fixedQuantity = false,
    this.unCheckItemOnRemove = false,
    this.closeAlertDialog,
  });

  @override
  State<CartItemList> createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        final cartItems = widget.selectedOnly
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
                showCheckbox: widget.showCartItemCheckbox,
                fixedQuantity: widget.fixedQuantity,
                uncheckOnRemove: widget.unCheckItemOnRemove,
                closeAlertDialog: widget.closeAlertDialog,
              ),
            );
          },
        );
      },
    );
  }
}
