import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DbServices {
  static Future<Database> initializeDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    Database db = await openDatabase(
      'expense_db.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE category (category_id integer PRIMARY KEY,category_name text NOT NULL,category_type text NOT NULL); CREATE TABLE expense (id integer PRIMARY KEY,amount REAL NOT NULL,FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION,notes TEXT NOT NULL,date TEXT NOT NULL);');
      },
    );
    return db;
  }

  static const String categoryTable = "category";
  static const String expenseTable = "expense";
}
