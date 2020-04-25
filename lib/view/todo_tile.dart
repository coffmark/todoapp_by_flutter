import 'package:flutter/material.dart';


class TodoTile extends StatelessWidget {
  final String todoTitle;
  final Function deletePressCallback;
  TodoTile({this.todoTitle, this.deletePressCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                todoTitle,
              ),
              IconButton(
                  onPressed: deletePressCallback,
                  icon: Icon(
                    Icons.restore_from_trash,
                    color: Colors.pink[400],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
