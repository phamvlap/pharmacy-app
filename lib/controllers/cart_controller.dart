import 'package:flutter/foundation.dart';

import '../models/models.dart';
import '../services/services.dart';

class CartController with ChangeNotifier {
  final CartService _cartService = CartService();
  final Map<String, CartItem> _cartItems = {};

  int get itemCount {
    return _cartItems.length;
  }

  int get selectedItemCount {
    return _cartItems.values.where((item) => item.isSelected).length;
  }

  List<CartItem> get cartItems {
    return _cartItems.values.toList();
  }

  List<CartItem> get selectedCartItems {
    final selectedItems =
        _cartItems.values.where((item) => item.isSelected).toList();
    return selectedItems;
  }

  Iterable<MapEntry<String, CartItem>> get cartItemEntries {
    return {..._cartItems}.entries;
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in _cartItems.values) {
      if (item.isSelected) {
        total += item.price * item.quantity;
      }
    }
    return total;
  }

  double get discountAmount {
    double discount = 0.0;
    for (var item in _cartItems.values) {
      double salesOffRate = item.salesOff;
      discount += item.price * item.quantity * salesOffRate;
    }
    return discount;
  }

  double get shippingFee {
    return 24000;
  }

  Future<void> fetchAllCartItems() async {
    final cartItems = await _cartService.fetchAllCartItems();

    for (final cartItem in cartItems) {
      _cartItems.putIfAbsent(cartItem.productId, () => cartItem);
    }
    notifyListeners();
  }

  Future<void> addCartItem(CartItem cartItem) async {
    CartItem? newCartItem;

    if (_cartItems.containsKey(cartItem.productId)) {
      CartItem? curCartItem = _cartItems[cartItem.productId];

      newCartItem = await _cartService.updateCartItem(
        curCartItem!.copyWith(
          quantity: curCartItem.quantity + cartItem.quantity,
        ),
      );
    } else {
      newCartItem = await _cartService.addCartItem(cartItem);
    }

    if (newCartItem != null) {
      _cartItems[newCartItem.productId] = newCartItem;
      notifyListeners();
    }
  }

  // decrease quantity
  Future<void> removeCartItem(String productId) async {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    CartItem? cartItem = _cartItems[productId];

    if (cartItem!.quantity > 1) {
      CartItem? newCartItem = await _cartService.updateCartItem(
        cartItem.copyWith(quantity: cartItem.quantity - 1),
      );
      if (newCartItem != null) {
        _cartItems[productId] = newCartItem;
        notifyListeners();
      }
    } else {
      bool result = await _cartService.clearCartItem(cartItem.id!);
      if (result) {
        _cartItems.remove(productId);
        notifyListeners();
      }
    }
  }

  Future<void> deleteCartItem(String productId) async {
    if (!_cartItems.containsKey(productId)) {
      return;
    }

    final bool result = await _cartService.clearCartItem(
      _cartItems[productId]!.id!,
    );
    if (result) {
      _cartItems.remove(productId);
      notifyListeners();
    }
  }

  Future<void> clearAllCartItems() async {
    final bool result = await _cartService.clearAllCartItems();
    if (result) {
      _cartItems.clear();
      notifyListeners();
    }
  }

  int getQuantityByProductId(String productId) {
    if (_cartItems.containsKey(productId)) {
      return _cartItems[productId]!.quantity;
    }
    return 0;
  }

  Future<void> toggleCartItemSelection(String productId) async {
    if (!_cartItems.containsKey(productId)) {
      return;
    }
    CartItem? cartItem = _cartItems[productId];
    CartItem? newCartItem = await _cartService.updateCartItem(
      cartItem!.copyWith(isSelected: !cartItem.isSelected),
    );
    if (newCartItem != null) {
      _cartItems[productId] = newCartItem;
      notifyListeners();
    }
  }

  bool isSelected(String productId) {
    if (_cartItems.containsKey(productId)) {
      return _cartItems[productId]!.isSelected;
    }
    return false;
  }

  void toggleSelectedAllCartItems(bool value) {
    for (var item in _cartItems.values) {
      if (item.isSelected != value) {
        toggleCartItemSelection(item.productId);
      }
    }
  }

  bool isSelectingAllItems() {
    if (_cartItems.isEmpty) {
      return false;
    }
    for (var item in _cartItems.values) {
      if (!item.isSelected) {
        return false;
      }
    }
    return true;
  }

  void removeSelectedCartItems() {
    for (var item in _cartItems.values) {
      if (item.isSelected) {
        deleteCartItem(item.productId);
      }
    }
    notifyListeners();
  }
}
