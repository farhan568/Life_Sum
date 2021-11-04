import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.chevron_left),
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
                SizedBox(height: _screenHeight * 0.02),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
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
                            padding: const EdgeInsets.all(8.0),
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
          ? 0.18 * _screenHeight
          : 0.18 * _screenWidth,
      child: Card(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Stack(clipBehavior: Clip.none, children: [
                  Image.asset(
                    'assets/images/dish_1.jpg',
                    width: _screenWidth > _screenHeight
                        ? _screenWidth * 0.6
                        : _screenHeight * 0.6,
                    height: _screenHeight > _screenWidth
                        ? 0.10 * _screenHeight
                        : 0.10 * _screenWidth,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: _screenHeight * 0.5,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -15,
                    child: CircleAvatar(child: Icon(Icons.refresh)),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
