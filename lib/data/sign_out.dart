import 'package:apppp/Screens/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> signOutUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signOut();

    // بعد تسجيل الخروج روح على شاشة تسجيل الدخول
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Login()),
      (route) => false,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("فشل تسجيل الخروج: ${e.toString()}")),
    );
  }
}
