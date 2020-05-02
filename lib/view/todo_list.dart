import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/view/todo_tile.dart';
import 'package:todo/model/todo_model.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0)),
            color: Colors.blueAccent[200]),
        child: Consumer<TodoModel>(builder: (context, todoModel, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(10),
            itemCount: todoModel.todoCount,
            itemBuilder: (BuildContext context, int index) {
              return TodoTile(
                todoTitle: todoModel.todos[index].todoTask,
                deletePressCallback: () {
                  todoModel.deleteTodo(todoModel.todos[index]);
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          );
        }));
  }
}
