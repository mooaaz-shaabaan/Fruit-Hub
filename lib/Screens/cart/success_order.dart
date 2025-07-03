import 'package:apppp/navBar/navbar.dart';
import 'package:apppp/widgets/cart/customButon.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الدفع', isBack: false, notification: false),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Gap(35),
                Image.asset('assets/images/success/success.png', width: 180),
                Gap(50),
                Text(
                  'تم بنجاح !',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
                ),
                Gap(15),
                Text(
                  'رقم الطلب : 1245789663#',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Gap(100),
                CustomButon(
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (c) => MainScreen()),
                    (route) => false,
                  ),
                  title: 'الرئيسية',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
