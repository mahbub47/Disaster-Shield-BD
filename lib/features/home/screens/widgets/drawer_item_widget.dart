import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  DrawerItemWidget({
    super.key, required this.icon, required this.label, required this.ontap, this.color
  });

  final IconData icon;
  final String label;
  final GestureTapCallback ontap;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(label),
      onTap: ontap,
    );
  }
}