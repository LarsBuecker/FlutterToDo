import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.title, this.done);
  final String title;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Detail Screen'),
        backgroundColor: Color.fromRGBO(34, 167, 240, 100)
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column( <Widget> [
          Text(title, 
            textAlign: TextAlign.left,
            style: TextStyle(
          fontSize: 20.0, 
          fontWeight: FontWeight.w500,), 
        ),
        ]
          
        )
        
      )
    );
  }
}
    