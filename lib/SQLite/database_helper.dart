import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weight_tracking/models/user.dart';

const String fileName = 'weight_tracker.db';
//This class provides access to a SQLite database
//and performs basic database operations such as adding, updating, deleting, and querying users to this database.

class DatabaseHelper {
  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  String userTable = 'users';
  String colId = 'id';
  String colName = 'name';
  String colSurname = 'surname';
  String colEmail = 'email';
  String colPassword = 'password';

  /* static DatabaseHelper get instance {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper!;
  } */
  Future<Database> get database async {
    if (_database != null) {
      try {
        return _database!;
      } catch (e) {
        _database = await initializeDatabase(fileName);
      }
    }
    return _database!;
  }

  Future<Database> initializeDatabase(String fileName) async {
    String path = join(await getDatabasesPath(), fileName);
    var weightTrackerDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return weightTrackerDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $userTable('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colName TEXT NOT NULL, '
        '$colSurname TEXT NOT NULL, '
        '$colEmail TEXT NOT NULL, '
        '$colPassword TEXT NOT NULL)');
  }

  Future<void> insertUser(User user) async {
    try {
      final db = await database;
      await db.insert(userTable, user.toJson());
      print('Kullanıcı başarıyla eklendi');
    } catch (e) {
      print('Hata oluştu: $e');
    }
  }

  Future<List<User?>> getAllUsers() async {
    //Used to list all users
    final db = await instance.database;
    final result = await db.query(userTable);
    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<User?> getUser(String email, String password) async {
    final db = await instance.database;
    final result = await db.rawQuery(
        'SELECT * FROM $userTable WHERE $colEmail = ? AND $colPassword = ?',
        [email, password]);
    if (result.isNotEmpty) {
      return User.fromJson(
          result.first); // İlk satırı alıp User nesnesine dönüştürüyoruz
    } else {
      return null; // Kullanıcı bulunamazsa null döndürüyoruz
    }
  }

  Future<String> updateUser(User user) async {
    try {
      var db = await instance.database;
      int result = await db.update(userTable, user.toJson(),
          where: '$colId = ?', whereArgs: [user.id]);
      if (result != 0) {
        return 'User updated successfully';
      } else {
        return 'User update failed';
      }
    } catch (e) {
      return 'Error updating user: $e';
    }
  }

  Future<String> deleteUser(int id) async {
    try {
      var db = await instance.database;
      int result =
          await db.rawDelete('DELETE FROM $userTable WHERE $colId = ?', [id]);
      if (result != 0) {
        return 'User deleted successfully';
      } else {
        return 'User delete failed';
      }
    } catch (e) {
      return 'Error deleting user: $e';
    }
  }

  Future<int> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $userTable');
    int result = Sqflite.firstIntValue(x)!;
    return result;
  }
}
