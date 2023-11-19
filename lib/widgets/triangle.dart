import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallTriangle extends StatelessWidget {
    final void Function() ontap;
  const SmallTriangle({super.key, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Positioned(
        child: CustomPaint(
          size: Size(screenWidth * .4, screenHeight * .2),
          painter: _TrianglePainter(),
        ),
      ),
      Positioned(
        top: 15,
        left: 15,
        child: Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
              color: const Color(0xFFE1367F),
              borderRadius: BorderRadius.circular(10.r)),
          child: IconButton(
              onPressed: ontap,
              icon:
                  Icon(size: 15.h, Icons.arrow_downward, color: Colors.white)),
        ),
      ),
    ]);
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF3B58F)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const radius = 10.0;

    final path = Path();

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width - radius / 2, radius);
    path.lineTo(radius, size.height / 2 - radius / 2);
    path.quadraticBezierTo(0, size.height / 2, 0, size.height / 2 - radius);
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
