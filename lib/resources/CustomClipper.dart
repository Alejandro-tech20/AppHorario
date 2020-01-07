import 'package:flutter/material.dart';

class CustomClipperShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firtsEndPoint = Offset(size.width / 6, size.height / 1.5);
    var firtsControlPoint = Offset(size.width / 7, size.height - 30);
    path.quadraticBezierTo(
      firtsControlPoint.dx,
      firtsControlPoint.dy,
      firtsEndPoint.dx,
      firtsEndPoint.dy,
    );
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    var thertEndPoint = Offset(size.width , 0);
    var thertControlPoint = Offset(size.width - (size.width / 9),size.height / 6);
    path.quadraticBezierTo(      
      thertControlPoint.dx,
      thertControlPoint.dy,
      thertEndPoint.dx,
      thertEndPoint.dy,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
