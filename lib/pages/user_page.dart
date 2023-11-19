import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Signed in as: ', style: TextStyle(color: Colors.red)),
              const SizedBox(height: 25),
              Expanded(
                child: FutureBuilder<DocumentSnapshot>(
                  future: usersCollection.doc(currentUser!.uid).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        Map<String, dynamic>? data =
                            snapshot.data!.data() as Map<String, dynamic>?;
                        if (data != null) {
                          return Text(
                              '${data['last name']} + ${data['imageLink']} + ${data['age']} + ${data['occupation']}');
                        } else {
                          return const Text('No user data found.');
                        }
                      } else {
                        return const Text('No user data found.');
                      }
                    }
                    return const Text('Loading...');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
