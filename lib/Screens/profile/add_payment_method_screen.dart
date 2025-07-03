import 'package:apppp/Screens/profile/payments_screen.dart';
import 'package:apppp/models/paymentModel.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _cardHolderNameController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'أضف وسيلة دفع جديدة',
        isBack: true,
        notification: false,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'إملاء بطاقة جديدة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextFieldAddPayment(
                  controller: _cardHolderNameController,
                  labelText: 'اسم حامل البطاقة',
                  hintText: 'أحمد ياسر',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال اسم حامل البطاقة';
                    }
                    return null;
                  },
                ),
                CustomTextFieldAddPayment(
                  controller: _cardNumberController,
                  labelText: 'رقم البطاقة',
                  hintText: '**** **** **** ****',
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length != 16) {
                      return 'الرجاء إدخال رقم بطاقة صحيح (16 رقمًا)';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldAddPayment(
                        controller: _expiryDateController,
                        labelText: 'تاريخ الانتهاء',
                        hintText: 'MM/YY',
                        keyboardType: TextInputType.datetime,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                            return 'أدخل MM/YY';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomTextFieldAddPayment(
                        controller: _cvvController,
                        labelText: 'CVV',
                        hintText: '***',
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3 ||
                              value.length > 4) {
                            return 'أدخل CVV صحيح';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final item = PaymentModel(
                          type: 'Visa',
                          last4: _cardNumberController.text.substring(
                            _cardNumberController.text.length - 4,
                          ),
                          expiry: _expiryDateController.text,
                          image: 'assets/icons/visa.svg',
                        );
                        PaymentMethods.paymentMethods.add(item);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم حفظ البطاقة')),
                        );

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (c) => PaymentsScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'أضف وسيلة دفع جديدة',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}


class CustomTextFieldAddPayment extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomTextFieldAddPayment({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          filled: true,
          fillColor: Colors.grey[50],
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }
}

