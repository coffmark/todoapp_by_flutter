import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';


class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(todoTask: 'Flutterでのアプリ開発'),
    Todo(todoTask: '1日1冊本を読む'),
    Todo(todoTask: '就活(自己分析)'),
  ];


  int get todoCount {
    return _todos.length;
  }

  String todogetItem(){
    List todoItemLine = ['${_todos[0].todoTask}'];
    for (var i = 1; i < _todos.length; i++) {
      todoItemLine.add(_todos[i].todoTask);
    }
    List todoItem = todoItemLine.map((item) => "・$item").toList();
    String todoItemForTweet = todoItem.join("\n");
    todoItemForTweet = todoItemForTweet + "\n#今日の積み上げ";
    return todoItemForTweet;
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
