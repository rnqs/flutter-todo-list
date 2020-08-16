import 'package:flutter/material.dart';

import 'todo_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [];

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    _toggleTodo(Todo todo, bool isChecked) {
      setState(() {
        todo.isDone = isChecked;
      });
    }

    return CheckboxListTile(
      title: Text(todo.title),
      value: todo.isDone,
      onChanged: (bool isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  _addTodo() {
    TextEditingController titleInputController = new TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('New todo'),
            content: TextField(
              controller: titleInputController,
              autofocus: true,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    final todo =
                        new Todo(title: titleInputController.value.text);

                    todos.add(todo);
                    titleInputController.clear();

                    Navigator.of(context).pop();
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-do List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}
