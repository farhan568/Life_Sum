import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliderLib extends StatefulWidget {
  MySliderLib({Key? key}) : super(key: key);
  final List<String> imgUrls = [
    'https://image.shutterstock.com/image-photo/bank-blocks-linked-money-by-600w-1937886058.jpg',
    'https://image.shutterstock.com/image-vector/check-back-soon-hand-lettering-600w-1379832464.jpg',
    'https://image.shutterstock.com/image-photo/black-steel-large-anchor-chain-600w-1081708619.jpg',
    'https://image.shutterstock.com/image-photo/black-metal-large-anchor-chain-600w-1081705028.jpg',
  ];

  @override
  _MySliderLibState createState() => _MySliderLibState();
}

class _MySliderLibState extends State<MySliderLib> {
  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarouselSlider.builder(
              carouselController: buttonCarouselController,
              itemCount: widget.imgUrls.length,
              itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                  Container(child: Image.network(widget.imgUrls[itemIndex])),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => buttonCarouselController.previousPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  onPressed: () => buttonCarouselController.nextPage(
                      duration: Duration(milliseconds: 300), curve: Curves.linear),
                  child: Text('→'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
