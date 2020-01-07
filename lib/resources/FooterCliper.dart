
import 'package:flutter/material.dart';

class FooterCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    // path.lineTo(0.0, 0.0);
    var firstControlPoint = Offset(size.width - (size.width / 6), size.height);
    var firtsEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
     firtsEndPoint.dx, firtsEndPoint.dy);
     return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  
}