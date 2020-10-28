import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:woocommerce/models/products.dart';
import '../Style/CustomColor.dart' as customColor;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html_view/flutter_html_text.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/ContentBottomSheet.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "product-details-screen";

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _globalKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _controller;

  @override
  void initState() {
    super.initState();
  }

  Widget showBottomBar(WooProduct product) {
    _controller = _globalKey.currentState
        .showBottomSheet((context) => ContentBottomSheet(product, product.id));
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wooProduct = ModalRoute.of(context).settings.arguments as WooProduct;
    final preAuth = Provider.of<AuthProvider>(context, listen: false);
    if (preAuth.selectedItems.length != 0)
      Future.delayed(Duration.zero, () {
        showBottomBar(wooProduct);
      });
    return Scaffold(
      key: _globalKey,
      appBar: wooProduct != null
          ? AppBar(
              iconTheme: IconThemeData(color: customColor.colorPinkish),
              title: Text(wooProduct.name),
              actions: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.search,
                  ),
                  onPressed: () {},
                  color: customColor.colorPinkish,
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.shoppingBasket,
                  ),
                  onPressed: () {},
                  color: customColor.colorPinkish,
                )
              ],
            )
          : AppBar(
              iconTheme: IconThemeData(color: customColor.colorPinkish),
              title: Text("NoProducts"),
              actions: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.search,
                  ),
                  onPressed: () {},
                  color: customColor.colorPinkish,
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.shoppingBasket,
                  ),
                  onPressed: () {},
                  color: customColor.colorPinkish,
                )
              ],
            ),
      body: wooProduct != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 5,
                        viewportFraction: 1.0,
                      ),
                      items: wooProduct.images.map((e) {
                        return Builder(
                          builder: (ctx) => Container(
                            width: size.width,
                            child: Image.network(
                              e.src,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        child: Text(
                          wooProduct.name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Container(
                        color: Colors.purple[500],
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.zero,
                              width: size.width / 3,
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10, right: 10),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: RatingBar(
                                  initialRating:
                                      wooProduct.ratingCount.toDouble(),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (ctx, _) => Icon(Icons.star,
                                      color: Color(0xFFfdd670)),
                                  onRatingUpdate: (_) {},
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 10, bottom: 10, right: 10),
                              child: Text(
                                wooProduct.stockStatus,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: wooProduct.stockStatus == "instock"
                                        ? Colors.white
                                        : Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Text("\$ ${wooProduct.price}",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 30,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 20, top: 10, bottom: 10),
                                child: Text("\$ ${wooProduct.salePrice}",
                                    style: TextStyle(
                                        color: Color(0xFFff666b),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500)),
                              )
                            ],
                          ),
                          Consumer<AuthProvider>(builder: (ctx, auth, _) {
                            return FittedBox(
                              child: Row(
                                children: [
                                  auth.productAmountByNumber(wooProduct.id) == 0
                                      ? SizedBox.shrink()
                                      : IconButton(
                                          icon: Icon(
                                            Icons.remove_circle_outline,
                                            color: Color(0xFFff666b),
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                .removeOnSelectedProducts(
                                                    wooProduct);
                                            _controller.setState(() {});
                                          },
                                        ),
                                  auth.productAmountByNumber(wooProduct.id) == 0
                                      ? SizedBox.shrink()
                                      : Text(
                                          "${auth.productAmountByNumber(wooProduct.id)}",
                                          style: const TextStyle(fontSize: 24),
                                        ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Color(0xFFff666b),
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .addOnSelectedProducts(wooProduct);
                                      if (_controller == null) {
                                        showBottomBar(wooProduct);
                                        return;
                                      }
                                      _controller.setState(() {});
                                    },
                                  )
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        child: HtmlView(
                          data: wooProduct.description,
                          scrollable: false,
                          padding: EdgeInsets.only(left: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            )
          : Container(
              child: Center(
                child: Text("Product Not Found!"),
              ),
            ),
    );
  }
}
