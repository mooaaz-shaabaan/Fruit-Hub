import 'package:apppp/Screens/Proudcts/item_details_screen.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:apppp/services/fruit_service.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:apppp/widgets/BestSaller/Proudcts.dart';


class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<FruitModel> fruits = [];
  bool isLoading = true;

  void initState() {
    super.initState();
    loadFruits();
  }

  Future<void> loadFruits() async {
    fruits = await FruitService.fetchFruits();
    print(fruits);

    if (mounted) {
      if (fruits.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل تحميل البيانات. تأكد من اتصال الإنترنت')),
        );
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'المفضلة', isBack: true, notification: false),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Proudcts(
              fruits: fruits,
              itemCount: 4,
              heartIsRed: true,
              onTAp: true,
              onTap: (index) async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => ItemDetailsScreen(
                      name: fruits[index].name,
                      price: fruits[index].price,
                      image: fruits[index].image,
                    ),
                  ),
                );

                if (result == true) {
                  setState(() {});
                }
              },
            ),
    );
  }
}
