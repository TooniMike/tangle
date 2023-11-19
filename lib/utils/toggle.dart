import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils.dart';

class Toggle extends StatefulWidget {
  final String text;
  const Toggle( {super.key, required this.text});

  @override
  State<Toggle> createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleButton,
      child: Row(
        children: [
          Text(widget.text),
          const WhiteSpace(width: 3),
          Container(
            width: 20.0.w,
            height: 20.0.h,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle,
                color: Colors.white 
                ),
            child: Center(
              child: Container(
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToggled ? const Color(0xFFE13780) : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

    bool isToggled = false;

  void toggleButton() {
    setState(() {
      isToggled = !isToggled;
    });
  }
}
