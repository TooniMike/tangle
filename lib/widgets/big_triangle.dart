import 'package:flutter/material.dart';

class BigTriangle extends StatelessWidget {
  const BigTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return CustomPaint(
      size: Size(screenWidth * .9, screenHeight * 1.35),
      painter: _TrianglePainter(),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..color = const Color(0xFFE5E5E5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

 const radius = 30.0; 
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width , radius);
    path.lineTo(size.width, size.height /1.2 - radius);
    path.quadraticBezierTo(size.width, size.height /1.22, size.width - radius / 2, size.height / 1.2);
    path.lineTo(radius, size.height  - radius / 2);
    path.quadraticBezierTo(0, size.height , 0, size.height  - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


