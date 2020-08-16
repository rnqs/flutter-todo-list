import 'package:flutter/material.dart';
import 'package:ftrprt1/widgets/todo_list.dart';

import 'todo_item.dart';
import 'new_todo_dialog.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoItem> todos = [];

  _toggleTodo(TodoItem todo, bool isChecked) {
    setState(() {
      todo.isDone = isChecked;
    });
  }

  _addTodo() async {
    final todo = await showDialog<TodoItem>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });

    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do List'),
      ),
      body: TodoList(
        todos: todos,
        onTodoItemToggle: _toggleTodo,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
