import 'package:apppp/models/notificationModel.dart';
import 'package:apppp/widgets/Notification/ElementsPage.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Notificationmodel> notificationNew = [
      Notificationmodel(
        title: 'خصم 50% على الفواكه الطازجة بمناسبة العيد!',
        image: 'assets/images/sale/sale2.png',
        time: '9 صباحًا',
      ),
      Notificationmodel(
        title: 'اشترِ 2 واحصل على الثالثة مجانًا على المانجو!',
        image: 'assets/images/sale/sale1.png',
        time: '11 صباحًا',
      ),
      Notificationmodel(
        title: 'تخفيضات الصيف وصلت: خصومات على جميع أنواع البطيخ 🍉',
        image: 'assets/images/sale/sale2.png',
        time: '1 ظهرًا',
      ),
      Notificationmodel(
        title: 'اشترِ 2 واحصل على الثالثة مجانًا على الفراولة!',
        image: 'assets/images/sale/sale1.png',
        time: '11 صباحًا',
      ),
    ];

    List<Notificationmodel> notificationOld = [
      Notificationmodel(
        title: 'عرض اليوم فقط: خصم على الفراولة 🍓',
        image: 'assets/images/sale/sale1.png',
        time: '3 عصرًا',
      ),
      Notificationmodel(
        title: 'وفر أكتر مع باقة الفواكه الموسمية المتنوعة',
        image: 'assets/images/sale/sale2.png',
        time: '5 مساءً',
      ),
      Notificationmodel(
        title: 'شحن مجاني عند الطلب بأكثر من 100 جنيه!',
        image: 'assets/images/sale/sale1.png',
        time: '7 مساءً',
      ),
      Notificationmodel(
        title: 'أستفيد بخصم 12% لما تشترى بأكتر من 1000 جنية',
        image: 'assets/images/sale/sale2.png',
        time: '5 مساءً',
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'الأشعارات',
        isBack: true,
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              ElementsPage(
                notificationList: notificationNew,
                notificationTime: 'جديد',
              ),
              ElementsPage(
                notificationList: notificationOld,
                notificationTime: 'فى وقت سابق',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
