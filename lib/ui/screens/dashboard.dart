import 'package:flutter/material.dart';
import 'package:flutterapp/ui/screens/anim_home.dart';
import 'package:flutterapp/ui/screens/area_calc/area_cal.dart';
import 'package:flutterapp/ui/screens/layouts/row_cols.dart';
import 'package:flutterapp/ui/screens/todo/todo_home.dart';
import 'package:flutterapp/ui/screens/trip_calc/trip_calculator.dart';
import 'layouts/containers.dart';
import 'layouts/helloyou.dart';
import 'layouts/layout_demo.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demos",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: DashboardHome(),
    );
  }
}

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateHelloApp();
                      },
                      color: Colors.pink,
                      textColor: Colors.white,
                      child: Text(
                        "Hello App",
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Container(
                      width: 25.0,
                    ),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToBasicLayout();
                      },
                      color: Colors.black,
                      textColor: Colors.pinkAccent,
                      child: Text(
                        "Basic Layout",
                        textScaleFactor: 1.5,
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToContainersHome();
                      },
                      color: Colors.blueGrey,
                      textColor: Colors.white,
                      child: Text(
                        "Containers Home",
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Container(
                      width: 25.0,
                    ),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToAreaCalculator();
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Text(
                        "Area Calculator",
                        textScaleFactor: 1.5,
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToToDoApp();
                      },
                      color: Colors.yellow,
                      textColor: Colors.purple,
                      child: Text(
                        "ToDo List App",
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Container(
                      width: 25.0,
                    ),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToTripCalApp();
                      },
                      color: Colors.brown,
                      textColor: Colors.yellow,
                      child: Text(
                        "Trip Calc App",
                        textScaleFactor: 1.5,
                      ),
                    )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToAnimationDemo();
                      },
                      color: Colors.purple,
                      textColor: Colors.yellow,
                      child: Text(
                        "Animations",
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToRowCol();
                      },
                      color: Colors.cyan,
                      textColor: Colors.blue,
                      child: Text(
                        "Rows & Cols",
                        textScaleFactor: 1.5,
                      ),
                    )), 
                  ],
                ),
                 Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToAnimationDemo();
                      },
                      color: Colors.purple,
                      textColor: Colors.yellow,
                      child: Text(
                        "Animations",
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Expanded(
                        child: RaisedButton(
                      onPressed: () {
                        navigateToRowCol();
                      },
                      color: Colors.purple,
                      textColor: Colors.yellow,
                      child: Text(
                        "Animations",
                        textScaleFactor: 1.5,
                      ),
                    )), 
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void navigateHelloApp() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => HelloYou()));
  }

  void navigateToTripCalApp() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TripHome()));
  }

  void navigateToToDoApp() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => TodoHome()));
  }

  void navigateToBasicLayout() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => LayoutDemo()));
  }

  void navigateToContainersHome() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContainersHome()));
  }

  void navigateToAreaCalculator() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AreaCalcHome()));
  }

  void navigateToAnimationDemo() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AnimHomePage()));
  }

  void navigateToRowCol() async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => RowColHome()));
  } 
}
