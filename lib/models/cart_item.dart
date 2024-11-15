import 'dart:io';

class CartItem {
  final String? id;
  final String name;
  final File? featuredImage;
  final String imageUrl;
  final String? imageId;
  final int quantity;
  final double price;
  final String productId;
  final bool isSelected;
  final double salesOff;

  CartItem({
    this.id,
    required this.name,
    this.featuredImage,
    this.imageUrl = '',
    this.imageId,
    this.quantity = 1,
    required this.price,
    required this.productId,
    this.isSelected = false,
    this.salesOff = 0.0,
  });

  CartItem copyWith({
    String? id,
    String? name,
    File? featuredImage,
    String? imageUrl,
    String? imageId,
    int? quantity,
    double? price,
    String? productId,
    bool? isSelected,
    double? salesOff,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      featuredImage: featuredImage ?? this.featuredImage,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      imageId: imageId ?? this.imageId,
      price: price ?? this.price,
      productId: productId ?? this.productId,
      isSelected: isSelected ?? this.isSelected,
      salesOff: salesOff ?? this.salesOff,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'imageId': imageId,
      'productId': productId,
      'isSelected': isSelected,
      'salesOff': salesOff,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'] ?? '',
      imageId: json['imageId'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      productId: json['productId'],
      isSelected: json['isSelected'],
      salesOff: json['salesOff'].toDouble() ?? 0.0,
    );
  }

  bool hasFeaturedImage() {
    return featuredImage != null || imageUrl.isNotEmpty;
  }
}
