import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../utils/utils.dart';

import './delivered_orders.dart';
import './delivering_orders.dart';

class MyOrderDetailScreen extends StatelessWidget {
  final int initialIndex;
  const MyOrderDetailScreen({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: DefaultTabController(
        initialIndex: initialIndex,
        length: 4,
        child: Column(
          children: <Widget>[
            const TabBar(
              // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              labelPadding:
                  EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerHeight: 0.0,
              tabs: <Widget>[
                Text(
                  'Chờ xử lý',
                  style: TextStyle(fontSize: AppFontSizes.textSmall),
                ),
                Text(
                  'Đang giao',
                  style: TextStyle(fontSize: AppFontSizes.textSmall),
                ),
                Text(
                  'Đã giao',
                  style: TextStyle(fontSize: AppFontSizes.textSmall),
                ),
                Text(
                  'Đổi trả',
                  style: TextStyle(fontSize: AppFontSizes.textSmall),
                ),
              ],
            ),
            Container(color: AppColors.mainBackgroundColor, height: 8.0),
            Expanded(
              child: Container(
                color: AppColors.mainBackgroundColor,
                child: const TabBarView(
                  children: <Widget>[
                    EmptyCart(
                      title: Text('Bạn chưa có đơn hàng nào'),
                    ),
                    DeliveringOrders(),
                    DeliveredOrders(),
                    EmptyCart(
                      title: Text('Bạn chưa có đơn hàng nào'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
