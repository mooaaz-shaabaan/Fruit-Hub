import 'package:apppp/core/constants.dart';
import 'package:apppp/data/create_emailwith_username_password.dart';
import 'package:apppp/navBar/navbar.dart';
import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:apppp/widgets/auth/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routeName = "Sign Up";
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscureText = true;
  bool isChecked = false;
  String? userName;
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "حساب جديد",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "الاسم كامل",
                  onChanged: (value) => userName = value,
                  validator: (value) {
                    if (value == null) {
                      return "الرجاء ادخال الاسم";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "البريد الالكتروني",
                  onChanged: (value) => email = value,
                  validator: (value) {
                    if (value == null) {
                      return "الرجاء ادخال البريد الالكتروني";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "كلمة المرور",
                  obscureText: obscureText,
                  onChanged: (value) => password = value,
                  validator: (value) {
                    if (value == null) {
                      return "الرجاء ادخال كلمة المرور";
                    }
                    return null;
                  },
                  iconButton: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                      setState(() {});
                    },
                    icon: obscureText
                        ? Icon(Icons.visibility_off, color: Colors.grey)
                        : Icon(Icons.visibility, color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      focusColor: Colors.green,
                      activeColor: ColorSApp.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      side: BorderSide(color: Colors.grey.shade400),
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    RichText(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "من خلال إنشاء حساب , فإنك توافق علي ",
                          ),
                          TextSpan(
                            text: "الشروط \nو الأحكام الخاصه بنا",
                            style: TextStyle(color: ColorSApp.textColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        text: "إنشاء حساب جديد",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (!isChecked) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "يجب الموافقة على الشروط والأحكام",
                                  ),
                                ),
                              );
                              return;
                            }

                            setState(() => isLoading = true);

                            final errorMessage =
                                await createEmailWithUsernameAndPassword(
                                  email,
                                  password,
                                  userName,
                                );

                            setState(() => isLoading = false);

                            if (errorMessage == null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(errorMessage)),
                              );
                            }
                          }
                        },
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "تمتلك حساب بالفعل؟",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: "تسجيل دخول",
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
