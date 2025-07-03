import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  final List<Map<String, dynamic>> _orders = const [
    {
      'order_number': '#1234867',
      'date': '22 مارس، 2024',
      'items_count': 10,
      'total_price': 290,
      'status': 'جاري التوصيل',
      'status_icon': Icons.delivery_dining,
      'status_color': Colors.orange,
    },
    {
      'order_number': '#1234567',
      'date': '15 مارس، 2024',
      'items_count': 5,
      'total_price': 150,
      'status': 'تم التوصيل',
      'status_icon': Icons.check_circle_outline,
      'status_color': Colors.green,
    },
    {
      'order_number': '#1234900',
      'date': '10 مارس، 2024',
      'items_count': 8,
      'total_price': 210,
      'status': 'تم الإلغاء',
      'status_icon': Icons.cancel_outlined,
      'status_color': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'طلباتى', isBack: true, notification: false),
      body: _orders.isEmpty
          ? const Center(child: Text('لا توجد طلبات سابقة.'))
          : Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _orders.length,
                itemBuilder: (context, index) {
                  final order = _orders[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'طلب رقم ${order['order_number']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                order['date'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 25, thickness: 0.5),
                          Row(
                            children: [
                              Icon(
                                order['status_icon'],
                                color: order['status_color'],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                order['status'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: order['status_color'],
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '${order['items_count']} منتج',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'المبلغ الكلي:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '${order['total_price']} جنيه',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'عرض تفاصيل الطلب ${order['order_number']}',
                                    ),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.green,
                                side: const BorderSide(color: Colors.green),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'تتبع الطلب', // يمكن تغييرها إلى "عرض التفاصيل" حسب الحالة
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
