import 'package:apppp/Screens/auth/otp_screen.dart';
import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:apppp/widgets/auth/custom_textformfield.dart';
import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});
  static const String routeName = "Forget password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "نسيان كلمة المرور",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            CustomText(
              text: "لا تقلك ما عليك سوي كتابة رقم هاتفك وسنرسل رمز التحقق",
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.black,
            ),
            CustomTextFormField(hintText: "ادخال رقم الهاتف"),
            CustomButton(
              text: "نسيت كلمة المرور",
              onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpScreen(),
                            ),
                          ),
            ),
          ],
        ),
      ),
    );
  }
}
