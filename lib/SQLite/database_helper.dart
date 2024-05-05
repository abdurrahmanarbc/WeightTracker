import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static final DatabaseHelper ins = DatabaseHelper._();
  late Database _database;
  DatabaseHelper._();

  String userTable = 'user_table';
  String colId = 'id';
  String colName = 'name';
  String colSurname = 'surname';
  String colEmail = 'email';
  String colPassword = 'password';
  String colWeight = 'weight';
  String colGoalWeight = 'goal_weight';
  String colHeight = 'height';

  DatabaseHelper._createInstance();

 static DatabaseHelper get instance {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'weight_tracker.db');
    var weightTrackerDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return weightTrackerDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $userTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colName TEXT NOT NULL, '
        '$colSurname TEXT NOT NULL, '
        '$colEmail TEXT NOT NULL, '
        '$colPassword TEXT NOT NULL, '
        '$colWeight REAL NOT NULL, '
        '$colGoalWeight REAL, '
        '$colHeight REAL NOT NULL)');
  }

  Future<int> insertUser(Map<String, dynamic> userData) async {
  Database db = await this.database;
  var result = await db.insert(userTable, userData);
  return result;
}


  Future<List<Map<String, dynamic>>> getUser(String email, String password) async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $userTable WHERE $colEmail = ? AND $colPassword = ?', [email, password]);
    return result;
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    var db = await this.database;
    var result = await db.update(userTable, user, where: '$colId = ?', whereArgs: [user[colId]]);
    return result;
  }

  Future<int> deleteUser(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $userTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $userTable');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }
}
