import 'dart:developer';

import 'package:provider/provider.dart';

import './pocketbase_client.dart';
import '../models/models.dart';
import './order_detail_service.dart';
import '../utils/utils.dart';
import '../controllers/controllers.dart';

class OrderService {
  Future<bool> addOrder({
    required Map<String, String> userInformation,
    required List<CartItem> cartItems,
    required String userId,
    required double discount,
    required double total,
    required double shippingFee,
  }) async {
    try {
      final orderDetailService = OrderDetailService();
      final pb = await getPocketBase();

      final orderModel = await pb.collection('orders').create(
        body: {
          'userId': userId,
          'customerName': userInformation['name'],
          'customerAddress': userInformation['address'],
          'customerPhoneNumber': userInformation['phoneNumber'],
          'discount': discount,
          'total': total,
          'shippingFee': shippingFee,
        },
      );

      for (final cartItem in cartItems) {
        await orderDetailService.addOrderDetail(
          OrderDetail(
            name: cartItem.name,
            price: cartItem.price,
            salesOff: cartItem.salesOff,
            quantity: cartItem.quantity,
            orderId: orderModel.id,
            imageId: cartItem.imageId,
            status: OrderStatus.pending,
          ),
        );
      }
      return true;
    } catch (error) {
      log('Error adding order: $error');
      return false;
    }
  }

  Future<List<Order>?> fetchAllOrders(String userId) async {
    final List<Order> orders = [];
    try {
      final pb = await getPocketBase();
      final orderModels =
          await pb.collection('orders').getFullList(filter: "userId='$userId'");
      for (final orderModel in orderModels) {
        orders.add(
          Order.fromJson(orderModel.toJson()).copyWith(id: orderModel.id),
        );
      }
      return orders;
    } catch (error) {
      return null;
    }
  }
}
