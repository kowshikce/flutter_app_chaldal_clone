import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  List<String> _item = [];

  List<String> get item {
    return [..._item];
  }
}
