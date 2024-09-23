import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';
import './empty_cart.dart';
import './../components/navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Scaffold(
        body: EmptyCart(),
      ),
      drawer: MyAppDrawer(),
      bottomNavigationBar: AppNavigationBar(routeName: routeName),
    );
  }
}
