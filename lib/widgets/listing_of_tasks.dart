import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';
import 'package:todo_app_sqflite/widgets/common_container.dart';

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
    final double iconOpacity = isCompletedTasksList ? 0.3 : 0.5;
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
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: tasks[index]
                              .taskCategory
                              .color
                              .withOpacity(iconOpacity),
                          child: Icon(
                            tasks[index].taskCategory.icon,
                            color: tasks[index].taskCategory.color,
                          )),
                      title: Text(tasks[index].title),
                      subtitle: Text(tasks[index].time),
                      trailing: Checkbox(
                        value: tasks[index].isCompleted,
                        onChanged: (value) {},
                      ),
                    ),
                    Divider(
                      thickness: 1.5,
                    )
                  ],
                );
              },
            ),
    );
  }
}
