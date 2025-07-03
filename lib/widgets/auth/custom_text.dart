import 'package:apppp/core/constants.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color = ColorSApp.primaryColor,
    required this.fontWeight,
    required this.fontSize, this.textAlign,
  });
  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign:textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
