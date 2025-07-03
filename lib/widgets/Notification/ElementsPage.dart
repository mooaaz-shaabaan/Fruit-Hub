import 'package:apppp/models/notificationModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ElementsPage extends StatelessWidget {
  const ElementsPage({
    super.key,
    required this.notificationList,
    required this.notificationTime,
  });
  final List<Notificationmodel> notificationList;
  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              notificationTime,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Gap(7),
            CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffEBF9F1),
              child: Text(
                '2',
                style: TextStyle(
                  color: Color(0xff1B5E37),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            Spacer(),
            Text(
              'تحديد الكل مقروء',
              style: TextStyle(fontSize: 17, color: Color(0xff949D9E)),
            ),
          ],
        ),
        Gap(25),
        Column(
          children: List.generate(notificationList.length, (i) {
            final item = notificationList[i];
            return Column(
              children: [
                buildNotificationItem(item.title, item.time, item.image),
                Gap(30),
              ],
            );
          }),
        ),
      ],
    );
  }

  Widget buildNotificationItem(String text, String time, String imagePath) {
    final regex = RegExp(r'\d+%');
    final match = regex.firstMatch(text);

    String before = '', highlight = '', after = '';
    bool hasPercent = false;

    if (match != null) {
      hasPercent = true;
      before = text.substring(0, match.start);
      highlight = text.substring(match.start, match.end);
      after = text.substring(match.end);
    }

    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(5),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.white,
          ),
        ),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: hasPercent
                        ? RichText(
                            textDirection: TextDirection.rtl,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 16.5,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Cairo',
                              ),
                              children: [
                                TextSpan(text: before),
                                TextSpan(
                                  text: highlight,
                                  style: TextStyle(color: Colors.red),
                                ),
                                TextSpan(text: after),
                              ],
                            ),
                          )
                        : Text(
                            text,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 13,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}