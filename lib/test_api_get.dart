import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifesum/model/api_get_model.dart';
import 'package:lifesum/provider/api_provider.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatefulWidget {
  MyProvider({Key? key}) : super(key: key);

  @override
  State<MyProvider> createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  late double screenWidth;

  late double screenHeight;

  late List<ApiGetModel> apiList = [];
  late ApiProvider apiP;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    getData();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: SafeArea(
          child: Consumer<ApiProvider>(builder: (BuildContext context, model,  child) {
            apiP = model;
            return model.state==0?Center(child: CircularProgressIndicator(),):ListView.builder(itemCount: apiP.apiList.length, itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( "Tittle: " + apiP.apiList[index].title.toString() ),
                    Text( "id: " + apiP.apiList[index].id.toString() ),
                    Text( "userID: " + apiP.apiList[index].userId.toString() ),
                    Text( "Body: " + apiP.apiList[index].body.toString() ),
                  ],
                ),
              );
            },);
          },),
        )
      ),
    );
  }

  void getData() async {
    var apiData = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (apiData.statusCode == 200) {
      for (var data in apiData.data) {
        ApiGetModel model = ApiGetModel.fromJson(data);
        apiList.add(model);
      }
      apiP.setData(apiList, 1);
      print(apiP.apiList.length);
    }
  }
}
