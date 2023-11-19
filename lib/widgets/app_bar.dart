import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget {
  final TabController? controller;

  final bool isBackButton;
  const AppBarWidget(
      {super.key, this.controller, required this.isBackButton});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.2,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/couples.png',
            height: screenWidth,
          ),
          Container(
            color: const Color(0xFFF9F6F6).withOpacity(0.5),
          ),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: !isBackButton ? TabBar(
                controller: controller,
                unselectedLabelColor: Colors.black54,
                labelColor: Colors.black,
                labelStyle: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.bold),
                indicatorColor: const Color(0xFFE2397F),
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 6.0.h,
                tabs: const [
                  Tab(
                    child: SizedBox(
                      child: Center(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Sign Up'))),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Login'),
                        ),
                      ),
                    ),
                  ),
                ]) : const SizedBox.shrink()
          ),
          
          Positioned(
              top: 10.h,
              left: 10.w,
              child: isBackButton
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    )
                  : const SizedBox.shrink())
        ],
      ),
    );
  }
}
