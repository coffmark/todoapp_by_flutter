import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';

import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   final database = openDatabase(join(await getDatabasesPath(), 'todo_database.db'),
//   onCreate: (db, version){
//     return db.execute("CREATE TABLE todos()")
//   });
// }


















class TodoModel extends ChangeNotifier {
  final String todoTask;

  TodoModel({this.todoTask});

  List<String> _todos = [
    'Flutter勉強',
    '大学のレポート',
  ];


  int get todoCount {
    return _todos.length;
  }

  String todogetItem(){
    List todoItemLine = ['${_todos[0]}'];
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
    _todos.add(newTodoText);
    notifyListeners();
  }




  void deleteTodo(String deleteTodoText) {
    _todos.remove(deleteTodoText);
    notifyListeners();
  }

}
