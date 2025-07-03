import 'package:apppp/Screens/Proudcts/item_details_screen.dart';
import 'package:apppp/Screens/cart/cart_screen.dart';
import 'package:apppp/models/cartModel.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:apppp/widgets/SearchPage/customSearchBar.dart';
import 'package:apppp/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.fruits});
  final List<FruitModel> fruits;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  List<FruitModel> filterList = [];

  @override
  void initState() {
    super.initState();
    filterList = widget.fruits;
  }

  void _searchFunction(String keyWord) {
    setState(() {
      filterList = widget.fruits.where((fruit) {
        final title = fruit.name.toString().toLowerCase();
        final input = keyWord.toString().toLowerCase();

        return title.startsWith(input);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: CustomAppBar(title: 'البحث', isBack: true, notification: false),
        body: ListView(
          children: [
            CustomSearchBarr(
              controller: controller,
              onChanged: _searchFunction,
            ),
            Gap(20),
            filterList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Not Found/NotFound.png',
                        height: 350,
                      ),
                    ],
                  )
                : AfterSearch(filterList: filterList),
          ],
        ),
      ),
    );
  }
}

class AfterSearch extends StatefulWidget {
  const AfterSearch({super.key, required this.filterList});

  final List<FruitModel> filterList;

  @override
  State<AfterSearch> createState() => _AfterSearchState();
}

class _AfterSearchState extends State<AfterSearch> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.filterList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, i) {
        final item = widget.filterList[i];
        return GestureDetector(
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (c) => ItemDetailsScreen(
                  name: item.name,
                  price: item.price,
                  image: item.image,
                ),
              ),
            );

            if (result == true) {
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.all(10),
            width: 200,
            height: 266,
            decoration: BoxDecoration(
              color: Color(0xffF3F5F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset('assets/icons/heart.svg', width: 25),
                SizedBox(
                  width: 200,
                  height: 120,
                  child: Image.network(item.image),
                ),
                Gap(10),
                Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xff1B5E37),
                      radius: 24,
                      child: IconButton(
                        onPressed: () {
                          final itemm = Cartmodel(
                            name: item.name,
                            price: item.price,
                            image: item.image,
                            totalPrice: int.parse(item.price) * 1,
                            quantity: 1,
                          );
                          CartStorage.cartList.add(itemm);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'تمت أضافة ${item.name} بنجاح الى السلة',
                              ),
                              backgroundColor: Colors.green,
                              duration: Duration(seconds: 2),
                              action: SnackBarAction(
                                label: 'عرض السلة',
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (c) => CartScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },

                        icon: Icon(Icons.add, color: Colors.white, size: 30),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'الكيلو /',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.orange.shade300,
                      ),
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        '${item.price}جنية',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.orange.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
