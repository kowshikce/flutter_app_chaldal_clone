import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';

class AuthProvider extends ChangeNotifier {
  String _flatConsumerKey = "";
  String _flatConsumerSecret = "";
  String _flatBaseUrl = "";
  WooCommerce wooCommerce;
  List<WooProduct> _products = [];
  List<WooProduct> _selectedProducts = [];

  List<WooProduct> get selectedItems {
    return [..._selectedProducts];
  }

  AuthProvider() {
    wooCommerce = WooCommerce(
        baseUrl: _flatBaseUrl,
        consumerKey: _flatConsumerKey,
        consumerSecret: _flatConsumerSecret);
  }

  Future<List<WooProduct>> getProducts() async {
    final featuredProduct = await wooCommerce.getProducts();
    _products = featuredProduct;
    return [..._products];
  }

  int productAmountByNumber(int id) {
    int numbers = _selectedProducts
        .where((e) {
          return e.id == id;
        })
        .toList()
        .length;
    return numbers;
  }

  void removeOnSelectedProducts(WooProduct product) {
    var _indexOfLast = _selectedProducts
        .lastIndexWhere((element) => element.hashCode == product.hashCode);
    _selectedProducts.removeAt(_indexOfLast);
    notifyListeners();
  }

  void addOnSelectedProducts(WooProduct product) {
    _selectedProducts.add(product);
    notifyListeners();
  }
}
