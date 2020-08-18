import 'package:flutter/material.dart';

import 'todo_item.dart';

typedef RemoveTodoCallback = void Function();

class ManageTodoDialog extends StatelessWidget {
  ManageTodoDialog({@required this.onRemoveTodo, this.todoItem});

  final RemoveTodoCallback onRemoveTodo;
  final TodoItem todoItem;

  @override
  Widget build(BuildContext context) {
    final titleInputController =
        new TextEditingController(text: todoItem.title);

    void handleEditTodoItem(BuildContext context) {
      if (titleInputController.value.text == '') return;

      final todo = new TodoItem(
          title: titleInputController.value.text, isDone: todoItem.isDone);
      titleInputController.clear();

      Navigator.of(context).pop(todo);
    }

    return AlertDialog(
        title: Text('Edit to-do'),
        content: TextField(
          controller: titleInputController,
          autofocus: true,
          onEditingComplete: () => handleEditTodoItem(context),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Remove', style: TextStyle(color: Colors.red)),
            onPressed: () {
              onRemoveTodo();
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Edit'),
            onPressed: () => handleEditTodoItem(context),
          ),
        ]);
  }
}
