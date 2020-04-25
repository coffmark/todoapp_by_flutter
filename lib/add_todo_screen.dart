import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTodoTitle;

    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: <Widget>[
          Text(
            'Todo　追加',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newText) {
              newTodoTitle = newText;
            },
          ),
          SizedBox(height: 10,),
          FlatButton(
            child: Text(
              '追加',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              Provider.of<TodoModel>(context, listen: false).addTodo(newTodoTitle ?? '');
              //TODO:Navigator.pop(context);も参照する
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
