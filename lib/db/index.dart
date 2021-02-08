import 'dart:core';
// import 'dart:io';
import 'package:path/path.dart';
import 'package:renda_clone/models/user.dart';
// import 'package:renda_clone/models/users.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class UserDatabase {
  UserDatabase._();

  static final UserDatabase db = UserDatabase._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    String path = join(await getDatabasesPath(), "user.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
      CREATE TABLE users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first INTEGER,
          second INTEGER,
          third INTEGER,
          name TEXT
          ) """);
    });
  }

  Future<int> addToDatabase(User user) async {
    final db = await database;
    var a = db.insert("users", user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return a;
  }

  Future<User> getUsersByName(String name) async {
    final db = await database;
    var response =
        await db.query("users", where: "name = ?", whereArgs: [name]);
    return response.isNotEmpty ? User.fromMap(response.first) : null;
  }

  Future<List<User>> getFullUsers() async {
    final db = await database;
    var response = await db.query("users");
    List<User> list = response.isNotEmpty
        ? response.map((e) => User.fromMap(e)).toList()
        : [];
    return list;
  }

  void deleteAll() async {
    final db = await database;
    await db.delete("users");
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    var response = db.update('users', user.toMap(),
        where: 'name = ?', whereArgs: [user.name]);
    return response;
  }
}
