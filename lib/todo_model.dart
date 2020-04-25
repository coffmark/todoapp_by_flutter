import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo/todo.dart';

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(todoTask: 'Buy milk'),
    Todo(todoTask: 'Buy eggs'),
    Todo(todoTask: 'Buy bread'),
  ];

  //TODO:getプロパティとは
  int get todoCount {
    return _todos.length;
  }

  /*
  TODO:UnmodifiableListView
   */
  UnmodifiableListView<Todo> get todos {
    return UnmodifiableListView(_todos);
  }

  void addTodo(String newTodoText) {
    final Todo addtodo = Todo(todoTask: newTodoText);
    _todos.add(addtodo);
    notifyListeners();
  }

//TODO:deleteボタンの実装 --> コールバック関数の用意
//TODO:Firebaseとの連携
//TODO:端末にデータを残すshared_preferenceというパッケージ
//TODO:Googleplaystoreに提携
//TODO:NotifyListners()について

  void deleteTodo(Todo deleteTodoText) {
    _todos.remove(deleteTodoText);
    notifyListeners();
  }
}
