import 'package:flutter/material.dart';

import 'widgets/todo_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: TodoListScreen(),
    );
  }
}
