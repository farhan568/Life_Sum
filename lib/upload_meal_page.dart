import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifesum/model/meal.dart';

class UploadMeal extends StatefulWidget {
  const UploadMeal({Key? key}) : super(key: key);

  @override
  State<UploadMeal> createState() => _UploadMealState();
}

class _UploadMealState extends State<UploadMeal> {
  late double _screenWidth, _screenHeight;
  final TextEditingController _mealTypeFController = TextEditingController();
  final TextEditingController _mealNameFController = TextEditingController();
  final TextEditingController _mealCalFController = TextEditingController();
  late String _mealName, _mealType, _mealCalories;
  late MealUploadModel mealUploadModel;

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/dish_1.jpg',
                  height: 0.1 * _screenHeight,
                  width: _screenWidth * 0.3,
                  fit: BoxFit.fill,
                ),
                InkWell(
                    onTap: () {
                      _uploadMeal();
                    },
                    child: Text('Add Meal')),
              ],
            ),
            uploadMealField(
              _mealTypeFController,
              'Meal Type',
            ),
            uploadMealField(
              _mealCalFController,
              'Meal Calories',
            ),
            uploadMealField(
              _mealNameFController,
              'Meal Name',
            ),
          ],
        ),
      ),
    );
  }

  TextField uploadMealField(
      TextEditingController textEditingController, String label) {
    return TextField(
      keyboardType:
          label == 'Meal Calories' ? TextInputType.number : TextInputType.text,
      controller: textEditingController,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          label: Text(label),
          labelStyle: TextStyle(
            color: Colors.green,
          )),
    );
  }

  _uploadMeal() async {
    _mealName = _mealNameFController.text;
    _mealType = _mealTypeFController.text;
    _mealCalories = _mealCalFController.text;

    final fbInstance = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "Farhan@gmail.com", password: 'Farhan123');

    final userId = FirebaseAuth.instance.currentUser!.uid;

    mealUploadModel = MealUploadModel(
        mealType: _mealType, mealName: _mealName, mealCalories: _mealCalories);
    try {
      await FirebaseFirestore.instance.collection('meal').add(
          mealUploadModel.toJson());
      print ( "Record  Updated Successfully" );
    }on FirebaseException catch (e){
      print(e.toString());
    }
  }
}
