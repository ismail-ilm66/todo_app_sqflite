import 'package:flutter/material.dart';

class DefaultAppSettings {
  const DefaultAppSettings._();

  static ThemeData getThemeData(BuildContext context) {
    return Theme.of(context);
  }

  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static Size getDeviceSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }
}
