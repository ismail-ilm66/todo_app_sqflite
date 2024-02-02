import 'package:flutter/cupertino.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';

class SimpleWhiteText extends StatelessWidget {
  const SimpleWhiteText({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
  });

  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    var color = DefaultAppSettings.getColorScheme(context);

    return Text(
      text,
      style: DefaultAppSettings.getTextTheme(context).headlineSmall!.copyWith(
          fontSize: fontSize ?? 20,
          fontWeight: fontWeight ?? FontWeight.normal,
          color: color.surface),
    );
  }
}
