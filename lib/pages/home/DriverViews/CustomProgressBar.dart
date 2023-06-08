import 'package:flutter/cupertino.dart';

class CustomProgressBar extends CustomPainter {
  double currentValue;
  double _maxValue = 100;
  Color color;
  CustomProgressBar({required this.currentValue, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawLine(Offset(currentValue, size.height / 2),
        Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
