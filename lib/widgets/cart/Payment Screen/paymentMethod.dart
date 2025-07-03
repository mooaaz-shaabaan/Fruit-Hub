import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget paymentMethod(
  String imagePath,
  bool isBlue,
  int value,
  void Function() onTap,
  Color color,
) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      width: 60,
      decoration: BoxDecoration(
        color: isBlue ? Color(0xff1434CB) : Colors.white,
        border: Border.all(color: color, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.contain,
        color: isBlue ? Colors.white : null,
      ),
    ),
  );
}
