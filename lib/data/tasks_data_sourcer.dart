import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_sqflite/utilities/database_keys.dart';

class TasksDataSource {
  static final TasksDataSource _instance = TasksDataSource._();

  factory TasksDataSource() => _instance;

  TasksDataSource._() {
    _initdb();
  }

  static Database? _database;
  Future<Database> get database async {
    _database ??= await _initdb();
    return _database!;
  }

  Future<Database> _initdb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tasks.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE ${DatabaseKeys.dbTable} (${DatabaseKeys.columnId} INTEGER PRIMARY KEY AUTOINCREMENT 
      ,${DatabaseKeys.columnTitle} TEXT ,
      ${DatabaseKeys.columnTaskCategory} TEXT ,
      ${DatabaseKeys.columnNote} TEXT ,
      ${DatabaseKeys.columnTime} TEXT ,
      ${DatabaseKeys.columnDate} TEXT ,
      ${DatabaseKeys.columnIsCompleted} INTEGER ,
    

      )''',
    );
  }
}
