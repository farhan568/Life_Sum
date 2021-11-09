import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateMeal extends StatelessWidget {
  CreateMeal({Key? key}) : super(key: key);
   late double _screenWidth, _screenHeight;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appBarC(),
          Container(
            height: _screenHeight * 0.3,
            color: Colors.grey,
            child: Column(
              children: [
                Text('Meal Info'),
                mealInfoC(),
                Text('MEAL CONTENT'),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Container appBarC() {
    return Container(
          height: _screenHeight * 0.02,
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  Text('CREATE MEAL'),
                ],
              ),
              Text('CREATE MEAL'),
            ],
          ),
        );
  }

  Container mealInfoC() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name of Meal'),
              Text('Required'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Photo of meal'),
              Row(
                children: [
                  Icon(Icons.camera_alt_rounded),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
