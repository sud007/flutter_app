import 'package:flutter/material.dart';
class ShapeContainer extends StatelessWidget {
  final String shape;

  const ShapeContainer({Key key, this.shape}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shape == 'Triangle') {
      return CustomPaint(
        size: Size(80, 80),
        painter: TrianglePainter(),
      );
    } else {
      return CustomPaint(
        size: Size(80, 80),
        painter: RectanglePainter(),
      );
    }
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.pink;

    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.purple;

    Rect rect =
        Rect.fromLTRB(0, size.height / 4, size.width, size.height / 4 * 3);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
