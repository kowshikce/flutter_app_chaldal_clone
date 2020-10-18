import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 12,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              "https://toppng.com/uploads/preview/eggs-png-clipart-chicken-e-11563643842otykfobhtk.png",
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
                            "Chicken Eggs (Layer)",
                          ),
                        ),
                        Text("12 pcs")
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
                                  "\$119",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12),
                                ),
                                Text(
                                  "\$66",
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
                                  IconButton(
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
