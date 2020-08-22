import 'package:flutter/material.dart';

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
                  color: Color.fromRGBO(50, 145, 255, 100),
                  child: Text('Save', style: TextStyle(color: Colors.white)),
                )
              ],
            )));
  }
}
