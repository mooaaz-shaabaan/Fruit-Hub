import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String?> createEmailWithUsernameAndPassword(
  String? email,
  String? password,
  String? userName,
) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userCredential.user!.uid)
        .set({
      "id": userCredential.user!.uid,
      "userName": userName,
      "email": email,
      "createdAt": FieldValue.serverTimestamp(),
    });

    return null; // تسجيل الحساب تم بنجاح
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      return 'البريد الإلكتروني مستخدم من قبل';
    } else if (e.code == 'weak-password') {
      return 'كلمة المرور ضعيفة';
    } else if (e.code == 'invalid-email') {
      return 'البريد الإلكتروني غير صالح';
    } else {
      return 'حدث خطأ: ${e.message}';
    }
  } catch (e) {
    log(e.toString());
    return 'حدث خطأ أثناء إنشاء الحساب';
  }
}
