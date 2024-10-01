import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class QuantityUpdatingPannel extends StatelessWidget {
  final int quantity;
  final void Function()? onIncreaseQuantityPressed;
  final void Function()? onDecreaseQuantityPressed;

  const QuantityUpdatingPannel({
    super.key,
    required this.quantity,
    required this.onIncreaseQuantityPressed,
    required this.onDecreaseQuantityPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400]!,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 28.0,
            height: 26.0,
            child: Center(
              child: IconButton(
                padding: const EdgeInsets.all(0.0),
                icon: const Icon(Icons.remove),
                iconSize: 12.0,
                onPressed: onDecreaseQuantityPressed,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.grey[300]!,
                ),
                right: BorderSide(
                  color: Colors.grey[300]!,
                ),
              ),
            ),
            child: Text(
              quantity.toString(),
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: AppFontSizes.textNormal,
              ),
            ),
          ),
          SizedBox(
            width: 28.0,
            height: 26.0,
            child: Center(
              child: IconButton(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                icon: const Icon(Icons.add),
                iconSize: 12.0,
                onPressed: onIncreaseQuantityPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
