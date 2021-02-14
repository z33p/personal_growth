import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String title;

  MainPage({ this.title });

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Center(
          child: Text("Hello World"),
        ),
      )
    );
  }
}