import 'package:flutter/material.dart';
import 'package:flutterapp/ui/widgets/widgets.dart';

class RowItemsDemo extends StatelessWidget {
  const RowItemsDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          color: Colors.white,
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              ItemRow("Rusk", "Britannia \u2022 150gm"),
              ItemRow("Besan", "Rajdhani \u2022 1Kg"),
              ItemRow("Rice", "Rajdhani \u2022 5Kg"),
              ItemRow("Besan", "Britannia \u2022 150gm"),
            ],
          )),
    );
  }
}
