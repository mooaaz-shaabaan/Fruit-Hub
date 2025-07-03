  import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget buildStepCircle(String stepNumber, String label, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? Color(0xFF1E814B) : Colors.grey.shade100,

          child: isActive
              ? Icon(Icons.check, color: Colors.white, size: 20)
              : Text(stepNumber, style: TextStyle(color: Colors.black)),
        ),

        Gap(5),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Color(0xFF1E814B) : Colors.grey.shade500,
            fontSize: 20,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
