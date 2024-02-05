import 'package:todo_app_sqflite/utilities/application_keys.dart';

class DatabaseKeys {
  DatabaseKeys._();

  static const String dbTable = 'tasks';
  static const String columnId = AppKeys.id;
  static const String columnTitle = AppKeys.title;
  static const String columnNote = AppKeys.note;
  static const String columnTime = AppKeys.time;
  static const String columnDate = AppKeys.date;
  static const String columnIsCompleted = AppKeys.isCompleted;
  static const String columnTaskCategory = AppKeys.taskCategory;
}
