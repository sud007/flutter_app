import 'package:flutter/material.dart';
import 'package:flutterapp/ui/screens/area_calc/area_cal.dart';
import 'package:flutterapp/ui/screens/dashboard.dart';
import 'package:flutterapp/ui/screens/layouts/containers.dart';
import 'package:flutterapp/ui/screens/layouts/layout_demo.dart';

import 'ui/screens/layouts/row_cols.dart';

// void main() => runApp(new Dashboard());
void main() => runApp(MaterialApp(
  title: "Flutter Demos",
  debugShowCheckedModeBanner: false,
  home: RowColHome(),
));
