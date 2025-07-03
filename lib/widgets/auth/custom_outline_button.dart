import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.image, required this.onTap,
  });
  final String text;
  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            side: BorderSide(color: Colors.grey.shade400),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(width: 20),
              Image.asset(image, width: 30, height: 30),
              SizedBox(width: 40),
              CustomText(
                text: text,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
