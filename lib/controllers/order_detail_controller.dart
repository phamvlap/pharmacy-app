import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../utils/utils.dart';

class OrderDetailController with ChangeNotifier {
  final OrderDetailService orderDetailService = OrderDetailService();
  final List<OrderDetail> _orderDetails = [];

  Future<void> fetchAllOrderDetails(OrderStatus orderStatus) async {
    final List<OrderDetail>? orders =
        await orderDetailService.fetchAllOrderDetails(orderStatus);
    if (orders != null) {
      _orderDetails.clear();
      _orderDetails.addAll(orders);
      notifyListeners();
    }
  }

  List<OrderDetail> get orders {
    return [..._orderDetails];
  }
}
