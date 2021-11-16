import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher extends StatefulWidget {
  const MyUrlLauncher({Key? key}) : super(key: key);

  @override
  _MyUrlLauncherState createState() => _MyUrlLauncherState();
}

class _MyUrlLauncherState extends State<MyUrlLauncher> {
  final _url = 'https://flutter.dev';
  final _msgUrl = 'sms:5550101234';
  final _telUrl = 'tel:+1 555 010 999';
  final _emailUrl = 'smith@example.org?subject=News&body=New%20plugin';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: () {
            launchWebUrl();
          }, child: Text('Launch Flutter homepage')),
          ElevatedButton(onPressed: () {
            launchSMS();
          }, child: Text('Launch SMS')),
          ElevatedButton(onPressed: () {
            launchTel();
          }, child: Text('Launch Tel')),
        ],
      ),
    ));
  }

  launchWebUrl() async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }

  launchSMS() async {
    await canLaunch(_msgUrl) ? await launch(_msgUrl) : throw 'Could not launch $_msgUrl';
  }

  launchTel() async {
    await canLaunch(_telUrl) ? await launch(_telUrl) : throw 'Could not launch $_telUrl';
  }

  launchEmailTo() async {
    await canLaunch(_emailUrl) ? await launch(_emailUrl) : throw 'Could not launch $_emailUrl';
  }

}
