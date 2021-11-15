import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickTrack extends StatefulWidget {
  const QuickTrack({Key? key}) : super(key: key);

  @override
  State<QuickTrack> createState() => _QuickTrackState();
}

class _QuickTrackState extends State<QuickTrack> {
  late double _screenWidth, _screenHeight;
  Color fieldInputC = Colors.grey;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.close),
                  SizedBox(
                    width: _screenWidth * 0.04,
                  ),
                  Text(
                    'QUICK TRACK',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.02,
            ),
            quickTrackFields('kcal', 'Required'),
            quickTrackFields('Carbs(g)', 'Optional'),
            quickTrackFields('Fat(g)', 'Optional'),
            quickTrackFields('Protein(g)', 'Optional'),
            quickTrackFields('Title', 'Optional'),
            SizedBox(
              height: _screenHeight * 0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Track'),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                padding: EdgeInsets.symmetric(
                    horizontal: _screenWidth * 0.4,
                    vertical: _screenHeight * 0.03),
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Padding quickTrackFields(String prefix, String suffix) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: _screenHeight * 0.02, horizontal: _screenWidth * 0.05),
      child: TextFormField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.end,
        decoration: InputDecoration(

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),

          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: fieldInputC),
          ),

          prefixIcon: Padding(
              padding: EdgeInsets.only(top: 0.015 * _screenHeight),
              child: Text(
                prefix,
                textAlign: TextAlign.center,
              )),
          hintText: suffix,
          hintStyle: TextStyle(color: fieldInputC),
        ),
      ),
    );
  }
}
