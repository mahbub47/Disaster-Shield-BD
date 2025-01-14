import 'package:flutter/material.dart';

class DCustomCurveEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-50);

    final firstStarting = Offset(0, size.height);
    final firstEnding = Offset(50, size.height);
    path.quadraticBezierTo(firstStarting.dx, firstStarting.dy, firstEnding.dx, firstEnding.dy);

    final secondStarting = Offset(0, size.height);
    final secondEnding = Offset(size.width-50, size.height);
    path.quadraticBezierTo(secondStarting.dx, secondStarting.dy, secondEnding.dx, secondEnding.dy);

    final thirdStarting = Offset(size.width, size.height);
    final thirdEnding = Offset(size.width, size.height-50);
    path.quadraticBezierTo(thirdStarting.dx, thirdStarting.dy, thirdEnding.dx, thirdEnding.dy);
    
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}