import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo/todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(todoTask: 'Flutterでのアプリ開発'),
    Todo(todoTask: '1日1冊本を読む'),
    Todo(todoTask: '就活(自己分析)'),
  ];


  int get todoCount {
    return _todos.length;
  }


  UnmodifiableListView<Todo> get todos {
    return UnmodifiableListView(_todos);
  }

  void addTodo(String newTodoText) {
    final Todo addtodo = Todo(todoTask: newTodoText);
    _todos.add(addtodo);
    notifyListeners();
  }



  void deleteTodo(Todo deleteTodoText) {
    _todos.remove(deleteTodoText);
    notifyListeners();
  }
}
