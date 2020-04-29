import 'dart:ui';

import 'package:flutter/material.dart';

class TripHome extends StatefulWidget {
  TripHome({Key key}) : super(key: key);

  @override
  _TripHomeState createState() => _TripHomeState();
}

class _TripHomeState extends State<TripHome> {
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _avgController = TextEditingController();

  String result = "...";
  final _currencies = ["Dollars", "Inr", "Euro", "Pounds"];
  String _currency = "Inr";

  final double _formDistance = 5.0;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;

    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Calculator"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "e.g.124",
                    labelText: "Distance",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                keyboardType: TextInputType.number,
                controller: _distanceController,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: _formDistance,
                bottom: _formDistance,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "e.g.124",
                    labelText: "Distance per Unit",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                keyboardType: TextInputType.number,
                controller: _avgController,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: _formDistance,
                      bottom: _formDistance,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "e.g.124",
                          labelText: "Price",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      keyboardType: TextInputType.number,
                      controller: _priceController,
                    ),
                  ),
                ),
                Container(
                  width: _formDistance * 5,
                ),
                Expanded(
                  child: DropdownButton(
                    items: _currencies
                        .map((String e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (String value) {
                      setState(() {
                        _currency = value;
                      });
                    },
                    value: _currency,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      setState(() {
                        result = _calculate();
                      });
                    },
                    child: Text(
                      "Sumbit",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Container(
                  width: _formDistance * 5,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).buttonColor,
                    textColor: Theme.of(context).primaryColorDark,
                    onPressed: () {
                      _reset();
                    },
                    child: Text(
                      "Reset",
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              result,
              style: TextStyle(fontSize: 22.0),
            ),
          ],
        ),
      ),
    );
  }

  String _calculate() {
    double _distance = double.parse(_distanceController.text);
    double _fuelCost = double.parse(_priceController.text);
    double _consumption = double.parse(_avgController.text);
    double _total = _distance / _consumption * _fuelCost;

    String result =
        "Cost of your trip is ${_total.toStringAsFixed(2)} $_currency";

    return result;
  }

  void _reset() {
    _distanceController.text = "";
    _priceController.text = "";
    _avgController.text = "";

    setState(() {
      result = '';
    });
  }
}
