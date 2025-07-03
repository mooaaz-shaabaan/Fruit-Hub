import 'package:apppp/Screens/Home%20Page/notification.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(65);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 8),
      child: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => NotificationPage()),
          ),
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFEFF7E9),
            ),
            padding: const EdgeInsets.all(10),
            child: Badge(
              alignment: Alignment.topCenter,
              backgroundColor: Colors.red,
              child: Center(
                child: Icon(
                  Icons.notifications_none,
                  color: Color(0xff1B5E37),
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '!.. صباح الخير',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                  Text(
                    'أحمد مصطفى',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Gap(5),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage(
                  'assets/images/Profile Photo/profilePhoto.png',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
