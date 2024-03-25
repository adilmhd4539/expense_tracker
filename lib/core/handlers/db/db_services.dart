import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbServices {
  static final List<Map<String, dynamic>> categories = [
    {'category_name': "SALARY", "category_type": "INCOME"},
    {'category_name': "Passive Income", "category_type": "INCOME"},
    {'category_name': "FOOD", "category_type": "EXPENSE"},
    {'category_name': "TRAVEL", "category_type": "EXPENSE"},
    {'category_name': "SHOPPING", "category_type": "EXPENSE"},
    {'category_name': "OTHER", "category_type": "EXPENSE"}
  ];
  static Future<Database> initializeDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'expense_db.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        try {
          await db
              .execute(
                  'CREATE TABLE $categoryTable( category_id integer PRIMARY KEY AUTOINCREMENT, category_name text NOT NULL, category_type text NOT NULL);')
              .catchError((e) {
            log(e.toString());
          });
          db
              .execute(
                  ' CREATE TABLE $expenseTable ( id integer PRIMARY KEY AUTOINCREMENT, amount REAL NOT NULL, notes TEXT NOT NULL, date TEXT NOT NULL, category_id INTEGER NOT NULL, FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE ON UPDATE NO ACTION );')
              .catchError((e) {
            log(e.toString());
          });
          for (final raw in categories) {
            await db.insert(categoryTable, raw);
          }
          await db.query(expenseTable).then((value) => log(value.toString()));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    return db;
  }

  static const String categoryTable = "category";
  static const String expenseTable = "expense";
}
