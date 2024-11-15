import './image_model.dart';

class OrderDetail {
  final String? id;
  final String name;
  final double price;
  final double salesOff;
  final int quantity;
  final ImageModel? image;

  OrderDetail({
    this.id,
    required this.name,
    required this.price,
    required this.salesOff,
    required this.quantity,
    this.image,
  });

  OrderDetail copyWith({
    String? id,
    String? name,
    double? price,
    double? salesOff,
    int? quantity,
    ImageModel? image,
  }) {
    return OrderDetail(
      name: name ?? this.name,
      price: price ?? this.price,
      salesOff: salesOff ?? this.salesOff,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'salesOff': salesOff,
      'quantity': quantity,
    };
  }

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      salesOff: json['salesOff'].toDouble() ?? 0.0,
      quantity: json['quantity'],
    );
  }

  ImageModel? get featuredImage {
    return image ?? ImageModel(url: '');
  }
}
