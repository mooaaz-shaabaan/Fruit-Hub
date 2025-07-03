import 'package:firebase_auth/firebase_auth.dart';

Future<String?> signInWithEmailAndPassword(String? email, String? password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return null; // null معناها تم الدخول بنجاح
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'user-not-found':
        return 'البريد الإلكتروني غير موجود';
      case 'wrong-password':
        return 'كلمة المرور غير صحيحة';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح';
      case 'user-disabled':
        return 'تم تعطيل هذا المستخدم';
      case 'invalid-credential':
        return 'بيانات تسجيل الدخول غير صالحة، حاول مرة أخرى';
      default:
        return 'حدث خطأ غير متوقع: ${e.code}';
    }

  } catch (e) {
    return 'حدث خطأ أثناء تسجيل الدخول';
  }
}
