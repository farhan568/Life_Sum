import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreferenceSurvey extends StatefulWidget {
   PreferenceSurvey({Key? key}) : super(key: key);

  @override
  State<PreferenceSurvey> createState() => _PreferenceSurveyState();
}

class _PreferenceSurveyState extends State<PreferenceSurvey> {
  final Color _questionC = Color(0xff8178C7);

  late double _screenWidth,_screenHeight;

     bool _isChecked = false ;


  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(child:
    Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _questionContainer(),
          SizedBox(
            height: _screenHeight * 0.01 ,
          ),
          optionListC(),
          SizedBox(
            height: _screenHeight * 0.01 ,
          ),
          SizedBox(
            width: _screenWidth,
            height: _screenHeight * 0.32,
          ),
          nextNavC(),
        ],
      ),
    )
    );
  }

  Expanded nextNavC() {
    return Expanded(
            child: Container(
              width: _screenWidth,
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Next', style: TextStyle( fontSize: 20 , color: Colors.white ), ),
                  Icon(Icons.navigate_next, size: 25,color: Colors.white,),
                ],
              ),
            ),

        );
  }

  Container optionListC() {
    return Container(
          color: Colors.white,
          width: _screenWidth,
          height: 0.35 * _screenHeight ,
          child: Expanded(
            child: ListView.builder(
            itemCount:10 ,
            itemBuilder: ( context,index ){
              return Row(
                  children: [
                    Checkbox(
                      splashRadius: 50,
                      checkColor: Colors.white,
                      value: _isChecked,
                      shape: CircleBorder(),
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text( 'No Food Preference' ),
                  ],
              );
            },
            ),
          ),
        );
  }

  Container _questionContainer() {
    return Container(
          width: _screenWidth,
          height: _screenHeight * 0.2 ,
          color: _questionC,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.close,color: Colors.white,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question 1 of 7', style: TextStyle(color: Colors.white), ),
                  Text('What is your food preference?' , style: TextStyle(color: Colors.white), ),
                ],
              ),
            ],
          ),
        );
  }
}
