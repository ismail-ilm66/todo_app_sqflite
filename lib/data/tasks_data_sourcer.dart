import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    await db.execute('CREATE TABLE TASK');
  }
}
