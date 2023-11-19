import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tangle/pages/data_page.dart';
import 'package:tangle/utils/white_space.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(currentUser.email)
                .snapshots(),
            builder: (context, snapshot) {
              // get user data
              if (snapshot.hasData && snapshot.data!.exists) {
                Map<String, dynamic> userData =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Container(
                  height: MediaQuery.of(context).size.height * .3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFF1A88D).withOpacity(.06),
                        const Color(0xFFF1A88D).withOpacity(.72),
                        const Color(0xFFDC3880).withOpacity(.54),
                        const Color(0xFFDC377F).withOpacity(.86),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundImage: NetworkImage(userData['imageLink']),
                      ),
                      const WhiteSpace(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${userData['first name']}, ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: '${userData['age']} ',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            userData['occupation'],
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error${snapshot.error}'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 20.w),
            child: Column(
              children: [
                const _Buttons(icon: Icons.notifications_active_outlined, text: 'Notifications',),
                const WhiteSpace(height: 30),
                const _Buttons(icon: Icons.settings_outlined, text: 'Settings',),
                const WhiteSpace(height: 30),
                _Buttons(ontap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const DataPage()));
                },
                  icon: Icons.chat_outlined, text: 'Bio',),
                const WhiteSpace(height: 30),
                const _Buttons(icon: Icons.photo_album_outlined, text: 'About Tangle',),
                const WhiteSpace(height: 80),
                _Buttons(ontap: () {
                  FirebaseAuth.instance.signOut();
                }, icon: Icons.logout_outlined, text: 'Logout',),
                
              ],
            ),
          ),
          
        ]),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? ontap;
  const _Buttons({required this.text, required this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.sp,
            color: const Color(0xFFDF4780),
          ),
          const WhiteSpace(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
