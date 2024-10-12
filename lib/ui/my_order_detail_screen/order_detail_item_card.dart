import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';

class OrderDetailItemCard extends StatelessWidget {
  final CartItem cartItem;
  final Widget? orderStatus;
  final Widget bottomButton;

  const OrderDetailItemCard({
    super.key,
    required this.cartItem,
    required this.bottomButton,
    this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final double price =
        cartItem.product.price * (1 - (cartItem.product.salesOff ?? 0.0));
    final double totalPrice = price * cartItem.quantity;

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.asset(cartItem.product.imageUrls[0]),
            title: Text(
              cartItem.product.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Số lượng: ${cartItem.quantity}'),
            trailing: Text(
              formatMoney(price),
              style: const TextStyle(fontSize: AppFontSizes.textSmall),
            ),
          ),
          if (orderStatus != null) ...[
            Divider(color: Colors.grey[200]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Trạng thái'),
                  orderStatus!,
                ],
              ),
            ),
          ],
          Divider(color: Colors.grey[200]),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Thành tiền: ${formatMoney(totalPrice)}',
                  style: const TextStyle(
                    fontSize: AppFontSizes.textSmall,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottomButton,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
