import 'package:flutter/cupertino.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    required this.height,
    required this.child,
  });

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var color = DefaultAppSettings.getColorScheme(context);
    var deviceDimensions = DefaultAppSettings.getDeviceSize(context);

    return Container(
      height: height,
      width: deviceDimensions.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.primaryContainer,
      ),
      child: child,
    );
  }
}
