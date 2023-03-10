import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  const Header1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Image.asset(
            'assets/header/capture1.png',
            width: double.infinity,
          ),
          Image.asset(
            'assets/header/capture2.png',
            width: double.infinity,
          ),
          Image.asset(
            'assets/header/capture3.png',
            width: double.infinity,
          )
        ],
        options: CarouselOptions(
          height: 259,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
