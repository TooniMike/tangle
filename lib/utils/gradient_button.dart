import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GradientButton extends StatelessWidget {
  final void Function()? ontap;
  final String text;
  const GradientButton({super.key, required this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50.h,
        width: 180.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.r),
          border: Border.all(color: const Color(0xFFE13780)),
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(.3),
              const Color(0xFFF3B78F),
              const Color(0xFFE1367F),
              const Color(0xFFE1367F),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
