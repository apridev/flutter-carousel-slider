import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductPageList();
  }
}

class ProductPageList extends State<ProductPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> images = [
    'assets/product.png',
    'assets/product.png',
    'assets/product.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECEDEF),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.chevron_left
              ),
              Icon(
                Icons.shopping_bag
              ),
            ],
          ),
        ),
        CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                // autoPlay: true,
                // enlargeCenterPage: true,
                // aspectRatio: 2.0,
                onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: entry.key == _current ? 18 : 6,
                height: 6,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: entry.key == _current ? Colors.red : Colors.black12),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
