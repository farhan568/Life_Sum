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
              height: 0.3 * _screenHeight,
              color: widget.checkContainerC,
              child: Stack(clipBehavior: Clip.none, children: [
                Column(
                  children: [
                    Expanded(
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
                                        MaterialPageRoute(builder: (context) => ShoppingList()));
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: _screenWeight*0.05,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => MealPlanner()));
                                  },
                                  child: Text(
                                    'LIFESUM',
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 0.03*_screenWeight,bottom: 0.02*_screenHeight),
                            child: Text(
                              'Abdominal (Ab) Crunch',
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    bottom: -40,
                    right: 15,
                    top: 150,
                    child: CircleAvatar(
                        backgroundColor: widget.checkC,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        )))
              ]),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 0.03*_screenWeight),

              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('41 ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                      Text('kcal'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: _screenWeight*0.2,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: '30'
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: _screenWeight*0.6,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Minutes'
                          ),
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
