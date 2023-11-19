import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoreUtils {
  const CoreUtils._();


  static void showSnackBar(
      {required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This service is currently unavailable'),
      ),
    );
  }

  static void showAlertDialog({required BuildContext context, required String message}){
    showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
                title: const Text('Warning'),
                contentPadding: const EdgeInsets.all(20.0),
                content: Text(message),
              );
            });
  }

  static void showLoader(BuildContext context, String? message) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      useRootNavigator: false,
      builder: (_) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: Colors.lightBlueAccent,
            ),
            const SizedBox(height: 20),
            if (message != null)
              Text(
                '$message...',
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
