class Product {
  final String id;
  final String name;
  final List<String> imageUrls;
  final String description;
  final List<String> category; // TODO: maybe replace with enum
  final String brand;
  final String producer;
  final String components;
  final String unit; // TODO: maybe replace with enum
  final String useGuide;
  final String userTarget;
  final double price;
  final double? salesOff;

  Product({
    required this.id,
    required this.name,
    required this.imageUrls,
    required this.description,
    required this.category,
    required this.brand,
    required this.producer,
    required this.components,
    required this.unit,
    required this.useGuide,
    required this.userTarget,
    required this.price,
    this.salesOff,
  });
}
