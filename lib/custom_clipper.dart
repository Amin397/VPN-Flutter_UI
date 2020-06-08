import 'package:flutter/material.dart';

class myCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0.0, size.height)
      ..cubicTo(size.width * .25, size.height * (1 - 1 / 15), size.width * .175,
          size.height * (1 - 1 / 3), size.width * .5, size.height * 2 / 3)
      ..cubicTo(size.width * .825, size.height * 2 / 3, size.width * .725,
          size.height * 14 / 15, size.width, size.height)
    ..lineTo(size.width, 0.0)
    ..lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
