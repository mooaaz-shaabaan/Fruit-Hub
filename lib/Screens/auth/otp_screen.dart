import 'package:apppp/Screens/auth/new_passowrd.dart';
import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';


class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static const String routeName = "otp";
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
        padding: const EdgeInsets.all(17.0),
        child: Column(
          children: [
            CustomText(
              text:
                  "ادخل الرمز الذي ارسلناه الي عنوان بريد التالي Maxxxx@gmail.com",
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: OtpTextField(
                borderRadius: BorderRadius.circular(12),
                fieldWidth: 70,
                fieldHeight: 50,
                fillColor: Colors.grey.shade300,
                filled: true,
              ),
            ),
            CustomButton(
              text: "تحقق من ارسال الرمز ",
              onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPassowrd(),
                              ),
                            )
            ),
            CustomText(
              text: "اعادة ارسال الرمز",
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
