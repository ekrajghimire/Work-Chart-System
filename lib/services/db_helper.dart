import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static const String userTable = 'users';
  static const String taskTable = 'tasks';

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    _db = await openDatabase(
      join(await getDatabasesPath(), 'work_chart.db'),
      onCreate: (db, version) async {
        // Create Users Table
        await db.execute('''
          CREATE TABLE $userTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT,
            role TEXT
          )
        ''');
        // Create Tasks Table
        await db.execute('''
          CREATE TABLE $taskTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            assignedTo TEXT,
            status TEXT,
            deadline TEXT
          )
        ''');
      },
      version: 1,
    );
    return _db!;
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await getDatabase();
    await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await getDatabase();
    return db.query(table);
  }
}
