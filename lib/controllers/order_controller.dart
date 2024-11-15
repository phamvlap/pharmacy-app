import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';

class OrderController with ChangeNotifier {
  final OrderService orderService = OrderService();

  Future<void> addOrder({
    required Map<String, String> userInformation,
    required List<CartItem> cartItems,
    required String userId,
    required double discount,
    required double total,
    required double shippingFee,
  }) async {
    await orderService.addOrder(
      userInformation: userInformation,
      cartItems: cartItems,
      userId: userId,
      discount: discount,
      total: total,
      shippingFee: shippingFee,
    );
    notifyListeners();
  }
}
