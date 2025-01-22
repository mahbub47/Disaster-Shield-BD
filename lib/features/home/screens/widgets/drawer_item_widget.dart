import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget({
    super.key, required this.icon, required this.label, required this.ontap,
  });

  final IconData icon;
  final String label;
  final GestureTapCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: ontap,
    );
  }
}