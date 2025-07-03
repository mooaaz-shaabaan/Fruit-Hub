import 'package:apppp/Screens/Home%20Page/BestSaller.dart';
import 'package:apppp/Screens/Proudcts/item_details_screen.dart';
import 'package:apppp/models/categoryModel.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:apppp/services/fruit_service.dart';
import 'package:apppp/widgets/BestSaller/Proudcts.dart';
import 'package:apppp/widgets/HomePage/CustomSearchBar.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Categorymodel> categories = [
    Categorymodel(name: 'أناناس', image: 'assets/images/fruits/ananas.png'),
    Categorymodel(name: 'بطيخ', image: 'assets/images/fruits/bati5.png'),
    Categorymodel(name: 'فراولة', image: 'assets/images/fruits/frawla.png'),
    Categorymodel(name: 'موز', image: 'assets/images/fruits/mooz.png'),
    Categorymodel(name: 'أفوكادو', image: 'assets/images/fruits/Avocado.png'),
  ];

  @override
  void initState() {
    super.initState();
    loadFruits();
  }

  List<FruitModel> fruits = [];
  bool isLoading = true;

  Future<void> loadFruits() async {
    final fetchedFruits = await FruitService.fetchFruits();

    if (!mounted) return;

    if (fetchedFruits.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل تحميل البيانات. تأكد من اتصال الإنترنت')),
      );
    }

    setState(() {
      fruits = fetchedFruits;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(title: 'المنتجات', isBack: false,notification: false),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  CustomSearchBar(fruits: fruits),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'منتجاتنا',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(10),
                  // Categories List
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final item = categories[index];
                        return CategoryCard(
                          categoryName: item.name,
                          imagePath: item.image,
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  Row(
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  // Products Grid
                  Proudcts(
                    fruits: fruits,
                    itemCount: fruits.length,
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

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;

  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: 5), // مسافة بين الكروت
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: Center(
              child: Image.asset(imagePath, height: 40, fit: BoxFit.contain),
            ),
          ),
          const Gap(5),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
