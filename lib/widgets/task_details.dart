import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/utilities/utils.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: task.taskCategory.color.withOpacity(0.3),
            radius: 25,
            child: Icon(
              task.taskCategory.icon,
              color: task.taskCategory.color.withOpacity(0.9),
            ),
          ),
          const Gap(10),
          Text(
            task.title,
            style: DefaultAppSettings.getTextTheme(context)
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 23),
          ),
          Text(
            task.time,
            style: DefaultAppSettings.getTextTheme(context)
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap(20),
          Visibility(
            visible: !task.isCompleted,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Task to be Completed On ${task.date}',
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.check_box,
                      color: task.taskCategory.color,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.taskCategory.color,
          ),
          const Gap(5),
          Text(
            task.note.isEmpty
                ? 'There is no Additional Description Added For the Task..'
                : task.note,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Task Completed On ${task.date}',
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
