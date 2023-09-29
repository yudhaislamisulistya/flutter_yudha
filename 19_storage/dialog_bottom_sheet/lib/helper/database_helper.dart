import 'package:dialog_bottom_sheet/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database!;
  }

  final String tableName = "tasks";

  Future<Database> _initializeDB() async {
    var db = await openDatabase(
      'tasks_db.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          taskName TEXT
        )''');
      },
    );

    return db;
  }

  Future<void> insertTask(TaskModel taskModel) async {
    final Database db = await database;
    await db.insert(tableName, taskModel.toMap());
  }

  Future<List<TaskModel>> getTasks() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(tableName);
    return results.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<TaskModel> getTaskById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    return TaskModel.fromMap(results.first);
  }

  Future<void> updateTask(TaskModel taskModel) async {
    final Database db = await database;
    await db.update(
      tableName,
      taskModel.toMap(),
      where: "id = ?",
      whereArgs: [taskModel.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final Database db = await database;
    await db.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
