import 'package:flutter/material.dart';

import 'todo_item.dart';

class NewTodoDialog extends StatelessWidget {
  final titleInputController = new TextEditingController();

  void handleAddTodoItem(BuildContext context) {
    if (titleInputController.value.text == '') return;

    final todo = new TodoItem(title: titleInputController.value.text);
    titleInputController.clear();

    Navigator.of(context).pop(todo);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New todo'),
      content: TextField(
        controller: titleInputController,
        autofocus: true,
        onEditingComplete: () => handleAddTodoItem(context),
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
          onPressed: () => handleAddTodoItem(context),
        ),
      ],
    );
  }
}
