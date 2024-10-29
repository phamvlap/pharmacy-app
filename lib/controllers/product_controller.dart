import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';

class ProductController with ChangeNotifier {
  final ProductService productsService = ProductService();

  final List<Product> _products = [];
  Product? _product;

  int get itemCount {
    return _products.length;
  }

  List<Product> get products {
    return [..._products];
  }

  Product? get product {
    return _product;
  }

  Product? findById(String id) {
    try {
      return _products.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }

  Map<String, dynamic> toMap(Product product) {
    return {
      "id": product.id,
      "name": product.name,
      "imageUrls": product.images.map((image) => image.url).toList(),
      "description": product.description,
      "category": product.category,
      "brand": product.brand,
      "producer": product.producer,
      "components": product.components,
      "unit": product.unit,
      "useGuide": product.useGuide,
      "userTarget": product.userTarget,
      "price": product.price,
      "salesOff": product.salesOff,
    };
  }

  Future<void> fetchAllProducts() async {
    final List<Product>? products = await productsService.fetchAllProducts();
    if (products != null) {
      _products.clear();
      _products.addAll(products);
      notifyListeners();
    }
  }

  Future<void> fetchProduct(String id) async {
    final Product? product = await productsService.fetchProductById(id);
    if (product != null) {
      _product = product;
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) async {
    final Product? newProduct = await productsService.addProduct(product);
    if (newProduct != null) {
      _products.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Product product) async {
    final int index = _products.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      final Product? updatedItem = await productsService.updateProduct(product);
      if (updatedItem != null) {
        _products[index] = updatedItem;
        notifyListeners();
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    final int index = _products.indexWhere((item) => item.id == id);
    if (index >= 0) {
      final bool isDeleted = await productsService.deleteProduct(id);
      if (isDeleted) {
        _products.removeAt(index);
        notifyListeners();
      }
    }
  }
}
