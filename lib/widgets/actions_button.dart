import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButtons extends StatelessWidget {
  final IconData icon;
  const ActionButtons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0.w,
      height: 60.0.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 3),
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            Color(0xFFF3B78F),
            Color(0xFFE1367F),
            Color(0xFFE1367F),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
