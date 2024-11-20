import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class OrderDetailController with ChangeNotifier {
  final OrderService orderService = OrderService();
  final OrderDetailService orderDetailService = OrderDetailService();
  final List<OrderDetail> _orderDetails = [];

  Future<void> fetchAllOrderDetailsByOderId(
      String orderId, OrderStatus orderStatus) async {
    final List<OrderDetail>? orderDetails = await orderDetailService
        .fetchAllOrderDetailsByOderId(orderId, orderStatus);
    if (orderDetails != null) {
      _orderDetails.clear();
      _orderDetails.addAll(orderDetails);
      notifyListeners();
    }
  }

  Future<void> fetchAllOrderDetailsByUserId(
      String userId, OrderStatus orderStatus) async {
    final List<Order>? orders = await orderService.fetchAllOrders(userId);
    final List<OrderDetail> orderDetails = [];

    if (orders != null) {
      for (final order in orders) {
        log('Order: ${order.id}');
        final List<OrderDetail>? orderDetailsByOrderId =
            await orderDetailService.fetchAllOrderDetailsByOderId(
                order.id!, orderStatus);
        if (orderDetailsByOrderId != null) {
          orderDetails.addAll(orderDetailsByOrderId);
        }
      }
    }

    _orderDetails.clear();
    _orderDetails.addAll(orderDetails);
    notifyListeners();
  }

  List<OrderDetail> get orders {
    return [..._orderDetails];
  }
}
