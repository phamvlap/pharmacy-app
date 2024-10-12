import 'dart:developer';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

import './order_detail_item_card.dart';

class DeliveringOrders extends StatelessWidget {
  const DeliveringOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController();
    List<CartItem> cartItems =
        cartController.items; // TODO: replace with another table
    final int itemCount = cartController.itemCount;
    return itemCount == 0
        ? const EmptyCart(
            title: Text('Bạn chưa có đơn hàng nào'),
          )
        : ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6.0),
                child: OrderDetailItemCard(
                  cartItem: cartItems[index],
                  bottomButton: ElevatedButton(
                    onPressed: () {
                      log('Liên hệ Shop');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                      foregroundColor: AppColors.whiteColor,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: const Text('Liên hệ Shop'),
                  ),
                  orderStatus: Text(
                    'Đang giao hàng',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          );
  }
}
