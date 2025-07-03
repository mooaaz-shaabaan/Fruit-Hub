import 'package:apppp/Screens/cart/cart_screen.dart';
import 'package:apppp/models/cartModel.dart';
import 'package:apppp/models/fruitsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Proudcts extends StatelessWidget {
  const Proudcts({
    super.key,
    required this.fruits,
    required this.itemCount,
    required this.onTAp,
    this.onTap,
    required this.heartIsRed,
  });

  final List<FruitModel> fruits;
  final int itemCount;
  final bool onTAp;
  final bool heartIsRed;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, i) {
        final item = fruits[i];
        return GestureDetector(
          onTap: onTAp ? () => onTap?.call(i) : null,
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
                SvgPicture.asset(
                  heartIsRed
                      ? 'assets/icons/heartRed.svg'
                      : 'assets/icons/heart.svg',
                  width: 25,
                ),
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
