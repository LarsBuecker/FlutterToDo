import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.title, this.done);
  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Screen'),
          backgroundColor: Color.fromRGBO(50, 145, 255, 100),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 17.0,
                    decoration:
                        done ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ),
              ListTile(
                title: Text('Termin hinzufügen'),
                trailing: IconButton(
                  icon: Icon(Icons.calendar_today),
                ),
              )
            ],
          ),
        ));
  }
}
