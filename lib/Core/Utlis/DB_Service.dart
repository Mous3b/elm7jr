import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbService {
  static final DbService _instance = DbService._internal();
  Database? _database;

  factory DbService() {
    return _instance;
  }

  DbService._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initializeDB();
    return _database!;
  }

  Future<Database> _initializeDB() async {
    // Get the path to the local data directory
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, "Elmo5tarDB.db");

    // Check if the database already exists
    bool exists = await File(dbPath).exists();

    if (!exists) {
      // Copy the database from assets
      ByteData data = await rootBundle.load('assets/database/Elmo5tarDB.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write the database file to the local directory
      await File(dbPath).writeAsBytes(bytes);
      log("database done");
    }

    // Open the database
    return await openDatabase(dbPath);
  }

  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
    }
  }

  Future<int> insert({
    required String table,
    required Map<String, Object?> values,
  }) async {
    return await _database!.insert(table, values);
  }

  Future<int> update({
    required String table,
    required Map<String, Object?> values,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    return await _database!.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> delete({
    required String table,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    return await _database!.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<List<Map<String, dynamic>>> select({
    required String table,
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
  }) async {
    return await _database!.query(
      table,
      where: where,
      whereArgs: whereArgs,
      orderBy: orderBy,
      limit: limit,
    );
  }
}
