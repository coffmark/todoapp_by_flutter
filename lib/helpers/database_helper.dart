import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;

  DatabaseHelper._instance();

  String tasksRTable = 'task_table';
  String colId = 'id';
  String colTitle = 'title';


  //Task | Tables
  //  Id  |  Title |
  //   0   | 'Flutterの勉強をする'
  //   1  |  '何らかの勉強をする'

  Future<Database> get db async{
    if(_db == null){
      _db = await _initDb();
    }
    return _db;
  }
}