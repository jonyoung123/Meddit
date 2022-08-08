import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  MyCustomPainter({this.color});
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color!;

    final paint1 = Paint()..color = Colors.black;
    var radius = 60;
    var controlPoint = Offset(size.width - (radius - 10), size.height - radius);
    var endPoint = Offset(size.width - radius, size.height);
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - radius)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(size.width - 50.5, size.height), 31, paint1);
    canvas.drawCircle(Offset(size.width - 50, size.height), 30, paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}


// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }

//   @override
//   Path getClip(Size size) {
//     var radius = 50;
//     var controlPoint = Offset(size.width - (radius), size.height - radius);
//     var endPoint = Offset(size.width - radius, size.height);
//     Path path = Path()
//       ..lineTo(size.width, 0)
//       ..lineTo(size.width, size.height - radius)
//       ..quadraticBezierTo(
//           controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
//       ..lineTo(0, size.height)
//       ..close();

//     return path;
//   }
// }
