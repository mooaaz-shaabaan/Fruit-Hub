import 'package:apppp/widgets/auth/custom_text.dart';
import 'package:flutter/material.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(endIndent: 12, thickness: 1)),
        CustomText(
          text: "أو",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        Expanded(child: Divider(thickness: 1, indent: 12)),
      ],
    );
  }
}
