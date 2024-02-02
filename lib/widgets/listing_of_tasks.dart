import 'package:flutter/cupertino.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';
import 'package:todo_app_sqflite/widgets/common_container.dart';
import 'package:todo_app_sqflite/widgets/simple_white_text.dart';

class ListOfTask extends StatelessWidget {
  const ListOfTask({
    super.key,
    required this.tasks,
    required this.isCompletedTasksList,
  });
  final List<Task> tasks;
  final bool isCompletedTasksList;

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = DefaultAppSettings.getDeviceSize(context);
    var height = isCompletedTasksList
        ? deviceDimensions.height * 0.25
        : deviceDimensions.height * 0.3;
    final noTaskMessage = isCompletedTasksList
        ? 'No Task Has Been Completed Yet'
        : 'No Task Has Been Added Yet';
    return CommonContainer(
      height: height,
      child: tasks.length == 0
          ? Center(
              child: Text(
                noTaskMessage,
                textAlign: TextAlign.center,
                style: DefaultAppSettings.getTextTheme(context).headlineSmall,
              ),
            )
          : ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text("Hello");
              },
            ),
    );
  }
}
