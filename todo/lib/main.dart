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

  void loadData() async {
    Future.delayed(Duration(seconds: 0), () {
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Text("Loading"),
                      ),
                    ],
                  ),
                ),
              ));
    });

    await Future.delayed(Duration(seconds: 5), () {
      print('Connect to database');
    });

    Future<Map<String, bool>> dataFuture =
        Future.delayed(Duration(seconds: 2), () {
      return {
        'Async lernen': true,
        'Firebase aufsetzen': false,
        'Loslegen': false
      };
    });

    Future.delayed(Duration(seconds: 3), () {
      print('Load data 2');
    });

    Map<String, bool> data = await dataFuture;

    Future.delayed(Duration(seconds: 0), () {
      setState(() {
        todos = data;
      });
      Navigator.of(context).pop();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
