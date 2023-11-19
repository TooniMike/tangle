import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tangle/utils/utils.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(75.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      height: 80.h,
                      width: 80.w,
                      child: Image.asset('assets/images/logo.png')),
                  Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            color: Colors.white,
                            height: 15.sp,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            color: const Color(0xFFE0297D),
                            height: 5.sp,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        left: 20.sp,
                        child: Container(
                            height: 22.sp,
                            color: Colors.white,
                            child: Text(
                              'Welcome',
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            )),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(text: 'Tell us about you'),
                    const WhiteSpace(height: 10),
                    TextField(
                      onTapOutside: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      maxLines: 4,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Short Description about you',
                          alignLabelWithHint: true,
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 10.sp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              borderSide:
                                  const BorderSide(color: Colors.grey))),
                    ),
                    const WhiteSpace(
                      height: 10,
                    ),
                    const MyText(text: 'Gender'),
                    const WhiteSpace(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Toggle(text: 'Male'),
                        Toggle(text: 'Female'),
                        Toggle(text: 'Others'),
                      ],
                    ),
                    const WhiteSpace(
                      height: 10,
                    ),
                    const MyText(text: 'Date of Birth'),
                    const WhiteSpace(
                      height: 5,
                    ),
                    TextField(
                      onTap: () {
                        _selectDate(context);
                      },
                      onTapOutside: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: selectedDate != null
                              ? "${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}"
                              : 'dd / mm / yyyy',
                          hintStyle: selectedDate != null
                              ? GoogleFonts.poppins(
                                  color: Colors.black, fontSize: 20.sp)
                              : GoogleFonts.poppins(
                                  color: Colors.grey, fontSize: 15.sp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4)),
                    ),
                    const WhiteSpace(height: 10),
                    const MyText(text: 'Complexion'),
                    const WhiteSpace(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Toggle(text: 'Light'),
                        Toggle(text: 'Dark'),
                      ],
                    ),
                    const WhiteSpace(height: 10),
                    const MyText(text: 'Height'),
                    const WhiteSpace(height: 5),
                    TextField(
                      cursorHeight: 20.h,
                      cursorColor: Colors.black,
                      onTapOutside: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Height in meter',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 15.sp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 4)),
                    ),
                    const WhiteSpace(height: 10),
                    const MyText(text: 'Body Shape'),
                    const WhiteSpace(height: 5),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Toggle(text: 'Muscular'),
                        Toggle(text: 'Slim'),
                        Toggle(text: 'Fat'),
                      ],
                    ),
                    const WhiteSpace(height: 10),
                    const WhiteSpace(height: 5),
                    const MyText(text: 'Hobby'),
                    const WhiteSpace(height: 5),
                    TextField(
                      cursorHeight: 20.h,
                      cursorColor: Colors.black,
                      onTapOutside: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Hobby',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 15.sp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w)),
                    ),
                    const WhiteSpace(height: 10),
                    const MyText(text: 'Interest'),
                    const WhiteSpace(height: 5),
                    TextField(
                      cursorHeight: 20.h,
                      cursorColor: Colors.black,
                      onTapOutside: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: 'Interest',
                          hintStyle: GoogleFonts.poppins(
                              color: Colors.grey, fontSize: 15.sp),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35.r),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.w)),
                    ),
                    const WhiteSpace(height: 10),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
