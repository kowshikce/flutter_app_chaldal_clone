import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Style/CustomColor.dart' as customColor;
import '../drawer/CustomDrawer.dart';
import '../widgets/ProductItem.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            onPressed: () {},
            color: customColor.colorPinkish,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  if (index == 0)
                    return SizedBox(
                      height: 5,
                    );
                  return Column(
                    children: [ProductItem(), Divider()],
                  );
                },
                itemCount: 12,
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Color(0xFFc73140),
                        child: Center(
                          child: Text(
                            "\$66",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
