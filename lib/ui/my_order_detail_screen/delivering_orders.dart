import 'dart:developer';
import 'package:ct484_project/controllers/order_detail_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../controllers/controllers.dart';
import '../../utils/utils.dart';

import './order_detail_item_card.dart';

class DeliveringOrders extends StatefulWidget {
  const DeliveringOrders({super.key});

  @override
  State<DeliveringOrders> createState() => _DeliveringOrdersState();
}

class _DeliveringOrdersState extends State<DeliveringOrders> {
  late Future<void> _fetchOrderDetails;

  @override
  void initState() {
    super.initState();
    final userId = context.read<AuthController>().user!.id!;
    _fetchOrderDetails = context
        .read<OrderDetailController>()
        .fetchAllOrderDetailsByUserId(userId, OrderStatus.shipping);
  }

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthController>().user!.id!;
    return FutureBuilder(
      future: _fetchOrderDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            await context
                .read<OrderDetailController>()
                .fetchAllOrderDetailsByUserId(userId, OrderStatus.shipping);
          },
          child: context.read<OrderDetailController>().orders.isEmpty
              ? const EmptyCart(
                  title: Text('Bạn chưa có đơn hàng nào đang giao'),
                )
              : ListView.builder(
                  itemCount:
                      context.read<OrderDetailController>().orders.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6.0),
                      child: OrderDetailItemCard(
                        orderDetail:
                            context.read<OrderDetailController>().orders[index],
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
                        orderStatus: const Text(
                          'Đang giao hàng',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
