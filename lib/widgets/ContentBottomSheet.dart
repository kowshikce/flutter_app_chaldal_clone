import 'package:flutter/material.dart';
import 'package:flutter_app_chaldal_clone/Providers/AuthProvider.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/models/products.dart';

class ContentBottomSheet extends StatefulWidget {
  final WooProduct wooProduct;
  final productAmount;

  ContentBottomSheet(this.wooProduct, this.productAmount);

  @override
  _ContentBottomSheetState createState() => _ContentBottomSheetState();
}

class _ContentBottomSheetState extends State<ContentBottomSheet> {
  int getTotalAmount(List<int> items) {
    var _totalAmount = 0;
    for (var i in items) {
      _totalAmount = _totalAmount + i;
    }
    return _totalAmount;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return GestureDetector(
      onVerticalDragEnd: (_) {},
      child: Container(
        child: auth.selectedItems.isEmpty
            ? SizedBox.shrink()
            : Container(
                color: Color(0xFFff666b),
                height: size.height / 11,
                width: size.width,
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
                          style: TextStyle(color: Colors.white, fontSize: 30),
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
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
