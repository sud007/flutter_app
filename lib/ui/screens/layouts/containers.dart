import 'package:flutter/material.dart';

class ContainersHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ContainerHome"),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0.0, 1.0),
                            colors: [Colors.red.shade200, Colors.red.shade700]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            begin: Alignment(0.0, 0.5),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              Colors.pink.shade200,
                              Colors.pink.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            begin: Alignment(0.0, 0.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              Colors.purple.shade200,
                              Colors.purple.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 0.8),
                            colors: [
                              Colors.orange.shade200,
                              Colors.orange.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 0.8),
                            tileMode: TileMode.repeated,
                            colors: [
                              Colors.green.shade200,
                              Colors.green.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            tileMode: TileMode.repeated,
                            colors: [
                              Colors.blue.shade700,
                              Colors.purple.shade700,
                              Colors.green.shade700,
                              Colors.orange.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: LinearGradient(
                            stops: [0.3, 0.5, 0.6, 0.8],
                            tileMode: TileMode.repeated,
                            colors: [
                              Colors.blue.shade700,
                              Colors.purple.shade700,
                              Colors.green.shade700,
                              Colors.orange.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: RadialGradient(
                            radius: 0.5,
                            tileMode: TileMode.clamp,
                            colors: [
                              Colors.blue.shade700,
                              Colors.purple.shade700,
                              Colors.green.shade700,
                              Colors.orange.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        gradient: RadialGradient(
                            center: Alignment(0.0, 0.5),
                            tileMode: TileMode.clamp,
                            radius: 0.5,
                            colors: [
                              Colors.blue.shade700,
                              Colors.purple.shade700,
                              Colors.green.shade700,
                              Colors.orange.shade700
                            ]),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.flaticon.com/icons/svg/637/637621.svg"),
                            fit: BoxFit.fitWidth),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.flaticon.com/icons/svg/637/637665.svg")),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 200.0,
                      height: 200.0,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.flaticon.com/icons/svg/637/637621.svg"),
                            fit: BoxFit.scaleDown,
                            repeat: ImageRepeat.repeat),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.flaticon.com/icons/svg/637/637665.svg")),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
