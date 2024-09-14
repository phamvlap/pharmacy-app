class ProductModel {
  String name;
  List<String> imageUrls;
  String description;
  List<String> category; // TODO: maybe replace with enum
  String brand;
  String producer;
  String components;
  String unit; // TODO: maybe replace with enum
  String useGuide;
  String userTarget;
  double price;
  double salesOff;

  ProductModel({
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
    this.salesOff = 0.0,
  });
}
