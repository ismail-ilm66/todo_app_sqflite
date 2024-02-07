import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/models/task_state.dart';
import 'package:todo_app_sqflite/providers/task_repositories_provider.dart';
import 'package:todo_app_sqflite/providers/tasks_provider_working.dart';

final taskProvider = StateNotifierProvider<TasksNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositories);
  return TasksNotifier(repository);
});
