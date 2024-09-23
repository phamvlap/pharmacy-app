import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './empty_cart.dart';
import './../components/navigation_bar.dart';
import './../../controllers/cart_controller.dart';
import './../../models/cart_item.dart';
import './cart_item_card.dart';
import './cart_summary.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  static const routeName = '/cart';
  final cartController = CartController();

  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = cartController.items;

    return Scaffold(
      appBar: const MyAppBar(),
      body: Scaffold(
        body: cartItems.isEmpty
            ? const EmptyCart()
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        return CartItemCard(cartItems[index]);
                      },
                    ),
                  ),
                  const CartSummary(),
                ],
              ),
      ),
      drawer: const MyAppDrawer(),
      // bottomNavigationBar: const AppNavigationBar(routeName: routeName),
    );
  }
}
