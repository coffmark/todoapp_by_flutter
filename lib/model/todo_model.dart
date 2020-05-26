import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final Future<Database> database =
//       openDatabase(join(await getDatabasesPath(), 'todo_database.db'),
//           onCreate: (db, version) {
//     return db.execute("CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT)");
//   }, version: 1);

//   //Databaseにinsert
//   Future<void> insertTodo(TodoData todomodel) async {
//     final Database db = await database;
//     await db.insert('todos', todomodel.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   //todo example1を追加
//   final todo1 = TodoData(id: 0, todoTask: 'Flutterの勉強');
//   await insertTodo(todo1);

//   //List型として登録
//   Future<List<TodoData>> todos() async {
//     final Database db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('todos');
//     return List.generate(maps.length, (i) {
//       return TodoData(id: maps[i]['id'], todoTask: maps[i]['todoTask']);
//     });
//   }

//   //debugポイント
//   print(await todos());

//   //Databaseのアップデート
//   Future<void> updateTodo(TodoData todomodel) async {
//     final db = await database;
//     await db.update('todos', todomodel.toMap(),
//         where: "id = ?", whereArgs: [todomodel.id]);
//   }
  
//   //debug Update Database
//   await updateTodo(TodoData(id: 0, todoTask:'Fido'));
//   print(await todos());


//   //Delete from database
//   Future<void> deleteTodo(int id) async{
//     final db = await database;
//     await db.delete('todos', where: "id = ?", whereArgs: [id]);
//   }
// }

// class TodoData{
//   final int id;
//   final String todoTask;

//   TodoData({this.id, this.todoTask});

//   Map<String, dynamic> toMap() {
//     return {'id': id, 'todoTask': todoTask};
//   }

//   @override
//   String toString(){
//     return 'Todo{id:$id, todoTask:$todoTask,}';
//   }

//   void addTodo(TodoData todoData) {
//     toMap().forEach((key, value) {print("add: $key, $value");});
//   }

//   void deleteTodo(TodoData todoData){
//     toMap().forEach((key, value) {print("delete: $key, $value");});
//   }
// }



class TODO extends ChangeNotifier {
  List<String> _todos = [
    'Flutterでのアプリ開発',
    '学校の宿題',
  ];


  int get todoCount {
    return _todos.length;
  }

  String todogetItem(){
    List todoItemLine = ['${_todos[0]}'];

    //.addメソッドはnullには入らない
    for (var i = 1; i < _todos.length; i++) {
      todoItemLine.add(_todos[i]);
    }
    List todoItem = todoItemLine.map((item) => "・$item").toList();
    String todoItemForTweet = todoItem.join("\n");
    todoItemForTweet = todoItemForTweet + "\n#今日の積み上げ";
    return todoItemForTweet;
  }


  UnmodifiableListView<String> get todos {
    return UnmodifiableListView(_todos);
  }

  void addTodo(String newTodoText) {
    final String addtodo = newTodoText;
    _todos.add(addtodo);
    notifyListeners();
  }




  void deleteTodo(String deleteTodoText) {
    _todos.remove(deleteTodoText);
    notifyListeners();
  }
}