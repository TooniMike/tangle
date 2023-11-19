import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tangle/utils/white_space.dart';

class TextFieldInput extends StatelessWidget {
  final String hint;
  final TextInputType? keyBoard;
  final IconData? icon;
  final TextEditingController? controller;
  const TextFieldInput({super.key, required this.hint, this.icon, this.keyBoard, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
        const WhiteSpace(height: 5),
        SizedBox(
          height: 50.h,
          child: TextField(
            controller: controller,
            keyboardType: keyBoard,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: hint,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0.r),
                    borderSide: const BorderSide(color: Color(0xFFE1367F))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0.r),
                    borderSide: const BorderSide(color: Color(0xFFE1367F))),
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black38,
                ),
                suffixIcon: Icon(icon, color: Colors.black54)),
          ),
        ),
      ],
    );
  }
}
