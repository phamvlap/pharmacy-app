import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';

import './empty_cart.dart';
import './cart_item_list.dart';
import './cart_summary.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final cartController = CartController();

  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = cartController.items;

    return Scaffold(
      appBar: const MyAppBar(),
      body: Scaffold(
        body: cartItems.isEmpty
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
      drawer: const MyAppDrawer(),
    );
  }
}
