import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';
import 'package:todo_app_sqflite/widgets/circle_category_icon_viewer.dart';
import 'package:todo_app_sqflite/widgets/common_container.dart';
import 'package:todo_app_sqflite/widgets/task_details.dart';

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
    final double backgroundOpacity = isCompletedTasksList ? 0.1 : 0.3;
    final TextDecoration textDecoration =
        isCompletedTasksList ? TextDecoration.lineThrough : TextDecoration.none;
    final FontWeight fontWeight =
        isCompletedTasksList ? FontWeight.normal : FontWeight.bold;

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
                return InkWell(
                  onLongPress: () {
                    //Implementation of deleting the task
                  },
                  onTap: () async {
                    //Here We will show the Details of the task
                    await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return TaskDetails(task: tasks[index]);
                        });
                  },
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleIconView(
                          colorCircle: tasks[index]
                              .taskCategory
                              .color
                              .withOpacity(backgroundOpacity),
                          colorIcon: tasks[index]
                              .taskCategory
                              .color
                              .withOpacity(iconOpacity),
                          icon: tasks[index].taskCategory.icon,
                        ),
                        title: Text(
                          tasks[index].title,
                          style: DefaultAppSettings.getTextTheme(context)
                              .titleMedium!
                              .copyWith(
                                decoration: textDecoration,
                                fontSize: 20,
                                fontWeight: fontWeight,
                              ),
                        ),
                        subtitle: Text(tasks[index].time),
                        trailing: Checkbox(
                          value: tasks[index].isCompleted,
                          onChanged: (value) {},
                        ),
                      ),
                      const Divider(
                        thickness: 1.5,
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
