import 'package:apppp/data/sign_out.dart';
import 'package:apppp/Screens/profile/favorits.dart';
import 'package:apppp/Screens/profile/my_orders_screen.dart';
import 'package:apppp/Screens/profile/payments_screen.dart';
import 'package:apppp/Screens/profile/profile_details_screen.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool _isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'حسابى',
          isBack: false,
          notification: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/Profile Photo/profilePhoto.png',
                    ),
                    backgroundColor: Colors.grey[200],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Gap(25),
                      const Text(
                        'أحمد مصطفى',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'mail@mail.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ],
              ),
              Gap(25),
              Text(
                'عام',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Gap(20),
              _buildAccountOption(
                context,
                icon: 'assets/icons/user.svg',
                title: 'الملف الشخصي',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileDetailsScreen(),
                    ),
                  );
                },
              ),
              _buildAccountOption(
                context,
                icon: 'assets/icons/box.svg',
                title: 'طلباتي',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyOrdersScreen(),
                    ),
                  );
                },
              ),
              _buildAccountOption(
                context,
                icon: 'assets/icons/heart.svg',
                title: 'المفضلة',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Favorite()),
                  );
                },
              ),
              _buildAccountOption(
                context,
                icon: 'assets/icons/empty-wallet.svg',
                title: 'المدفوعات',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentsScreen(),
                    ),
                  );
                },
              ),
              _buildAccountOption(
                context,
                icon: 'assets/icons/notification.svg',
                title: 'الإشعارات',
                trailingWidget: Switch(
                  value: _isNotificationEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isNotificationEnabled = value;
                    });
                  },
                  activeColor: Colors.green,
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    signOutUser(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[100],
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text(
                    'تسجيل الخروج',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption(
    BuildContext context, {
    required String icon,
    required String title,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(icon, width: 30),
                Gap(5),
                Text(
                  title,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 17),
                ),
                Spacer(),
                trailingWidget ?? const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),
            Divider(color: Colors.grey.shade200),
          ],
        ),
      ),
    );
  }
}
