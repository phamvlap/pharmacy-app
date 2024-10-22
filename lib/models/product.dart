import './image_model.dart';

class Product {
  final String? id;
  final String name;
  final String description;
  final List<String> category;
  final String brand;
  final String producer;
  final String components;
  final String unit;
  final String useGuide;
  final String userTarget;
  final double price;
  final double salesOff;
  final List<ImageModel> images;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.brand,
    required this.producer,
    required this.components,
    required this.unit,
    required this.useGuide,
    required this.userTarget,
    required this.price,
    this.salesOff = 0.0,
    this.images = const [],
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    List<String>? category,
    String? brand,
    String? producer,
    String? components,
    String? unit,
    String? useGuide,
    String? userTarget,
    double? price,
    double? salesOff,
    List<ImageModel>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      producer: producer ?? this.producer,
      components: components ?? this.components,
      unit: unit ?? this.unit,
      useGuide: useGuide ?? this.useGuide,
      userTarget: userTarget ?? this.userTarget,
      price: price ?? this.price,
      salesOff: salesOff ?? this.salesOff,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toJson() {
    final String categoryString = category.join(';');

    return {
      'name': name,
      'description': description,
      'category': categoryString,
      'brand': brand,
      'producer': producer,
      'components': components,
      'unit': unit,
      'useGuide': useGuide,
      'userTarget': userTarget,
      'price': price,
      'salesOff': salesOff,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    final List<String> categoryList = (json['category'] as String).split(';');

    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: categoryList,
      brand: json['brand'],
      producer: json['producer'],
      components: json['components'],
      unit: json['unit'],
      useGuide: json['useGuide'],
      userTarget: json['userTarget'],
      price: json['price'].toDouble(),
      salesOff: json['salesOff'].toDouble() ?? 0.0,
    );
  }

  List<ImageModel> get featuredImages {
    return images.toList();
  }
}
