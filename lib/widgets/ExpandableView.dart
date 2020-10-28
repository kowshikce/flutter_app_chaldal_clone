import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Style/CustomColor.dart' as customColor;

class ExpandableView extends StatefulWidget {
  @override
  _ExpandableViewState createState() => _ExpandableViewState();
}

class _ExpandableViewState extends State<ExpandableView> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final expandedSize = size.height / 14;
    final defaultExpandedSize = size.height / 12;
    final realisticSize = size.height / 17;
    return Container(
      height: _isExpanded ? expandedSize : 2 * expandedSize,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "You Saved \$ 1!",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: -1.0),
                  ),
                  Text(
                    "Have a Discount Code?",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        letterSpacing: 0.8),
                  )
                ],
              ),
              IconButton(
                icon: Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down_outlined,
                  color: customColor.colorPinkish,
                ),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            ],
          ),
          if (!_isExpanded)
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              height: realisticSize,
              width: size.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 7,
                    child: TextField(
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.bottom,
                      maxLines: 1,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                          hintText: "Apply Cupon",
                          hintMaxLines: 1,
                          hintStyle: TextStyle(color: Colors.black87),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: customColor.colorPinkish,
                          border: Border.all(
                              width: 3.0,
                              color: customColor.colorPinkish,
                              style: BorderStyle.solid)),
                      child: FlatButton(
                          onPressed: () {},
                          color: customColor.colorPinkish,
                          child: FittedBox(
                              child: Text(
                            "Apply",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ))),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
