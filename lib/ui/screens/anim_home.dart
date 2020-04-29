import 'package:flutter/material.dart';

class AnimHome extends StatelessWidget {
  const AnimHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animation Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: AnimHomePage(),
    );
  }
}

class AnimHomePage extends StatefulWidget {
  @override
  _AnimHomePageState createState() => _AnimHomePageState();
}

class _AnimHomePageState extends State<AnimHomePage>
    with SingleTickerProviderStateMixin {
  int taps = 0;
  int doubleTaps = 0;
  int longPress = 0;
  double pox = 0.0;
  double poy = 0.0;
  double boxSize = 0.0;
  double boxSize2 = 0.0;
  final double fullBoxSize = 150.0;

  Animation<double> animation;
  AnimationController _animController;

  @override
  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));

    animation =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);

    //add a listener, hre we get the value of animation from 0.0 to 1.0
    animation.addListener(() {
      setState(() {
        boxSize = fullBoxSize * animation.value;
        boxSize2 = fullBoxSize/2 * animation.value;
      });

      center(context); //keep this in center
    });

    //start animation
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Centeres the widget in center of screen on first load.
    if (pox == 0.0) {
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Test Animation'),
      ),
      body: GestureDetector(
        child: Stack(
          children: <Widget>[
            Positioned(
                left: pox,
                top: poy,
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: BoxDecoration(color: Colors.red),
                )),
                Positioned(
                left: pox,
                top: poy,
                child: Container(
                  width: boxSize2,
                  height: boxSize2,
                  decoration: BoxDecoration(color: Colors.pink),
                )),
          ],
        ),
        onTap: () {
          setState(() {
            taps++;
          });
        },
        onDoubleTap: () {
          setState(() {
            doubleTaps++;
          });
        },
        onLongPress: () {
          setState(() {
            longPress++;
          });
        },
        onVerticalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dy;
            poy += delta;
          });
        },
        onHorizontalDragUpdate: (DragUpdateDetails value) {
          setState(() {
            double delta = value.delta.dx;
            pox += delta;
          });
        },
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            "T $taps | DT $doubleTaps  | LP $longPress",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }

  void center(BuildContext context) {
    pox = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    poy = (MediaQuery.of(context).size.height / 2) - boxSize / 2;

    setState(() {
      pox = pox;
      poy = poy;
    });
  }
}
