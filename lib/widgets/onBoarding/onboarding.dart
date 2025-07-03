import 'package:apppp/Screens/auth/login.dart';
import 'package:apppp/core/constants.dart';
import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
    required this.image,
    required this.subTitle,
    required this.title,
    this.appbarTitle,
  });
  final String image;
  final String title;
  final String subTitle;
  final String? appbarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/on2.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 50,
                right: 20,
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  ),
                  child: CustomText(
                    text: appbarTitle ?? "",
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(bottom: 10, right: 60, child: Image.asset(image)),
            ],
          ),
          SizedBox(height: 20),
          title.contains("ابحث")
              ? CustomText(
                  text: title,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                )
              : RichText(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    children: [
                      TextSpan(
                        text: "مرحبا بك في ",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "Fruit",
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorSApp.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "HUB",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomText(
              text: subTitle,
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
