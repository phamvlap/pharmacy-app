import 'package:flutter/material.dart';

import './../layouts/app_bar.dart';
import './../layouts/drawer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Text('Cart hereeeeee!!!'),
      drawer: MyAppDrawer(),
    );
  }
}
