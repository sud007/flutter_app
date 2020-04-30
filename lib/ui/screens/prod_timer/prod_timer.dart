import 'package:flutter/material.dart';

class ProductivityTimerHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Timer"),
        centerTitle: true,
      ),
      body: ProductivityTimer(),
    );
  }
}

class ProductivityTimer extends StatefulWidget {
  @override
  _ProductivityTimerState createState() => _ProductivityTimerState();
}

class _ProductivityTimerState extends State<ProductivityTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}