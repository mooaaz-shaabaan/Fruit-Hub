import 'package:apppp/Screens/cart/add_address_screen.dart';
import 'package:apppp/widgets/cart/buildStepCircle.dart';
import 'package:apppp/widgets/cart/customButon.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShippingScreen extends StatefulWidget {
  const ShippingScreen({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  int selectedMethod = 3;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'الشحن',
          isBack: false,
          notification: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStepCircle("1", "الشحن", true),
                  buildStepCircle("2", "العنوان", false),
                  buildStepCircle("3", "الدفع", false),
                  buildStepCircle("4", "المراجعه", false),
                ],
              ),
              const Gap(30),

              _buildShippingOption(
                title: "الدفع عند الاستلام",
                subtitle: "التسليم من المكان",
                price: "40 جنيه",
                value: 1,
              ),
              const Gap(12),

              _buildShippingOption(
                title: "اشترِ الآن وادفع لاحقًا",
                subtitle: "يرجى تحديد طريقة الدفع",
                price: "مجاني",
                value: 2,
              ),

              Gap(70),

              CustomButon(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) =>
                          AddressScreen(totalPrice: widget.totalPrice),
                    ),
                  );
                },
                title: 'التالى',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShippingOption({
    required String title,
    required String subtitle,
    required String price,
    required int value,
  }) {
    final bool isSelected = selectedMethod == value;

    return InkWell(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: isSelected ? const Color(0xFF1E814B) : Colors.grey.shade300,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: selectedMethod,
              onChanged: (val) => setState(() => selectedMethod = val!),
              activeColor: const Color(0xFF1E814B),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Text(
              price,
              style: TextStyle(
                color: value == 2 ? Colors.green : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
