import 'package:todo_app_sqflite/data/tasks_data_sourcer.dart';
import 'package:todo_app_sqflite/models/task.dart';

abstract class TaskRepository {
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
  Future<List<Task>> getAllTasks();
}

class TaskRepositoriesImpl implements TaskRepository {
  final TasksDataSource _dataSource;
  TaskRepositoriesImpl(this._dataSource);
  @override
  Future<void> createTask(Task task) async {
    try {
      await _dataSource.addTask(task);
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _dataSource.removeTask(task);
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _dataSource.getAllTasks();
    } catch (e) {
      throw ('$e');
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _dataSource.updateTask(task);
    } catch (e) {
      throw ('$e');
    }
  }
}
