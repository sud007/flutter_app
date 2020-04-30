import 'package:flutter/material.dart';
import 'dart:math';

class RowColHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("RowsAndColums"),
      ),
      body:  Stack(
      children: <Widget>[
        Container(
          width: sizeX,
          height: sizeY,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: createSquares(6),
          ),
        ),
        Container(
          width: sizeX,
          height: sizeY,
          child: Column(
            verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: createSquares(6),
          ),
        ),
        Container(
          width: sizeX,
          height: sizeY,
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: createSquares(6),
          ),
        ),
        Container(
          width: sizeX,
          height: sizeY,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: createSquares(6),
          ),
        ),
      ],
    ),
    );
  }

  
  List<Widget> createSquares(int count) {
    List colors = [
      Colors.black,
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.red,
      Colors.purple
    ];
    var rng = Random();
    List<Widget> widgets = List<Widget>();
    var start = 0;
    while (start < count) {
      Container cont = Container(
        width: 50.0,
        height: 50.0,
        color: colors[rng.nextInt(count - 1)],
        alignment: Alignment.center,
        child: Text(
          "$start",
          textScaleFactor: 1.5,
          style: TextStyle(color: Colors.white),
        ),
      );

      start++;
      widgets.add(cont);
    }

    return widgets;
  }

  List<Widget> createSquares2(int count) {
    List colors = [
      Colors.black,
      Colors.blue,
      Colors.yellow,
      Colors.pink,
      Colors.red,
      Colors.purple
    ];
    var rng = Random();
    List<Widget> widgets = List<Widget>();
    var start = 0;
    while (start < count) {
      Expanded cont = Expanded(
        flex: 1,
        child: Container(
         
          color: colors[rng.nextInt(count - 1)],
          alignment: Alignment.center,
          child: Text(
            "$start",
            textScaleFactor: 1.5,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      start++;
      widgets.add(cont);
    }

    return widgets;
  }

}
