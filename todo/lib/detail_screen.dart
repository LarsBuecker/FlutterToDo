import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.title, this.done);
  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: done ? Colors.green : Colors.red,
      appBar: AppBar(
        title: Text('Detail Screen'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Text(
                      done
                          ? 'Das hast du schon erledigt:'
                          : 'Das musst du noch machen:',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text(title,
                        style: TextStyle(fontSize: 50, color: Colors.white)))),
            Expanded(
              child: IconButton(
                iconSize: 60,
                onPressed: () => Navigator.pop(context),
                icon:
                    Icon(done ? Icons.check : Icons.close, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
