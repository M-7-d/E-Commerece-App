import 'package:flutter/material.dart';

class TCustomCurvedEdge extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstcurve = Offset(0, size.height - 20);
    final lastcurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstcurve.dx, firstcurve.dy, lastcurve.dx, lastcurve.dy);

    final seconFirstlcurve = Offset(30, size.height - 20);
    final seconlastcurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(seconFirstlcurve.dx, seconFirstlcurve.dy,
        seconlastcurve.dx, seconlastcurve.dy);

    final thiredFirstcurve = Offset(size.width, size.height - 20);
    final thiredlastcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thiredFirstcurve.dx, thiredFirstcurve.dy,
        thiredlastcurve.dx, thiredlastcurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
