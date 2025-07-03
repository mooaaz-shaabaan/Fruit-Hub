import 'package:apppp/Screens/auth/forget_password.dart';
import 'package:apppp/Screens/auth/signup.dart';
import 'package:apppp/core/constants.dart';
import 'package:apppp/data/sign_in_with_google.dart';
import 'package:apppp/data/signin_with_email_password.dart';
import 'package:apppp/navBar/navbar.dart';
import 'package:apppp/widgets/auth/custom_button.dart';
import 'package:apppp/widgets/auth/custom_outline_button.dart';
import 'package:apppp/widgets/auth/custom_row_divider.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:apppp/widgets/auth/custom_textformfield.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = "login";

  @override
  State<Login> createState() => _LoginState();
}

String? email;
String? password;
bool isLoading = false;

class _LoginState extends State<Login> {
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "تسجيل دخول",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  hintText: "البريد الالكتروني",
                  validator: (value) {
                    email = value;
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                ),
                CustomTextFormField(
                  hintText: "كلمة المرور",
                  validator: (value) {
                    password = value;
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  obscureText: obscureText,
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassword()),
                    ),
                    child: Text(
                      "نسيت كلمة المرور ؟",
                      style: TextStyle(color: ColorSApp.textColor),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        text: "تسجيل دخول",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() => isLoading = true);

                            final errorMessage =
                                await signInWithEmailAndPassword(
                                  email,
                                  password,
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
                                SnackBar(
                                  content: Text(errorMessage),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "لا تمتلك حساب؟",
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        ),
                        child: CustomText(
                          text: "قم بإنشاء حساب",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomRowDivider(),
                CustomOutlineButton(
                  text: "تسجيل بواسطة جوجل",
                  image: 'assets/google.jpg',
                  onTap: () async {
                    final user = await AuthService().signInWithGoogle();
                    if (user != null && context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => MainScreen()),
                      );
                    }
                  },
                ),
                CustomOutlineButton(
                  text: "تسجيل بواسطة ابل",
                  image: 'assets/apple.png',
                  onTap: () {},
                ),
                CustomOutlineButton(
                  text: "تسجيل بواسطة فيسبوك",
                  image: 'assets/facebook.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
