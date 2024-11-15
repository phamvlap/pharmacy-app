import 'dart:io';
import './image_model.dart';

class OrderDetail {
  final String? id;
  final String name;
  final double price;
  final double salesOff;
  final int quantity;
  final String orderId;
  final ImageModel? image;

  OrderDetail({
    this.id,
    required this.name,
    required this.price,
    required this.salesOff,
    required this.quantity,
    required this.orderId,
    this.image,
  });

  OrderDetail copyWith({
    String? id,
    String? name,
    double? price,
    double? salesOff,
    int? quantity,
    String? orderId,
    ImageModel? image,
  }) {
    return OrderDetail(
      name: name ?? this.name,
      price: price ?? this.price,
      salesOff: salesOff ?? this.salesOff,
      quantity: quantity ?? this.quantity,
      orderId: orderId ?? this.orderId,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'salesOff': salesOff,
      'quantity': quantity,
      'orderId': orderId,
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
    );
  }

  // File? get featuredImage {
  //   return image ?? ImageModel(url: '');
  // }
}
