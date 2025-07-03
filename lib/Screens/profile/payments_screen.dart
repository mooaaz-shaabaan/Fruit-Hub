import 'package:apppp/models/paymentModel.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'add_payment_method_screen.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({super.key});

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  void _deleteCard(int index) {
    final deletedCard = PaymentMethods.paymentMethods[index];
    setState(() {
      PaymentMethods.paymentMethods.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم حذف بطاقة **** ${deletedCard.last4}'),
        action: SnackBarAction(
          label: 'تراجع',
          onPressed: () {
            setState(() {
              PaymentMethods.paymentMethods.insert(index, deletedCard);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'المدفوعات',
        isBack: true,
        notification: false,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,

        child: Column(
          children: [
            Expanded(
              child: PaymentMethods.paymentMethods.isEmpty
                  ? const Center(child: Text('لا توجد وسائل دفع محفوظة.'))
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: PaymentMethods.paymentMethods.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => _PaymentCard(
                        method: PaymentMethods.paymentMethods[index],
                        onDelete: () => _deleteCard(index),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (c) => AddPaymentMethodScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                label: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      const Text(
                        'أضف وسيلة دفع جديدة',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentCard extends StatelessWidget {
  final PaymentModel method;
  final VoidCallback onDelete;

  const _PaymentCard({required this.method, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: (method.image).isNotEmpty
            ? SvgPicture.asset(method.image, width: 40, height: 40)
            : const Icon(Icons.credit_card, size: 40, color: Colors.green),
        title: Text(
          '${method.type} ****${method.last4}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'ينتهي في: ${method.expiry}',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
