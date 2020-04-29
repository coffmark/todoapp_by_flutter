import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {


    String newTodoTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)
              )),
      child: Column(
        children: <Widget>[
          Text(
            'タスクの追加',
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              newTodoTitle = value;
              print('$newTodoTitle in TextField');
            },
          ),
          SizedBox(
            height: 10,
          ),
          FlatButton(
            child: Text(
              '追加',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              print('$newTodoTitle is new Text');
              Provider.of<TodoModel>(context, listen: false)
                  .addTodo(newTodoTitle);

              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
