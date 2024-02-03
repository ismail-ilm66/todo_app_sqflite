import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';

class SimpleHeading extends StatelessWidget {
  const SimpleHeading({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: DefaultAppSettings.getTextTheme(context)
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
    );
  }
}
