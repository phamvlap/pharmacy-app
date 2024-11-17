import '../utils/utils.dart';

import './image_model.dart';

class OrderDetail {
  final String? id;
  final String name;
  final double price;
  final double salesOff;
  final int quantity;
  final String orderId;
  final String? imageId;
  final ImageModel? image;
  final OrderStatus status;

  OrderDetail({
    this.id,
    required this.name,
    required this.price,
    required this.salesOff,
    required this.quantity,
    required this.orderId,
    this.imageId,
    this.image,
    this.status = OrderStatus.pending,
  });

  OrderDetail copyWith({
    String? id,
    String? name,
    double? price,
    double? salesOff,
    int? quantity,
    String? orderId,
    String? imageId,
    ImageModel? image,
    OrderStatus? status,
  }) {
    return OrderDetail(
      name: name ?? this.name,
      price: price ?? this.price,
      salesOff: salesOff ?? this.salesOff,
      quantity: quantity ?? this.quantity,
      orderId: orderId ?? this.orderId,
      imageId: imageId ?? this.imageId,
      image: image ?? this.image,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'salesOff': salesOff,
      'quantity': quantity,
      'orderId': orderId,
      'imageId': imageId,
      'status': status.name,
    };
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      salesOff: json['salesOff'].toDouble() ?? 0.0,
      quantity: json['quantity'],
      orderId: json['orderId'],
      imageId: json['imageId'],
    );
  }
}
