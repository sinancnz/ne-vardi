import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _products = [];
  final _uuid = const Uuid();

  List<Product> get products {
    _products.sort((a, b) => a.expiry.compareTo(b.expiry));
    return List.unmodifiable(_products);
  }

  void addProduct(String name, int quantity, DateTime expiry) {
    _products.add(Product(
        id: _uuid.v4(), name: name, quantity: quantity, expiry: expiry));
    notifyListeners();
  }

  void removeProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
