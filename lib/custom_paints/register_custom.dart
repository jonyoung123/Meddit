import 'package:flutter/material.dart';

class RegistrationPageCustom extends CustomPainter {
  RegistrationPageCustom(
      {this.color,
      this.height,
      this.width1,
      this.width2,
      this.height0,
      this.height2,
      this.height3});
  final Color? color;
  final double? height;
  final double? width1;
  final double? width2;
  final double? height2;
  final double? height3;
  final double? height0;
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 20.0;
    final paint = Paint()..color = color!;
    final paint1 = Paint()..color = Colors.black;
    final controlPoint1 = Offset(size.width - width1!, height!);
    final controlPoint2 = Offset(size.width - width2!, height3!);
    final endpoint = Offset(size.width, height3!);
    final controlPoint = Offset(radius, size.height - 35);
    final endpoint1 = Offset(0, size.height - radius * 2);
    final controlPoint3 = Offset(30, size.height - 40);
    final endpoint2 = Offset(70, size.height);
    final controlPoint4 = Offset(32, size.height - 43);
    final endpoint3 = Offset(72, size.height);

    Path path = Path()
      ..moveTo(0, height0!)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endpoint.dx, endpoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(radius * 2, size.height)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endpoint1.dx, endpoint1.dy)
      ..lineTo(0, height0!)
      ..close();
    canvas.drawPath(path, paint);
    Path path3 = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
          controlPoint4.dx, controlPoint4.dy, endpoint3.dx, endpoint3.dy)
      ..close();
    canvas.drawPath(path3, paint1);
    Path path2 = Path()
      ..moveTo(2, size.height)
      ..quadraticBezierTo(
          controlPoint3.dx, controlPoint3.dy, endpoint2.dx, endpoint2.dy)
      ..close();
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(RegistrationPageCustom oldDelegate) {
    return color != oldDelegate.color;
  }
}
