import 'package:flutter/material.dart';

import 'widgets/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      home: TodoList(),
    );
  }
}
