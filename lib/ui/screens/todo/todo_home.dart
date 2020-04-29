import 'package:flutter/material.dart';
import 'package:flutterapp/ui/screens/todo/todolist.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData( primarySwatch: Colors.orange),
      home: TodoHomeNew(),
    );
  }
}

class TodoHomeNew extends StatefulWidget {
  @override
  _TodoHomeNewState createState() => _TodoHomeNewState();
}

class _TodoHomeNewState extends State<TodoHomeNew> {
  
  @override
  Widget build(BuildContext context) {

      return Scaffold(
      appBar: AppBar(
        title: Text("ToDoApp"),
      ),
      body: TodoList(),
    );
  }
}
