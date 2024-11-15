import './order_detail.dart';

class Order {
  final String? id;
  final String userId;
  final String customerName;
  final String customerAddress;
  final String customerPhoneNumber;
  final double discount;
  final double total;
  final double shippingFee;
  final List<OrderDetail> orderDetails;

  Order({
    this.id,
    required this.userId,
    required this.customerName,
    required this.customerAddress,
    required this.customerPhoneNumber,
    required this.discount,
    required this.total,
    this.shippingFee = 0.0,
    this.orderDetails = const [],
  });

  Order copyWith({
    String? id,
    String? userId,
    String? customerName,
    String? customerAddress,
    String? customerPhoneNumber,
    double? discount,
    double? total,
    double? shippingFee,
    List<OrderDetail>? orderDetails,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      customerName: customerName ?? this.customerName,
      customerAddress: customerAddress ?? this.customerAddress,
      customerPhoneNumber: customerPhoneNumber ?? this.customerPhoneNumber,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      shippingFee: shippingFee ?? this.shippingFee,
      orderDetails: orderDetails ?? this.orderDetails,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'customerName': customerName,
      'customerAddress': customerAddress,
      'customerPhoneNumber': customerPhoneNumber,
      'discount': discount,
      'total': total,
      'shippingFee': shippingFee,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      userId: json['userId'],
      customerName: json['customerName'],
      customerAddress: json['customerAddress'],
      customerPhoneNumber: json['customerPhoneNumber'],
      discount: json['discount'].toDouble(),
      total: json['total'].toDouble(),
      shippingFee: json['shippingFee'].toDouble(),
    );
  }
}
