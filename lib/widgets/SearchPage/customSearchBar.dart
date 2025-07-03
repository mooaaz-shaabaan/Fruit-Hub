import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSearchBarr extends StatelessWidget {
  const CustomSearchBarr({super.key, required this.controller, this.onChanged,});
  final TextEditingController controller;
final void Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
      ),
      child: Row(
        children: [
          Icon(Icons.tune, color: Colors.grey[500]),
          Expanded(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'ابحث عن......',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Gap(8),
          Icon(Icons.search, color: Colors.green[800]),
        ],
      ),
    );
  }
}
