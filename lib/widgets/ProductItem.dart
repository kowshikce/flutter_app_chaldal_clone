import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/models/products.dart';

class ProductItem extends StatefulWidget {
  final WooProduct wooProduct;

  ProductItem(this.wooProduct);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int _productAmount = Provider.of<AuthProvider>(context, listen: false)
        .productAmountByNumber(widget.wooProduct.id);
    return Container(
      height: size.height / 12,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              widget.wooProduct.images[0].src,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Text("${widget.wooProduct.name}"),
                        ),
                        Text(
                          "${widget.wooProduct.stockStatus.toLowerCase()}",
                          style: TextStyle(
                              color: widget.wooProduct.stockStatus == 'instock'
                                  ? Colors.green
                                  : Colors.red),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${widget.wooProduct.regularPrice}",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12),
                                ),
                                Text(
                                  "\$86",
                                  style: TextStyle(
                                      color: Color(0xFFff666b),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.horseHead,
                                  size: 14,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _productAmount == 0
                                      ? SizedBox.shrink()
                                      : IconButton(
                                          onPressed: () {
                                            Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                .removeOnSelectedProducts(
                                                    widget.wooProduct);
                                          },
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color: Color(0xFFff666b),
                                          ),
                                        ),
                                  _productAmount == 0
                                      ? SizedBox.shrink()
                                      : Container(
                                          width: 25,
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: FittedBox(
                                              child: Text(
                                            "$_productAmount",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          )),
                                        ),
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .addOnSelectedProducts(
                                              widget.wooProduct);
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Color(0xFFff666b),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
