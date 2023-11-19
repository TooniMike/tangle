// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/utils.dart';
import '../widgets/widget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ScrollController _scrollController = ScrollController();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset link sent to your email!'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(95.h),
              child: const AppBarWidget(
                isBackButton: true,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: ListView(
            controller: _scrollController,
            children: [
            Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: screenHeight * .5,
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi),
                        child: BigTriangle()),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationX(pi),
                      child: SmallTriangle(
                         ontap: () {
                    _scrollController.animateTo(
                      0.0,
                      duration: const Duration(
                          milliseconds: 500), // You can adjust the duration
                      curve: Curves.easeInOut,
                    );
                  },
                      )),
                ),
                Stack(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30.h, right: 30.w, left: 20.w, bottom: 100.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Forget Password',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const WhiteSpace(
                                  height: 10,
                                ),
                                Text(
                                  'Enter your email for verification',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            )),
                        const WhiteSpace(
                          height: 35,
                        ),
                        TextFieldInput(
                            keyBoard: TextInputType.emailAddress,
                            controller: _emailController,
                            hint: 'Email',
                            icon: Icons.email),
                        const WhiteSpace(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GradientButton(
                              ontap: passwordReset,
                              text: 'Continue',
                            ),
                            const WhiteSpace(height: 20),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Don\'t have an account?',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black, fontSize: 14)),
                                  TextSpan(
                                    text: ' Sign Up',
                                    style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: const Socials(),
            )
          ]),
        ),
      ),
    );
  }
}
