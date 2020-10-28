import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:flutter_app_chaldal_clone/screens/ProductDetailScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/models/products.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/ContentBottomSheet.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  final WooProduct wooProduct;
  final Function _updateView;

  ProductItem(this.wooProduct, this._updateView);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int _productAmount = Provider.of<AuthProvider>(context)
        .productAmountByNumber(widget.wooProduct.id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: widget.wooProduct);
      },
      child: Container(
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
                            child: Text(
                              "${widget.wooProduct.name}",
                              style: const TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "${widget.wooProduct.stockStatus.toLowerCase()}",
                            style: TextStyle(
                                color:
                                    widget.wooProduct.stockStatus == 'instock'
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: RatingBar(
                                          initialRating: widget
                                              .wooProduct.ratingCount
                                              .toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (ctx, _) => Icon(
                                              Icons.star,
                                              color: Color(0xFFfdd670)),
                                          onRatingUpdate: (_) {},
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        "\$${widget.wooProduct.price}",
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(
                                      child: Text(
                                        "\$${widget.wooProduct.salePrice}",
                                        style: TextStyle(
                                            color: Color(0xFFff666b),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _productAmount == 0
                                          ? SizedBox.shrink()
                                          : Center(
                                              child: FittedBox(
                                              child: IconButton(
                                                onPressed: () {
                                                  Provider.of<AuthProvider>(
                                                          context,
                                                          listen: false)
                                                      .removeOnSelectedProducts(
                                                          widget.wooProduct);
                                                  if (widget._updateView !=
                                                      null) {
                                                    widget._updateView();
                                                  }
                                                },
                                                icon: Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Color(0xFFff666b),
                                                  size: 35,
                                                ),
                                              ),
                                            )),
                                      _productAmount == 0
                                          ? SizedBox.shrink()
                                          : Center(
                                              child: Container(
                                                width: 25,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: FittedBox(
                                                    child: Center(
                                                  child: Text(
                                                    "$_productAmount",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10),
                                                  ),
                                                )),
                                              ),
                                            ),
                                      Center(
                                        child: FittedBox(
                                          child: IconButton(
                                            onPressed: () {
                                              Provider.of<AuthProvider>(context,
                                                      listen: false)
                                                  .addOnSelectedProducts(
                                                      widget.wooProduct);
                                              if (widget._updateView != null) {
                                                widget._updateView();
                                              }
                                            },
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              color: Color(0xFFff666b),
                                              size: 35,
                                            ),
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
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
