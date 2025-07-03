
  import 'package:flutter/material.dart';

  Widget buildTextField({
    required String hint,TextEditingController? controller,required bool isController}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: TextFormField(
        controller: isController?controller:null,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Color(0xffF9FAFA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
