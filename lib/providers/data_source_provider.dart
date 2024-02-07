import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/data/tasks_data_sourcer.dart';

final dataSourceProvider = Provider<TasksDataSource>((ref) {
  return TasksDataSource();
});
