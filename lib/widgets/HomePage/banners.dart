import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: banners.length,
      itemBuilder:
          (BuildContext context, int itemIndex, int pageViewIndex) =>
              Image.asset(banners[itemIndex]),
      options: CarouselOptions(
        height: 150,
        viewportFraction: 0.8,
        aspectRatio: 1,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
      ),
    );
  }
}
