import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'abdominal_crunch_page.dart';

class MealPlanner extends StatefulWidget {
  MealPlanner({Key? key}) : super(key: key);

  @override
  State<MealPlanner> createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {
  late double _screenHeight, _screenWidth;
  Color refreshIconC = Color(0xffAAA8B3);

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                Container(
                 color: Colors.grey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => AbdominalCrunch()));
                                },
                                child: Icon(Icons.arrow_back)),
                            Text(
                              'Meal planner',
                              style: TextStyle(fontSize: 20),
                            ),
                            Icon(Icons.info_outline),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Breakfast',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Lunch',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Snacks',
                            style: TextStyle(fontSize: 15),
                          ),
                          Text(
                            'Dinner',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _screenHeight * 0.02),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.only(left: 10, bottom: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.02 * _screenHeight,
                          ),
                          Text(
                            'Today 2nd November',
                            style: TextStyle(color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: rowList(),
                                ),
                                Expanded(
                                  child: rowList(),
                                ),
                                Expanded(
                                  child: rowList(),
                                ),
                                Expanded(
                                  child: rowList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox rowList() {
    return SizedBox(
      height: _screenHeight > _screenWidth
          ? 0.17 * _screenHeight
          : 0.17 * _screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(clipBehavior: Clip.none, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/dish_1.jpg',
                      width: _screenWidth > _screenHeight
                          ? _screenWidth * 0.8
                          : _screenHeight * 0.8,
                      height: _screenHeight > _screenWidth
                          ? 0.10 * _screenHeight
                          : 0.10 * _screenWidth,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -15,
                    child: CircleAvatar(
                        backgroundColor: refreshIconC,
                        child: ImageIcon(
                          AssetImage("assets/images/refresh.png"),
                          color: Colors.white,

                        )
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
