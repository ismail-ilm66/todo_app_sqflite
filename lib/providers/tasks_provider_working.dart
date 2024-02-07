import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_sqflite/data/repositories/task_repositories.dart';
import 'package:todo_app_sqflite/models/task.dart';
import 'package:todo_app_sqflite/models/task_state.dart';

class TasksNotifier extends StateNotifier<TaskState> {
  final TaskRepository _repository;
  TasksNotifier(this._repository) : super(const TaskState.initial());

  Future<void> createTask(Task task) async {
    try {
      await _repository.createTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> removeTask(Task task) async {
    try {
      await _repository.deleteTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks() async {
    try {
      final tasks = await _repository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
