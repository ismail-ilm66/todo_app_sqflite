import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/utilities/task_categories.dart';

final categoryProvider = StateProvider<TaskCategories>((ref) {
  return TaskCategories.others;
});
