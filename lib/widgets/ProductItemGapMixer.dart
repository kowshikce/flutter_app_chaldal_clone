import 'package:flutter/material.dart';
import 'package:woocommerce/models/products.dart';
import '../widgets/ProductItem.dart';

class ProductItemGapMixer extends StatelessWidget {
  final WooProduct wooProduct;
  final Function updateView;

  ProductItemGapMixer({this.wooProduct, this.updateView});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductItem(wooProduct, updateView),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
