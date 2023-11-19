import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tangle/navigation/tabbar.dart';
import 'pages.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        // user is logged in
        if(snapshot.hasData){
          return const Tabbar();
          // return const ProfilePage();
        }

        // user is Not Logged in
        else {
          return const OnboardingPage();
        }
      }),
      )
    );
  }
}