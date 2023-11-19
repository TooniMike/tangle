import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tangle/config/palette.dart';
import '../utils/utils.dart';

class BioDetails extends StatelessWidget {
  final String image;
  final String name;
  final String age;
  final String location;
  final String occupation;

  const BioDetails(
      {super.key,
      required this.image,
      required this.name,
      required this.occupation,
      required this.age,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 10.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * .68,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/$image.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  gradient: Palette.storyGradient,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                height: MediaQuery.of(context).size.height * .68,
                width: MediaQuery.of(context).size.width,
                child: null),
            Positioned(
              left: 30.w,
              bottom: 60.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '$name,',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${age}yrs',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _Bio(
                    icon: Icons.badge,
                    occupation: occupation,
                  ),
                  const WhiteSpace(height: 5),
                  _Bio(
                    icon: Icons.location_on,
                    occupation: location,
                  ),
                  const WhiteSpace(height: 5),
                  Row(
                    children: [
                      Container(
                        height: 15.0.h,
                        width: 15.0.w,
                        decoration: BoxDecoration(
                            color: Palette.online,
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 2.0, color: Colors.white)),
                      ),
                      const WhiteSpace(width: 5),
                      Text(
                        'Recently Active',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bio extends StatelessWidget {
  final String occupation;
  final IconData icon;
  const _Bio({required this.occupation, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const WhiteSpace(width: 5),
        Text(
          occupation,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
        )
      ],
    );
  }
}
