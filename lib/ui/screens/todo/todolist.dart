import 'package:flutter/material.dart';
import 'package:flutterapp/model/todo.dart';
import 'package:flutterapp/ui/screens/todo/tododetail.dart';
import 'package:flutterapp/util/dbhelper.dart';

  class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();

      getData();
    }

    return Scaffold(
      body: todoListItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetail(Todo('', 3, '_date'));
        },
        child: new Icon(Icons.add),
        tooltip: "Add new todo.",
      ),
    );
  }

  void getData() {
    final dbFuture = helper.initDb();
    dbFuture.then((value) {
      final todosFuture = helper.getTodos();
      todosFuture.then((value) {
        List<Todo> todoList = List<Todo>();
        count = value.length;

        for (var i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(value[i]));
          debugPrint("${todoList[i].title}");
        }

        setState(() {
          todos = todoList;
          count = count;
        });

        debugPrint("items ${count.toString()}");
      });
    });
  }

  ListView todoListItem() {
    return ListView.builder(
      itemBuilder: (BuildContext contect, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(this.todos[position].priority),
              child: Text(this.todos[position].id.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].date),
            onTap: () {
              debugPrint("Tapped on ${this.todos[position].id.toString()}");
              navigateToDetail(this.todos[position]);
            },
          ),
        );
      },
      itemCount: count,
    );
  }

  void navigateToDetail(Todo todo) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoDetail(todo)));
    if (result) {
      getData();
    }
  }

  Color getColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.redAccent;
        break;
      case 2:
        return Colors.orangeAccent;
        break;
      case 3:
        return Colors.greenAccent;
        break;
    }
  }
}
