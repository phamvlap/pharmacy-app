import './product.dart';

class CartItem {
  Product product;
  int quantity;
  bool isSelected;

  CartItem({
    required this.product,
    required this.quantity,
    this.isSelected = false,
  });
}
