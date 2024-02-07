import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/data/repositories/task_repositories.dart';
import 'package:todo_app_sqflite/providers/data_source_provider.dart';

final taskRepositories = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(dataSourceProvider);
  return TaskRepositoriesImpl(datasource);
});
