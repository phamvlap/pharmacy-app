import 'package:flutter/material.dart';
import 'dart:developer';

import '../../models/models.dart';
import '../../utils/utils.dart';

class OrderDetailItemCard extends StatelessWidget {
  final OrderDetail orderDetail;
  final Widget? orderStatus;
  final Widget bottomButton;

  const OrderDetailItemCard({
    super.key,
    required this.orderDetail,
    required this.bottomButton,
    this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final double price =
        orderDetail.price * (1 - (orderDetail.salesOff ?? 0.0));
    final double totalPrice = price * orderDetail.quantity;

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: orderDetail.image!.featuredImage != null
                ? Image.file(orderDetail.image!.featuredImage!)
                : Image.network(orderDetail.image!.url),
            title: Text(
              orderDetail.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text('Số lượng: ${orderDetail.quantity}'),
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
