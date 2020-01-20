import 'package:flutter/material.dart';

enum TriangleDirection {
  left,
  right
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final TriangleDirection direction;

  TrianglePainter(
    {
      this.color = Colors.black,
      this.strokeWidth = 0,
      this.paintingStyle = PaintingStyle.fill,
      this.direction = TriangleDirection.right
    }
  );

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    switch (this.direction) {
      case TriangleDirection.left:
        return Path()
          ..moveTo(x, 0)
          ..lineTo(x, y)
          ..lineTo(0, y / 2)
          ..lineTo(x, 0);
      case TriangleDirection.right:
      default:
        return Path()
          ..moveTo(0, 0)
          ..lineTo(0, y)
          ..lineTo(x, y / 2)
          ..lineTo(0, 0);
    }
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
