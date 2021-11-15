import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifesum/meal_planner_page.dart';
import 'package:lifesum/model/meal.dart';
import 'package:uuid/uuid.dart';

class UploadMeal extends StatefulWidget {
  const UploadMeal({Key? key}) : super(key: key);

  @override
  State<UploadMeal> createState() => _UploadMealState();
}

class _UploadMealState extends State<UploadMeal> {
  File? _image;
  ImagePicker picker = ImagePicker();
  late double _screenWidth, _screenHeight;
  final TextEditingController _mealTypeFController = TextEditingController();
  final TextEditingController _mealNameFController = TextEditingController();
  final TextEditingController _mealCalFController = TextEditingController();
  late String _mealName, _mealType, _mealCalories;
  late MealUploadModel mealUploadModel;
  String imgUrl = '';
  final _formKeyScreen1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            key: _formKeyScreen1,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: _screenHeight * 0.02,
                  ),
                  _image == null
                      ? Image.asset(
                    'assets/images/dish_1.jpg',
                    height: 0.15 * _screenHeight,
                    width: _screenWidth * 0.4,
                    fit: BoxFit.fill,
                  )
                      : Image.file(
                    _image!,
                    width: _screenWidth * 0.4,
                    height: _screenHeight * 0.15,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: _screenHeight * 0.02,
                  ),
                  InkWell(
                      onTap: () {
                        _imgFromGallery();
                      },
                      child: Text(
                        "Select Image",
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                  SizedBox(
                    height: _screenHeight * 0.02,
                  ),
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
              ElevatedButton(
                  onPressed: () {
                    showUploadAlertDialog(context);
                  },
                  child: Text('Add Meal')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MealPlanner()));
                  },
                  child: Text('Next'))
            ],
          ),
        ),
      ),
    );
  }

  Padding uploadMealField(TextEditingController textEditingController,
      String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: label == 'Meal Calories'
            ? TextInputType.number
            : TextInputType.text,
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
      ),
    );
  }

  _uploadMeal() async {
    showUploadingDialog(context);
    _mealName = _mealNameFController.text;
    _mealType = _mealTypeFController.text;
    _mealCalories = _mealCalFController.text;
    final fbInstance = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "Farhan@gmail.com", password: 'Farhan123');
    final userId = FirebaseAuth.instance.currentUser!.uid;
    await _uploadImage();
    mealUploadModel = MealUploadModel(
        mealType: _mealType,
        mealName: _mealName,
        mealCalories: _mealCalories,
        imgUrl: imgUrl);

    try {
      await FirebaseFirestore.instance
          .collection('meal')
          .add(mealUploadModel.toJson());
      _formKeyScreen1.currentState?.reset();
      Navigator.of(context).pop();
      showUploadSuccessDialog(context);
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  Future _imgFromGallery() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  _uploadImage() async {
    //uploading Image to Firebase
    String fileId = Uuid().v1();
    final userId = FirebaseAuth.instance.currentUser!.uid;
    try {
      await FirebaseStorage.instance
          .ref('$userId/$fileId')
          .child("Meal")
          .putFile(_image!);
      print("Upload Successful");
    } on FirebaseException catch (e) {
      print(e.toString());
    }

    // Getting Download URL

    try {
      imgUrl = await FirebaseStorage.instance
          .ref('$userId/$fileId')
          .child("Meal")
          .getDownloadURL();
      print(imgUrl);
//      setState(() {});
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }

  showUploadAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {  Navigator.of(context).pop();
        _uploadMeal();

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Upload Meal?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showUploadSuccessDialog(BuildContext context) {
    // set up the buttons
    Widget oKButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
        _fieldsResets();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Meal Uploaded"),
      content: Text("Meal was uploaded Succesfully"),
      actions: [
        oKButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showUploadingDialog(BuildContext context) {
    // set up the buttons

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
    title: Text("Meal Uploading"),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Uploading...."),
        CircularProgressIndicator()
      ],
    ),
    );

    // show the dialog
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return alert;
    },
    );
  }

  _fieldsResets() {
    _mealNameFController.clear();
    _mealCalFController.clear();
    _mealTypeFController.clear();
    _image = null;
    setState(() {

    });
  }
}
