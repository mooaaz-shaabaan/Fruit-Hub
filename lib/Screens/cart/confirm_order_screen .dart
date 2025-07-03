import 'package:apppp/Screens/cart/success_order.dart';
import 'package:apppp/widgets/cart/buildStepCircle.dart';
import 'package:apppp/widgets/cart/customButon.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({
    super.key,
    required this.totalPrice,
    required this.cardNumber,
    required this.address,
  });
  final double totalPrice;
  final int cardNumber;
  final String address;

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  @override
  Widget build(BuildContext context) {
    int delivery = 30;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المراجعة',
        isBack: true,
        notification: false,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // ✅ الخطوات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildStepCircle("1", "الشحن", true),
                  buildStepCircle("2", "العنوان", true),
                  buildStepCircle("3", "الدفع", true),
                  buildStepCircle("4", "المراجعه", true),
                ],
              ),
              const Gap(20),
              const Text(
                'ملخص الطلب:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Gap(10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('المجموع الفرعي:'),
                        Text('${widget.totalPrice}'),
                      ],
                    ),
                    const Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('التوصيل:'), Text('$delivery')],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'الكلي',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.totalPrice + delivery}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(20),

              const Text(
                'يرجى تأكيد طلبك',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const Gap(20),

              // ✅ وسيلة الدفع
              const Text('وسيلة الدفع'),
              Gap(10),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.credit_card, color: Colors.blue),
                    const Gap(10),
                    Text(
                      '${widget.cardNumber.toString().substring(widget.cardNumber.toString().length - 4)} **** **** ****',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Gap(20),

              // ✅ عنوان التوصيل
              const Text('عنوان التوصيل'),
              Gap(10),
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on),
                    const Gap(10),
                    Expanded(
                      child: Text(
                        widget.address,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(240),

              CustomButon(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => SuccessOrder()),
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
}
