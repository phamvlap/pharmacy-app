import 'package:flutter/material.dart';

import '../components/components.dart';
import '../../utils/utils.dart';

import './delivered_orders.dart';
import './delivering_orders.dart';
import './pending_orders.dart';

class MyOrderDetailScreen extends StatelessWidget {
  final int initialIndex;
  const MyOrderDetailScreen({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đơn hàng của tôi'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(RouteNames.profile);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 20.0, 0.0),
              child: Icon(Icons.home),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RouteNames.home);
            },
          ),
        ],
      ),
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
                    PendingOrders(),
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
