import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Swap extends StatefulWidget {
  const Swap({Key? key}) : super(key: key);

  @override
  State<Swap> createState() => _SwapState();
}

class _SwapState extends State<Swap> {
  late double _screenWidth, _screenHeight;
  Color caloriesAmountC = Color(0xff7a5555);
  @override
  Widget build(BuildContext context) {
    _screenHeight = _getHeight();
    _screenWidth = _getWidth();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 0.05 * _screenWidth,
                  ),
                  Text(
                    'SWAP',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(
                    height: _screenHeight * 0.05,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: _screenWidth * 0.3 ,
                      height: _screenHeight * 0.1 ,
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: _screenWidth * 0.04),
                        child: listRow());
                  }),
            )
          ],
        ),
      ),
    );
  }

  Row listRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              'assets/images/dish_1.jpg',
              height: _screenHeight * 0.11,
              width: _screenWidth * 0.2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: _screenWidth * 0.03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BreakFast', style: TextStyle( color: caloriesAmountC)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                         Icon(Icons.local_fire_department_sharp,size: 15,color: caloriesAmountC,),
                          Text('277 kcal per serving',
                          style: TextStyle( color: caloriesAmountC ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right),
                  ],
                ),
                Text('Oatmeal with berries'),
              ],
            ),
          ),
        ]);
  }

  _getHeight() {
    return MediaQuery.of(context).size.height >
            MediaQuery.of(context).size.width
        ? MediaQuery.of(context).size.height
        : MediaQuery.of(context).size.width;
  }

  _getWidth() {
    return MediaQuery.of(context).size.height >
            MediaQuery.of(context).size.width
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
  }
}
