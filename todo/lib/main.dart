import 'package:flutter/material.dart';
import 'add_item_dialog.dart';
import 'to_do_item.dart';

void main() {
  runApp(MaterialApp(home: ToDo()));
}

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  Map<String, bool> todos = {
    'ToDo1': false,
    'ToDo2': false,
    'ToDo3': false,
    'ToDo4': false,
  };

  void addToDo(String todo) {
    setState(() {
      todos[todo] = false;
    });
    Navigator.of(context).pop();
  }

  void deleteToDo(String key) {
    setState(() {
      todos.remove(key);
    });
  }

  void toggleDone(String key) {
    setState(() {
      todos.update(key, (bool done) => !done);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AddItemDialog(addToDo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo-App'),
        backgroundColor: Color.fromRGBO(35, 152, 185, 100),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, i) {
          String key = todos.keys.elementAt(i);
          return ToDoItem(
            key,
            todos[key],
            () => deleteToDo(key),
            () => toggleDone(key),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newEntry,
        child: Icon(Icons.add),
      ),
    );
  }
}
