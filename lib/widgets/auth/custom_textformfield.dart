import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.iconButton,
    this.textInputType,
    this.onChanged,
  });
  final String hintText;
  final IconButton? iconButton;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 6),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 126)),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 10,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,

          hintText: hintText,
          suffixIcon: iconButton,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
