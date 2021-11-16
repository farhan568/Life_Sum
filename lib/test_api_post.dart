import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lifesum/model/api_post_model.dart';

class ApiPost extends StatefulWidget {
  const ApiPost({Key? key}) : super(key: key);

  @override
  State<ApiPost> createState() => _ApiPostState();
}

class _ApiPostState extends State<ApiPost> {
  TextEditingController fNameEditingController = TextEditingController();
  TextEditingController surNameEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();
  String firstName = '';
  String surName = '';
  int age = 0;
  File? _image;
  ImagePicker picker = ImagePicker();
  late double _screenWidth, _screenHeight;
  String imgUrl = '';

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),

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


            fieldsC(fNameEditingController, 'FirstName'),
            fieldsC(surNameEditingController, 'SurName'),
            fieldsC(ageEditingController, 'Age'),
            ElevatedButton(
              onPressed: () {
                sendData();
              },
              child: Text('Post'),
            )
          ],
        ),
      ),
    );
  }

  Container fieldsC(
      TextEditingController textEditingController, String hintText) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.cyan,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType:
            hintText == 'Age' ? TextInputType.number : TextInputType.text,
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }

  sendData() async {
    firstName = fNameEditingController.text;
    surName = surNameEditingController.text;
    age = int.parse(ageEditingController.text);
    ApiPostModel apiPostModel =
        ApiPostModel(age: age, firstName: firstName, surName: surName);

    var formData = FormData.fromMap({
      'firstName': firstName,
      'surName': surName,
      'age': age,
      'file': await MultipartFile.fromFile(_image!.path,
          filename: 'upload.txt'),
    });
    try {
//      Response response = await Dio().post('https://httpbin.org/post',data: apiPostModel.toJson()  );
      Response response =
          await Dio().post('https://httpbin.org/post', data: formData);
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
  Future _imgFromGallery() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

}
