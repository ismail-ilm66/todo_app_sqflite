import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_sqflite/models/task.dart';
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

  Future<int> addTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.insert(
        DatabaseKeys.dbTable,
        task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        DatabaseKeys.dbTable,
        task.toJson(),
        where: 'id= ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<int> removeTask(Task task) async {
    final db = await database;
    return db.transaction((txn) async {
      return await txn.delete(
        DatabaseKeys.dbTable,
        where: 'id= ?',
        whereArgs: [task.id],
      );
    });
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> data = await db.query(
      DatabaseKeys.dbTable,
      orderBy: "id DESC",
    );

    return List.generate(data.length, (index) => Task.fromJson(data[index]));
  }
}
