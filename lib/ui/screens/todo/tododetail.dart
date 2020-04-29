import 'package:flutter/material.dart';
import 'package:flutterapp/model/todo.dart';
import 'package:flutterapp/util/dbhelper.dart';
import 'package:intl/intl.dart';

DbHelper helper = DbHelper();
final List<String> choices = const <String>['Save & Back', 'Delete', 'Back'];
const saveMnu = 'Save & Back';
const delete = 'Delete';
const back = 'Back';

class TodoDetail extends StatefulWidget {
  final Todo todo;
  TodoDetail(this.todo);

  @override
  _TodoDetailState createState() => _TodoDetailState(todo);
}

class _TodoDetailState extends State {
  Todo todo;
  _TodoDetailState(this.todo);
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";

  TextEditingController _titleEditingContr = TextEditingController();
  TextEditingController _descEditingContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleEditingContr.text = todo.title;
    _descEditingContr.text = todo.description;
    TextStyle txtStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(todo.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices
                  .map((choice) => PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(top: 35.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _titleEditingContr,
                      style: txtStyle,
                      onChanged: (value) => this.updateTitle(),
                      decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: txtStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      controller: _descEditingContr,
                      style: txtStyle,
                      onChanged: (value) => this.updateDescription(),
                      decoration: InputDecoration(
                          labelText: "Description",
                          labelStyle: txtStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                    ),
                  ),
                  ListTile(
                    title: DropdownButton(
                      items: _priorities.map((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      value: retrievePriority(todo.priority),
                      onChanged: (value) => updatePriority(value),
                      style: txtStyle,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  void _select(String value) async {
    int result;

    switch (value) {
      case saveMnu:
        save();
        break;

      case delete:
        Navigator.pop(context, true);
        if (todo.id == null) {
          return;
        }

        result = await helper.deleteToDo(todo.id);
        if (result != 0) {
          AlertDialog dialog = AlertDialog(
            title: Text("Delete Done!"),
            content: Text("Delete Done!"),
          );

          showDialog(context: context, builder: (_) => dialog);
        }
        break;
      case back:
        Navigator.pop(context, true);
        break;
      default:
    }
  }

  void save() async {
    todo.date = DateFormat.yMd().format(DateTime.now());
    if (todo.id != null) {
      var result = await helper.udpateTodo(todo);
    } else {
      var result = await helper.insertTodo(todo);
    }

    Navigator.pop(context, true);
  }

  void updatePriority(String value) {
    switch (value) {
      case "High":
        todo.priority = 1;
        break;
      case "Medium":
        todo.priority = 2;
        break;
      case "Low":
        todo.priority = 3;
        break;
    }

    setState(() {
      _priority = value;
    });
  }

  String retrievePriority(int value) {
    return _priorities[value - 1];
  }

  void updateTitle() {
    todo.title = _titleEditingContr.text;
  }

  void updateDescription() {
    todo.description = _descEditingContr.text;
  }
}
