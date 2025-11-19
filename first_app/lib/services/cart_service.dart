import 'package:first_app/models/product.dart';
import 'package:flutter/foundation.dart';

class CartService extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0.0, (sum, product) => sum + product.price);
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
