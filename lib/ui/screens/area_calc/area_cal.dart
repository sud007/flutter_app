import 'package:flutter/material.dart';
import 'package:flutterapp/ui/screens/area_calc/shape_container.dart';
import 'package:flutterapp/ui/screens/area_calc/text_field.dart';

class AreaCalcHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area Calculator"),
        centerTitle: true,
      ),
      body: AreaCalc(),
    );
  }
}

class AreaCalc extends StatefulWidget {
  @override
  _AreaCalcState createState() => _AreaCalcState();
}

class _AreaCalcState extends State<AreaCalc> {
  List<String> shapes = ['Rectangle', 'Triangle'];
  String currShape = 'Rectangle';
  String result = '0';
  double witdth = 0;
  double height = 0;

  TextEditingController _wContr = TextEditingController();
  TextEditingController _hContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DropdownButton(
              items: shapes
                  .map(
                    (String e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                      value: e,
                    ),
                  )
                  .toList(),
              onChanged: (String shape) {
                setState(() {
                  currShape = shape;
                });
              },
              value: currShape,
            ),
            ShapeContainer(
              shape: currShape,
            ),
            AreaTextField(
                controller: _wContr, hint: "Enter Width", hintLabel: "Width"),
            AreaTextField(
                controller: _hContr, hint: "Enter Height", hintLabel: "Height"),
            RaisedButton(
              onPressed: calculateArea,
              color: Theme.of(context).primaryColorDark,
              textColor: Colors.white,
              child: Text(
                "Calculate Area",
                textScaleFactor: 1.5,
              ),
            ),
            Text(
              result,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateArea() {
    var width = double.parse(_wContr.text);
    var height = double.parse(_hContr.text);
    setState(() {
      debugPrint("calculateArea $currShape w= $width, h=$height");
      if (currShape == 'Rectangle') {
        result = (width * height).toString();
      } else {
        result = ((width * height) / 2).toString();
      }
      debugPrint("calculateArea $currShape w= $width, h=$height res= $result");
    });
  }
}

