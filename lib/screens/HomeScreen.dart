import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:flutter_app_chaldal_clone/screens/CartScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woocommerce/models/products.dart';
import '../Style/CustomColor.dart' as customColor;
import '../drawer/CustomDrawer.dart';
import '../widgets/ProductItem.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;
  List<WooProduct> products = [];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<AuthProvider>(context, listen: false)
          .getProducts()
          .then((value) => setProducts(value));
      _isInit = false;
    }
  }

  void setProducts(List<WooProduct> product) {
    setState(() {
      products = product;
    });
  }

  int getTotalAmount(List<int> items) {
    var _totalAmount = 0;
    for (var i in items) {
      _totalAmount = _totalAmount + i;
    }
    return _totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: customColor.colorPinkish),
        title: Text("Popular"),
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
            onPressed: () {
              Navigator.of(context).pushNamed(CartsScreen.routeName);
            },
            color: customColor.colorPinkish,
          )
        ],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  flex: 18,
                  child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (ctx, index) {
                        if (index == 0)
                          return SizedBox(
                            height: 5,
                          );
                        return Column(
                          children: [
                            ProductItem(products[index], null),
                            Divider()
                          ],
                        );
                      },
                      itemCount: products.length,
                    ),
                  ),
                ),
                Consumer<AuthProvider>(
                  builder: (ctx, auth, _) => auth.selectedItems.isEmpty
                      ? Expanded(
                          flex: 0,
                          child: SizedBox.shrink(),
                        )
                      : Expanded(
                          flex: 2,
                          child: Container(
                            color: Color(0xFFff666b),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    color: Color(0xFFff666b),
                                    child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: Color(0xFFc73140),
                                      padding: EdgeInsets.all(5),
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Text(
                                            "\$ ${getTotalAmount(auth.selectedItems.map((e) => int.parse(e.price)).toList())}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),
      drawer: CustomDrawer(),
    );
  }
}
