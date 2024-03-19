import 'package:flutter/material.dart';

class CardBannerClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 4;
    var path = Path()
      ..moveTo(radius, 0)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius))
      ..lineTo(size.width * .87, size.height - radius)
      ..arcToPoint(Offset(size.width * .87 - radius, size.height),
          radius: Radius.circular(radius))
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
