import 'package:apppp/Screens/cart/confirm_order_screen%20.dart';
import 'package:apppp/Screens/profile/add_payment_method_screen.dart';
import 'package:apppp/widgets/cart/Payment%20Screen/paymentMethod.dart';
import 'package:apppp/widgets/cart/buildStepCircle.dart';
import 'package:apppp/widgets/cart/customButon.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.totalPrice,
    required this.address,
  });
  final double totalPrice;
  final String address;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isDefault = true;
  bool checkBox = false;
  int value = 0;
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الدفع', isBack: true, notification: false),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildStepCircle("1", "الشحن", true),
                  buildStepCircle("2", "العنوان", true),
                  buildStepCircle("3", "الدفع", true),
                  buildStepCircle("4", "المراجعه", false),
                ],
              ),
              Gap(10),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "اختر طريقة الدفع المناسبة :",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "من فضلك اختر طريقة الدفع المناسبة لك.",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        paymentMethod(
                          "assets/icons/applepay.svg",
                          false,
                          value,
                          () {
                            setState(() {
                              value = 1;
                            });
                          },
                          value == 1
                              ? Colors.green.shade900
                              : Colors.grey.shade300,
                        ),
                        paymentMethod(
                          "assets/icons/paypal.svg",
                          false,
                          value,
                          () {
                            setState(() {
                              value = 2;
                            });
                          },
                          value == 2
                              ? Colors.green.shade900
                              : Colors.grey.shade300,
                        ),
                        paymentMethod(
                          "assets/icons/mastercard.svg",
                          false,
                          value,
                          () {
                            setState(() {
                              value = 3;
                            });
                          },
                          value == 3
                              ? Colors.green.shade900
                              : Colors.grey.shade300,
                        ),
                        paymentMethod(
                          "assets/icons/visa.svg",
                          true,
                          value,
                          () {
                            setState(() {
                              value = 4;
                            });
                          },
                          value == 4
                              ? Colors.green.shade900
                              : Colors.grey.shade300,
                        ),
                      ],
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
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 16) {
                          return 'الرجاء إدخال رقم بطاقة صحيح (16 رقمًا)';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
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
                        const Gap(16),
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: checkBox,
                          onChanged: (value) => setState(() {
                            checkBox = value!;
                          }),
                          checkColor: Colors.white,
                          activeColor: Colors.green.shade900,
                        ),
                        const Text("جعل البطاقة افتراضية"),
                      ],
                    ),
                    const SizedBox(height: 30),

                    CustomButon(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => ConfirmOrderScreen(
                                totalPrice: widget.totalPrice,
                                cardNumber: int.parse(
                                  _cardNumberController.text,
                                ),
                                address: widget.address,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('من فضلك أكمل بيانات البطاقة'),
                            ),
                          );
                        }
                      },
                      title: "تأكيد & استمرار",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
