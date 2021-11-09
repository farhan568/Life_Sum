import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lifesum/meal_planner_page.dart';
import 'package:lifesum/shopping_list_page.dart';

class AbdominalCrunch extends StatefulWidget {
  AbdominalCrunch({Key? key}) : super(key: key);
  Color checkC = Color(0xff3FCE8E);
  Color checkContainerC = Color(0xffD94A8C);

  @override
  State<AbdominalCrunch> createState() => _AbdominalCrunchState();
}

class _AbdominalCrunchState extends State<AbdominalCrunch> {
  late double _screenHeight;
  late double _screenWeight;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWeight = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: widget.checkContainerC,
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  child: SizedBox(
                    height: 0.3 * _screenHeight,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShoppingList()));
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: _screenWeight * 0.05,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MealPlanner()));
                                },
                                child: Text(
                                  'LIFESUM',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.03 * _screenWeight,
                              bottom: 0.02 * _screenHeight),
                          child: Text(
                            'Abdominal (Ab) Crunch',
                            style:
                                TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: -25,
                    right: 20,

                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: FloatingActionButton(
                          backgroundColor: widget.checkC,
                          onPressed: () {
                          },
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          )),
                    ))
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 15, horizontal: 0.05 * _screenWeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '41 ',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'kcal',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextFormField(

                          decoration: InputDecoration(
                              hintText: '30',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        flex: 2,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Minutes',
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
