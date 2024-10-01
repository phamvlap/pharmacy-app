import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

import './empty_cart.dart';
import './cart_item_list.dart';
import './cart_summary.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = CartController();

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = cartController.items;
    int itemCount = cartController.itemCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng ($itemCount)'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
          color: AppColors.mainBackgroundColor,
          child: cartItems.isEmpty
              ? const EmptyCart()
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: CartItemList(cartItems),
                    ),
                    const CartSummary(),
                  ],
                ),
        ),
      ),
    );
  }
}
