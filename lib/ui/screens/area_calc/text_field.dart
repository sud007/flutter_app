import 'package:flutter/material.dart';
class AreaTextField extends StatelessWidget {
  AreaTextField({this.controller, this.hint, this.hintLabel});

  final TextEditingController controller;
  final String hint;
  final String hintLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        controller: this.controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.w300,
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          hintText: this.hint,
          labelText: this.hintLabel,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          prefixIcon: (this.hint == "Width")
              ? Icon(Icons.border_bottom)
              : Icon(Icons.border_left),
        ),
      ),
    );
  }
}

