// ignore_for_file: use_build_context_synchronously

import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tangle/utils/core_utils.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future addUserDetails(
    String firstName,
    String lastName,
    String email,
    int age,
    String occupation,
    Uint8List file,
  ) async {
    String imageUrl = await uploadImageToStorage('profileImage', file);
    await FirebaseFirestore.instance.collection('users').doc(email).set({
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'email': email,
      'occupation': occupation,
      'imageLink': imageUrl
    });
  }

  static Future signUserIn(
      BuildContext context, String email, String password) async {
    // try sign in
    final navigator = Navigator.pop(context);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        CoreUtils.showAlertDialog(
            context: context, message: 'Invalid login details');
        navigator;
      } else {
        CoreUtils.showAlertDialog(context: context, message: e.code);
        navigator;
      }
    }
  }

  static Future signUp(
      {required BuildContext context,
      required String email,
      required String password,
      required String confirmPassword,
      required String firstname,
      required String lastname,
      required String occupation,
      required String age,
      required Uint8List image}) async {
    if (password == confirmPassword) {
      // create user
      try {
        CoreUtils.showLoader(context, 'Please wait');
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
            Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        CoreUtils.showAlertDialog(context: context, message: e.code);
      }

      StoreData().addUserDetails(
          firstname, lastname, email, int.parse(age), occupation, image);
    } else {
      CoreUtils.showAlertDialog(context: context, message: 'The password dosen\'t tally');
    }
  }
}
