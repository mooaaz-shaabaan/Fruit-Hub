import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:apppp/widgets/auth/custom_textformfield.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class NewPassowrd extends StatelessWidget {
  const NewPassowrd({super.key});
static const routeName = "new password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "كلمة مرور جديدة",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            CustomText(
              text: "قم بإنشاء كلمة مرور جديدة لتسجيل الدخول",
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: "كلمة المرور الجديدة",
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
            ),
            CustomTextFormField(
              hintText: "تأكيد كلمة المرور الجديدة",
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
            ),
            CustomButton(
              text: "انشاء كلمة مرور جديدة",
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  desc: "تم تغير الباسورد بنجاح",
                  animType: AnimType.topSlide,
                  dialogType: DialogType.success,
                ).show();
              },
            ),
          ],
        ),
      ),
    );
  }
}
