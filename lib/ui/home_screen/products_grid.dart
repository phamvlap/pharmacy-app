import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/controllers.dart';
import './product_grid_tile.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.read<ProductController>().products;

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductGridTile(products[index]);
      },
    );
  }
}
