import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Color(0xFF795548),
          accentColor: Color(0xFF8BC34A),
          textTheme: TextTheme(
              bodyText1: TextStyle(
            fontSize: 24.0,
            fontStyle: FontStyle.italic,
          )),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Themes and Layouts",
            ),
          ),
          body: Center(
            child: Text(
              "Hey There Maau!.🐱\nThis is demo of Theme and layouts.",
              textAlign: TextAlign.center,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.lightbulb_outline),
            onPressed: () {
              debugPrint("Pressed");
            },
          ),
          persistentFooterButtons: <Widget>[
            IconButton(icon: Icon(Icons.add_comment), onPressed: null),
            IconButton(icon: Icon(Icons.add_alarm), onPressed: null),
            IconButton(icon: Icon(Icons.add_location), onPressed: null),
          ],
        ));
  }
}
