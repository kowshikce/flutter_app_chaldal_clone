import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget trailling;
  final bool useFa;

  DrawerMenuItem({this.icon, this.label, this.trailling, this.useFa = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: useFa
          ? FaIcon(
              icon,
              color: Colors.white,
              size: 28,
            )
          : Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
        maxLines: 1,
      ),
      trailing: trailling != null ? trailling : null,
    );
  }
}
