import 'dart:io';

import 'package:flutter_app_pyco/model/Profile.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "Profile.db"; // Create database name
  static final _databaseVersion = 1; // Create version database
  static final _tableName = "profile"; // Create table name
  static final String _columnId = "id"; // Create field id use save key
  static final String _columnSeed = "seed"; // Create field id use save seed
  static final String _columnTitle =
      "title"; // Create field title use save name
  static final String _columnFirst =
      "first"; // Create field first use save name
  static final String _columnLast = "last"; // Create field last use save name
  static final String _columnEmail =
      "email"; // Create field location use save location
  static final String _columnPicture =
      "large"; // Create field picture use save picture

  DatabaseHelper._privateConstructor(); // Create database singleton
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database _database; // Create database use save data to local

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // Create func open() use create database and open connect to database
  _initDatabase() async {
    //Lấy đường dẫn file data base trong Android và IOS sử dụng thư viện path_provider
    Directory documnetDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnetDirectory.path, _databaseName);
    //Mở database
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //Create database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableName (
       $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
       $_columnSeed TEXT NOT NULL,
       $_columnTitle TEXT NOT NULL,
       $_columnFirst TEXT NOT NULL,
       $_columnLast TEXT NOT NULL,
       $_columnEmail TEXT NULL,
       $_columnPicture TEXT NULL
       )
    ''');
  }

  // Create func saveProfile() use save profile to local
  Future<int> insert(Profile station) async {
    Database db = await database;
    int id = await db.insert(_tableName, station.toMap());
    return id;
  }

  // Create func get All Profile use get all profile on SQLite
  Future<List<Profile>> queryAllStation() async {
    Database db = await database;
    var res = await db.query("profile");
    List<Profile> list =
        res.isNotEmpty ? res.map((c) => Profile.fromMap(c)).toList() : [];
    return list;
  }
}
