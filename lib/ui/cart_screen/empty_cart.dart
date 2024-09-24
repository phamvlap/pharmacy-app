import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/cart/empty_cart.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          const Text('Giỏ hàng trống'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.home);
            },
            child: const Text('Khám phá ngay'),
          ),
        ],
      ),
    );
  }
}
