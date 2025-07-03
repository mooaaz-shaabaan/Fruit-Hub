import 'package:apppp/Screens/cart/payment_screen.dart';
import 'package:apppp/widgets/cart/Payment%20Screen/custom_text_field.dart';
import 'package:apppp/widgets/cart/customButon.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController flowrNumberController = TextEditingController();
  bool saveAddress = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'العنوان', isBack: true, notification: false),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStepCircle("1", "الشحن", true),
                    _buildStepCircle("2", "العنوان", true),
                    _buildStepCircle("3", "الدفع", false),
                    _buildStepCircle("4", "المراجعه", false),
                  ],
                ),
                const Gap(30),
                buildTextField(hint: "الاسم كامل", isController: false),
                buildTextField(hint: "البريد الإلكتروني", isController: false),
                buildTextField(
                  hint: "العنوان",
                  controller: addressController,
                  isController: true,
                ),
                buildTextField(hint: "المدينه", isController: false),
                buildTextField(
                  hint: "رقم الطابق ، رقم الشقه ..",
                  controller: flowrNumberController,
                  isController: true,
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8,
                      child: Switch(
                        value: saveAddress,
                        onChanged: (val) {
                          setState(() {
                            saveAddress = val;
                          });
                        },
                        activeColor: Colors.green.shade700,
                      ),
                    ),
                    const Text(
                      "حفظ العنوان",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(20),

                CustomButon(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => PaymentScreen(
                          address:
                              '${addressController.text}, ${flowrNumberController.text}',
                          totalPrice: widget.totalPrice,
                        ),
                      ),
                    );
                  },
                  title: 'التالى',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepCircle(String stepNumber, String label, bool isActive) {
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
}
