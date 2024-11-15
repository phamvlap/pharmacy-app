import 'dart:developer';
import './pocketbase_client.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

import './order_detail_service.dart';

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
            image: ImageModel(
                url: cartItem.imageUrl, featuredImage: cartItem.featuredImage),
          ),
        );
      }
      return true;
    } catch (error) {
      log('Error adding order: $error');
      return false;
    }
  }
}
