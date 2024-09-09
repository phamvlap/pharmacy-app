import 'package:flutter/material.dart';

import '../layouts/app_bar.dart';
import '../layouts/bottom_navigation_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const Text('Cart hereeeeee!!!'),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
