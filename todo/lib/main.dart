import 'package:flutter/material.dart';

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

class ToDoItem extends StatelessWidget {
  final String title;
  final bool done;
  final Function remove;
  final Function toggleDone;
  const ToDoItem(this.title, this.done, this.remove, this.toggleDone);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          leading: Checkbox(
            value: done,
            onChanged: (bool value) => toggleDone(),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: done ? Color.fromRGBO(23, 152, 185, 100) : Colors.black54,
              decoration:
                  done ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () => remove(),
          )),
    );
  }
}

class AddItemDialog extends StatefulWidget {
  final void Function(String txt) addToDo;
  const AddItemDialog(this.addToDo);

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String todo;

  void save() {
    if (formKey.currentState.validate()) {
      widget.addToDo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  onChanged: (String txt) => todo = txt,
                  onFieldSubmitted: (String txt) => save(),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: save,
                  color: Color.fromRGBO(23, 152, 185, 100),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                )
              ],
            )));
  }
}
