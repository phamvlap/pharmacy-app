import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EmptyCart extends StatelessWidget {
  final Widget title;

  const EmptyCart({super.key, required this.title});

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
          title,
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(RouteNames.home);
            },
            child: const Text('Khám phá ngay'),
          ),
        ],
      ),
    );
  }
}
