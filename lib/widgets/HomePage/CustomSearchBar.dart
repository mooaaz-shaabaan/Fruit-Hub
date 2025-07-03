import 'package:apppp/Screens/Home%20Page/SearchPage.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.fruits});
  final List<FruitModel> fruits;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => SearchPage(fruits: fruits)),
      ),
      child: Container(
        height: 50,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
        ),
        child: Row(
          children: [
            Icon(Icons.tune, color: Colors.grey[500]),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'ابحث عن......',
                  style: TextStyle(color: Colors.grey[400], fontSize: 15),
                ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: '',
                //     hintStyle: TextStyle(color: Colors.grey[400]),
                //     border: InputBorder.none,
                //   ),
                // ),
              ),
            ),
            Gap(8),
            Icon(Icons.search, color: Colors.green[800]),
          ],
        ),
      ),
    );
  }
}
