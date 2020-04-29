import 'package:flutter/material.dart';

class HelloYou extends StatefulWidget {
  @override
  _HelloYouState createState() => _HelloYouState();
}

class _HelloYouState extends State<HelloYou> {
  String name = "";
  String _salutation = "Mr.";
  final _salutations = ["Mr.", "Mrs.", "Master", "Mistress"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HelloYou"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration:
                  InputDecoration(hintText: "Please insert you name here!"),
              onChanged: (String string) {
                setState(() {
                  name = string;
                });
              },
            ),
            DropdownButton(
              items: _salutations
                  .map((String item) =>
                      DropdownMenuItem<String>(child: Text(item), value: item))
                  .toList(),
              onChanged: (String value) {
                // _onDropDownChanged(value);

                setState(() {
                  // print("previous ${this._salutation}");
                  // print("selected $value");
                  this._salutation = value;
                });
              },
              value: _salutation,
            ),
            Text("Hello $_salutation $name!")
          ],
        ),
      ),
    );
  }

  
}
