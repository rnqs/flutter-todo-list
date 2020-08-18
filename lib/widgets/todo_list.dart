import 'package:flutter/material.dart';

import 'todo_item.dart';

typedef ToggleTodoCallback = void Function(TodoItem, bool);
typedef ManageTodoCallback = void Function(BuildContext, int);

class TodoList extends StatelessWidget {
  TodoList(
      {@required this.todos, this.onTodoItemToggle, this.onTodoItemIsEdited});

  final List<TodoItem> todos;
  final ToggleTodoCallback onTodoItemToggle;
  final ManageTodoCallback onTodoItemIsEdited;

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return GestureDetector(
        onLongPress: () => onTodoItemIsEdited(context, index),
        child: CheckboxListTile(
          title: Text(todo.title),
          value: todo.isDone,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool isChecked) {
            onTodoItemToggle(todo, isChecked);
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }
}
