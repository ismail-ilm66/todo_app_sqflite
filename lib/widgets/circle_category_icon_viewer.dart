import 'package:flutter/material.dart';

class CircleIconView extends StatelessWidget {
  const CircleIconView(
      {super.key,
      required this.colorCircle,
      required this.colorIcon,
      required this.icon});
  final Color colorCircle;
  final Color colorIcon;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: colorCircle,
      child: Icon(
        icon,
        color: colorIcon,
      ),
    );
  }
}
