import 'package:flutter/material.dart';

import 'todo_item.dart';

typedef ToggleTodoCallback = void Function(TodoItem, bool);

class TodoList extends StatelessWidget {
  TodoList({@required this.todos, this.onTodoItemToggle});

  final List<TodoItem> todos;
  final ToggleTodoCallback onTodoItemToggle;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      title: Text(todo.title),
      value: todo.isDone,
      onChanged: (bool isChecked) {
        onTodoItemToggle(todo, isChecked);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}
