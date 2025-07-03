import 'package:apppp/Screens/Home%20Page/notification.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.isBack, required this.notification});
  final String title;
  final bool isBack, notification;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          notification? GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (c) => NotificationPage()),
            ),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEFF7E9),
              ),
              padding: const EdgeInsets.all(10),
              child: Badge(
                alignment: Alignment.topCenter,
                backgroundColor: Colors.red,
                child: Icon(
                  Icons.notifications_none,
                  color: Color(0xff1B5E37),
                  size: 30,
                ),
              ),
            ),
          ): SizedBox(),
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          isBack
              ? GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              : Gap(30),
        ],
      ),
    );
  }
}
