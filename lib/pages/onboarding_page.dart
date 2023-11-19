import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../utils/utils.dart';
import 'pages.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'assets/images/woman.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Color(0xFFF2B48F),
                    Color(0xFFEB8289)
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.7,
              left: screenWidth * .12.w,
              right: screenWidth * .12.w,
              child: Column(
                children: [
                  Text(
                    'Ready to Tangle?',
                    style: GoogleFonts.poppins(
                        color: const Color(0xFFF4EAEA),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const WhiteSpace(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const SignUpPage()),
                            );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFE2397F)),
                      elevation: MaterialStateProperty.all<double>(6.0),
                      fixedSize:
                          MaterialStateProperty.all<Size>(Size(300.w, 60.h)),
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontSize: 20.sp),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
