import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:woocommerce/models/products.dart';
import '../Style/CustomColor.dart' as customColor;
import '../widgets/ExpandableView.dart';
import '../widgets/ProductItemGapMixer.dart';
import 'package:provider/provider.dart';
import '../widgets/ContentBottomSheet.dart';

class CartsScreen extends StatefulWidget {
  static const String routeName = "carts-screen";

  @override
  _CartsScreenState createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  final _globalKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController _controller;

  @override
  void initState() {
    super.initState();
  }

  void makeBottomBarReactive() {
    if (_controller != null) {
      _controller.setState(() => {});
    }
  }

  Widget showBottomBar(WooProduct product) {
    _controller = _globalKey.currentState
        .showBottomSheet((context) => ContentBottomSheet(product, product.id));
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final List<WooProduct> products =
        Provider.of<AuthProvider>(context, listen: false)
            .selectedItems
            .toSet()
            .toList();
    final size = MediaQuery.of(context).size;
    if (products.length != 0)
      Future.delayed(Duration.zero, () => showBottomBar(products[0]));
    return Scaffold(
      key: _globalKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: customColor.colorPinkish),
        title: Text("Shopping Bag"),
      ),
      body: Consumer<AuthProvider>(
        builder: (ctx, auth, _) {
          return Column(
            children: [
              ExpandableView(),
              Container(
                height: size.height / 17,
                width: double.infinity,
                color: customColor.colorBlack,
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_4_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Regular Items",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ...auth.selectedItems
                              .toSet()
                              .toList()
                              .map((product) => ProductItemGapMixer(
                                    wooProduct: product,
                                    updateView: makeBottomBarReactive,
                                  ))
                              .toList()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
