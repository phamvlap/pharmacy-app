import 'package:flutter/material.dart';

import '../../utils/utils.dart';

enum BorderRadiusType { left, right, none }

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
          QuantityUpdatingIconButton(
            icon: Icons.remove,
            onPressed: onDecreaseQuantityPressed!,
            borderRadiusType: BorderRadiusType.left,
            borderRadius: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 1.0,
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
          QuantityUpdatingIconButton(
            icon: Icons.add,
            onPressed: onIncreaseQuantityPressed!,
            borderRadiusType: BorderRadiusType.right,
            borderRadius: 20.0,
          ),
        ],
      ),
    );
  }
}

class QuantityUpdatingIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final BorderRadiusType? borderRadiusType;
  final double borderRadius;

  const QuantityUpdatingIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.borderRadiusType = BorderRadiusType.none,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28.0,
      height: 26.0,
      child: Center(
        child: IconButton(
          icon: Icon(icon),
          onPressed: onPressed,
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          iconSize: 12.0,
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: (borderRadiusType == BorderRadiusType.left)
                    ? BorderRadius.only(
                        topLeft: Radius.circular(borderRadius),
                        bottomLeft: Radius.circular(borderRadius))
                    : (borderRadiusType == BorderRadiusType.right)
                        ? BorderRadius.only(
                            topRight: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius),
                          )
                        : BorderRadius.zero,
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.grey[100]!,
            ),
          ),
        ),
      ),
    );
  }
}
