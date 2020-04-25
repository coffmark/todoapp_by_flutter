import 'package:flutter/material.dart';
import 'package:todo/view/todo_home.dart';
import 'package:provider/provider.dart';
import 'package:todo/todo_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MaterialApp(
        home: ToDoHome(),
      ),
    );
  }
}
