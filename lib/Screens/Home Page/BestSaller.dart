import 'package:apppp/models/fruitsModel.dart';
import 'package:apppp/widgets/BestSaller/Proudcts.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Bestsaller extends StatelessWidget {
  const Bestsaller({super.key, required this.fruits});
  final List<FruitModel> fruits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الأكثر مبيعًا',
        isBack: true,
        notification: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 14),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            children: [
              Text(
                'الأكثر مبيعا',

                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Gap(20),
              Proudcts(
                fruits: fruits,
                itemCount: fruits.length,
                onTAp: false,
                heartIsRed: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
