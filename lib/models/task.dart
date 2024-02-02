import 'package:equatable/equatable.dart';
import 'package:todo_app_sqflite/utilities/task_categories.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategories taskCategory;
  Task(
    this.taskCategory, {
    required this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, note, time, date, isCompleted];
}
