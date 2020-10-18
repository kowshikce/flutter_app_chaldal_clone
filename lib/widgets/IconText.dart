import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  final IconData icons;
  final String text;
  final Color color;

  IconText({this.icons, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: Icon(
              icons,
              color: Colors.white,
              size: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 20,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
