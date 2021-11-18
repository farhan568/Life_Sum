import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPermissions extends StatefulWidget {
  const MyPermissions({Key? key}) : super(key: key);

  @override
  _MyPermissionsState createState() => _MyPermissionsState();
}

class _MyPermissionsState extends State<MyPermissions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                var status = await Permission.camera.status;
                if (status.isDenied) {
                  Fluttertoast.showToast(
                      msg: "Access is denied",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (await Permission.location.isRestricted) {
                  Fluttertoast.showToast(
                      msg: "Permission is restricted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (status.isGranted) {
                  Fluttertoast.showToast(
                      msg: "Permission Granted",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Text('Ask Permission'),
            ),
          ],
        ),
      ),
    );
  }
}
