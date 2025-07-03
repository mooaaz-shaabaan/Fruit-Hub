import 'package:apppp/Screens/Home%20Page/BestSaller.dart';
import 'package:apppp/Screens/Proudcts/item_details_screen.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:apppp/services/fruit_service.dart';
import 'package:apppp/widgets/BestSaller/Proudcts.dart';
import 'package:apppp/widgets/HomePage/AppBarHomePage.dart';
import 'package:apppp/widgets/HomePage/CustomSearchBar.dart';
import 'package:apppp/widgets/HomePage/banners.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> banners = [
    'assets/images/banner/banner1.png',
    'assets/images/banner/banner2.png',
    'assets/images/banner/banner3.png',
  ];

  List<FruitModel> fruits = [];
  bool isLoading = true;

  void initState() {
    super.initState();
    loadFruits(); // اسم جديد
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: Customappbar(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  //Search Bar
                  CustomSearchBar(fruits: fruits),
                  //Banners
                  Banners(banners: banners),
                  //Products
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 8,
                      right: 15,
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bestsaller(fruits: fruits),
                            ),
                          ),
                          child: Text(
                            'المزيد',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                        Text(
                          'الأكثر مبيعا',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Proudcts(
                    fruits: fruits,
                    itemCount: 4,
                    heartIsRed: false,
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
                        setState(
                          () {},
                        ); 
                      }
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
