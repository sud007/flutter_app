import 'package:flutter/cupertino.dart';
import 'package:flutterapp/model/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();

  String tblName = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDesc = "description";
  String colDate = "date";
  String colPriority = "priority";

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initDb();
    }

    return _db;
  }

  Future<Database> initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todos.db";

    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tblName($colId INTEGER PRIMARY KEY, $colTitle TEXT, " +
            "$colDesc TEXT, $colPriority INTEGER, $colDate TEXT)");
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.insert(tblName, todo.toMap());
    debugPrint("insertTodo ${result.toString()}");

    return result;
  }

  Future<int> udpateTodo(Todo todo) async {
    Database db = await this.db;
    var result = await db.update(tblName, todo.toMap(),
        where: "$colId = ?", whereArgs: [todo.id]);

    return result;
  }

  Future<List> getTodos() async {
    Database db = await this.db;
    var result =
        await db.rawQuery("SELECT * FROM $tblName order by $colPriority ASC");
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
        await db.rawQuery("SELECT COUNT (*) FROM $tblName"));

    return result;
  }

  Future<int> deleteToDo(int id) async {
    int result;
    var db = await this.db;
    result = await db.rawDelete('DELETE FROM $tblName WHERE $colId = $id');
    return result;
  }
}
